package user_test

import (
	"context"
	"flag"
	"fmt"
	"log/slog"
	"net"
	"os"
	"path/filepath"
	"testing"

	"github.com/canonical/ubuntu-desktop-provision/provd/internal/consts"
	"github.com/canonical/ubuntu-desktop-provision/provd/internal/services/user"
	"github.com/canonical/ubuntu-desktop-provision/provd/internal/testutils"
	pb "github.com/canonical/ubuntu-desktop-provision/provd/protos"
	"github.com/godbus/dbus/v5"
	"github.com/godbus/dbus/v5/introspect"
	"github.com/stretchr/testify/require"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials/insecure"
)

func TestEmptyCreateUserRequest(t *testing.T) {
	t.Parallel()

	client := newUserClient(t, "", "")

	userResp, err := client.CreateUser(context.Background(), nil)
	require.Error(t, err, "CreateUser should return an error for nil request")
	require.Empty(t, userResp, "CreateUser should return a nil response for a nil request")
}

func TestEmptyValidateUsernameRequest(t *testing.T) {
	t.Parallel()

	client := newUserClient(t, "", "")

	userResp, err := client.ValidateUsername(context.Background(), nil)
	require.Error(t, err, "ValidateUsername should return an error for nil request")
	require.Empty(t, userResp, "ValidateUsername should return a nil response for a nil request")
}

func TestDbusObjectsAvalible(t *testing.T) {
	t.Parallel()

	tests := map[string]struct {
		invalidAccounts bool
		invalidHostname bool
		wantErr         bool
	}{
		"Invalid accounts object": {
			invalidAccounts: true,
			wantErr:         true,
		},
		"Invalid hostname object": {
			invalidHostname: true,
			wantErr:         true,
		},
		"Valid objects": {
			wantErr: false,
		},
	}

	for name, tc := range tests {
		tc := tc
		t.Run(name, func(t *testing.T) {
			t.Parallel()
			t.Cleanup(testutils.StartLocalSystemBus())

			var opts []user.Option
			if tc.invalidAccounts {
				opts = append(opts, user.WithAccountsPrefix("invalid"))
			}
			if tc.invalidHostname {
				opts = append(opts, user.WithHostnamePrefix("invalid"))
			}

			_, err := user.New(testutils.NewDbusConn(t), opts...)
			if tc.wantErr {
				require.Error(t, err, "New should return an error, but did not")
				return
			}
			require.NoError(t, err, "New should not return an error, but did")
		})
	}
}

func TestCreateUser(t *testing.T) {
	t.Parallel()

	tests := map[string]struct {
		realName  string
		username  string
		password  string
		hostname  string
		autoLogin bool
		isAdmin   bool

		accountsError bool
		hostnameError bool

		wantErr bool

		accountsEndpoint string
		hostnameEndpoint string
	}{
		"Successfully creates a user": {
			realName:  "Ubuntu",
			username:  "ubuntu",
			password:  "password",
			hostname:  "ubuntu",
			isAdmin:   true,
			autoLogin: true,

			accountsEndpoint: "noerror",
			hostnameEndpoint: "noerror",
		},
		"Error when realName is empty": {
			realName:  "",
			username:  "ubuntu",
			password:  "password",
			hostname:  "ubuntu",
			autoLogin: true,
			wantErr:   true,

			accountsEndpoint: "noerror",
			hostnameEndpoint: "noerror",
		},
		"Error when username is empty": {
			realName:  "Ubuntu",
			username:  "",
			password:  "password",
			hostname:  "ubuntu",
			autoLogin: true,
			wantErr:   true,

			accountsEndpoint: "noerror",
			hostnameEndpoint: "noerror",
		},
		"Error when hostname is empty": {
			realName:  "Ubuntu",
			username:  "ubuntu",
			password:  "password",
			hostname:  "",
			autoLogin: true,
			wantErr:   true,

			accountsEndpoint: "noerror",
			hostnameEndpoint: "noerror",
		},
		"Error from Accounts service": {
			realName:      "Ubuntu",
			username:      "ubuntu",
			password:      "password",
			hostname:      "ubuntu",
			autoLogin:     true,
			accountsError: true,
			wantErr:       true,

			accountsEndpoint: "noerror",
			hostnameEndpoint: "error",
		},
		"Error from Hostname service": {
			realName:      "Ubuntu",
			username:      "ubuntu",
			password:      "password",
			hostname:      "ubuntu",
			autoLogin:     true,
			hostnameError: true,
			wantErr:       true,

			accountsEndpoint: "error",
			hostnameEndpoint: "noerror",
		},
	}

	for name, tc := range tests {
		tc := tc
		t.Run(name, func(t *testing.T) {
			t.Parallel()
			t.Cleanup(testutils.StartLocalSystemBus())

			client := newUserClient(t, tc.accountsEndpoint, tc.hostnameEndpoint)

			userReq := &pb.CreateUserRequest{
				User: &pb.User{
					RealName:  tc.realName,
					Username:  tc.username,
					Password:  tc.password,
					Hostname:  tc.hostname,
					AutoLogin: tc.autoLogin,
				},
				IsAdmin: tc.isAdmin,
			}

			_, err := client.CreateUser(context.Background(), userReq)
			if tc.wantErr {
				require.Error(t, err, "CreateUser should return an error, but did not")
				return
			}
			require.NoError(t, err, "CreateUser should not return an error, but did not")
		})
	}
}

func TestValidateUsername(t *testing.T) {
	t.Parallel()

	tests := map[string]struct {
		username      string
		accountsError bool
		wantErr       bool

		accountsEndpoint string
	}{
		"Valid username": {
			username:         "newuser",
			accountsError:    true,
			wantErr:          false,
			accountsEndpoint: "error",
		},
		"Existing username": {
			username:         "existinguser",
			wantErr:          false,
			accountsEndpoint: "noerror",
		},
		"Empty username": {
			username:         "",
			wantErr:          false,
			accountsEndpoint: "noerror",
		},
		"Reserved username": {
			username:         "root",
			wantErr:          false,
			accountsEndpoint: "noerror",
		},
		"Username too long": {
			username:         "thisusernameiswaytoolong1234567890abcdefghijklmnopqrstuvwxyz",
			wantErr:          false,
			accountsEndpoint: "noerror",
		},
		"Invalid characters in username": {
			username:         "invalid@username",
			wantErr:          false,
			accountsEndpoint: "noerror",
		},
	}

	for name, tc := range tests {
		tc := tc
		t.Run(name, func(t *testing.T) {
			t.Parallel()
			t.Cleanup(testutils.StartLocalSystemBus())

			client := newUserClient(t, tc.accountsEndpoint, "")

			validateReq := &pb.ValidateUsernameRequest{
				Username: tc.username,
			}

			resp, err := client.ValidateUsername(context.Background(), validateReq)
			if tc.wantErr {
				require.Error(t, err, "ValidateUsername should return an error, but did not")
				return
			}
			require.NoError(t, err, "ValidateUsername should not return an error, but did")

			got := resp.UsernameValidation.String()
			want := testutils.LoadWithUpdateFromGolden(t, got)
			require.Equal(t, want, got, "ValidateUsername returned an unexpected response")
		})
	}
}

// newUserClient creates a new user client for testing, with a temp unix socket and mock Dbus connection.
func newUserClient(t *testing.T, accountsEndpoint string, hostnameEndpoint string) pb.UserServiceClient {
	t.Helper()
	// socket path is limited in length.
	tmpDir, err := os.MkdirTemp("", "hello-socket-dir")
	require.NoError(t, err, "Setup: could not setup temporary socket dir path")
	t.Cleanup(func() { _ = os.RemoveAll(tmpDir) })
	socketPath := filepath.Join(tmpDir, "provd.sock")

	lis, err := net.Listen("unix", socketPath)
	require.NoError(t, err, "Setup: could not create unix socket")

	bus := testutils.NewDbusConn(t)

	// Concatenate provided paths with base paths
	fullAccountsPath := "/org/freedesktop/Accounts/" + accountsEndpoint
	fullHostnamePath := "/org/freedesktop/hostname1/" + hostnameEndpoint

	// Create the service with the necessary mocks
	service, err := user.New(bus, user.WithAccountsPath(fullAccountsPath), user.WithHostnamePath(fullHostnamePath))

	grpcServer := grpc.NewServer()
	pb.RegisterUserServiceServer(grpcServer, service)
	done := make(chan struct{})
	go func() {
		defer close(done)
		_ = grpcServer.Serve(lis)
	}()
	t.Cleanup(func() {
		grpcServer.Stop()
		<-done
	})

	conn, err := grpc.Dial("unix://"+socketPath, grpc.WithTransportCredentials(insecure.NewCredentials()))
	require.NoError(t, err, "Setup: Could not connect to GRPC server")
	t.Cleanup(func() { _ = conn.Close() })

	return pb.NewUserServiceClient(conn)
}


func (a accountsdbus) Ping() *dbus.Error {
	return nil
}

func (a accountsdbus) FindUserByName(name string) (string, *dbus.Error) {
	if a.wantError {
		return "", dbus.NewError("org.freedesktop.Accounts.Error.Failed", []interface{}{"error"})
	}
	return "/org/freedesktop/Accounts/Usernoerror", nil
}

func (a accountsdbus) CreateUser(username string, realname string, accountType int32) (string, *dbus.Error) {
	if a.wantError {
		return "", dbus.NewError("org.freedesktop.Accounts.Error.Failed", []interface{}{"error"})
	}
	return "/org/freedesktop/Accounts/Usernoerror", nil
}

type userdbus struct {
	endpoint  string
	wantError bool
}

func (u userdbus) SetPassword(password string, hint string) *dbus.Error {
	if u.wantError {
		return dbus.NewError("org.freedesktop.Accounts.Error.Failed", []interface{}{"error"})
	}
	return nil
}

func (u userdbus) SetAutomaticLogin(autoLogin bool) *dbus.Error {
	if u.wantError {
		return dbus.NewError("org.freedesktop.Accounts.Error.Failed", []interface{}{"error"})
	}
	return nil
}

type hostnamedbus struct {
	staticHostname string
}

func (h hostnamedbus) Ping() *dbus.Error {
	return nil
}

func (h hostnamedbus) SetStaticHostname(hostname string, someBool bool) *dbus.Error {
	if h.wantError {
		return dbus.NewError("org.freedesktop.hostname1.Error.Failed", []interface{}{"error"})
	}
	return nil
}

func TestMain(m *testing.M) {
	testutils.InstallUpdateFlag()
	flag.Parse()
	// export domains
	defer testutils.StartLocalSystemBus()()

	conn, err := dbus.SystemBusPrivate()
	if err != nil {
		slog.Error("Setup: can't get a private system bus: %v", err)
	}
	defer func() {
		if err = conn.Close(); err != nil {
			slog.Error("Teardown: can't close system dbus connection: %v", err)
		}
	}()
	if err = conn.Auth(nil); err != nil {
		slog.Error("Setup: can't auth on private system bus: %v", err)
	}
	if err = conn.Hello(); err != nil {
		slog.Error("Setup: can't send hello message on private system bus: %v", err)
	}

	peer := fmt.Sprintf(`
	<node>
		<interface name="%s">
            <method name="Ping">
			</method>
		</interface>̀%s</node>`, "org.freedesktop.DBus.Peer", introspect.IntrospectDataString)

	intro := fmt.Sprintf(`
	<node>
		<interface name="%s">
            <method name="FindUserByName">
              <arg name="name" direction="in" type="s"/>
              <arg name="user" direction="out" type="o"/>
			</method>
            <method name="CreateUser">
              <arg name="username" direction="in" type="s"/>
              <arg name="realName" direction="in" type="s"/>
              <arg name="accountType" direction="in" type="i"/>
              <arg name="user" direction="out" type="o"/>
			</method>
		</interface>̀%s</node>`, consts.DbusAccountsPrefix, introspect.IntrospectDataString)

	if err := conn.Export(a, dbus.ObjectPath("/org/freedesktop/Accounts"), consts.DbusAccountsPrefix); err != nil {
		slog.Error("Setup: could not export Accounts mock %v", err)
		}
	if err := conn.Export(introspect.Introspectable(intro), dbus.ObjectPath("/org/freedesktop/Accounts"),
			"org.freedesktop.DBus.Introspectable"); err != nil {
		slog.Error("Setup: could not export introspectable for accoutns mock: %v", err)
	}

	if err := conn.Export(a, dbus.ObjectPath("/org/freedesktop/Accounts"), "org.freedesktop.DBus.Peer"); err != nil {
		slog.Error("Setup: could not export Peer mock %v", err)
	}

	if err := conn.Export(introspect.Introspectable(peer), dbus.ObjectPath("/org/freedesktop/Accounts"),
		"org.freedesktop.DBus.Introspectable"); err != nil {
		slog.Error("Setup: could not export introspectable for Peer mock: %v", err)
	}

	reply, err := conn.RequestName(consts.DbusAccountsPrefix, dbus.NameFlagDoNotQueue)
	if err != nil {
		slog.Error("Setup: Failed to acquire account name on local system bus: %v", err)
	}
	if reply != dbus.RequestNameReplyPrimaryOwner {
		slog.Error("Setup: Failed to acquire account name on local system bus: name is already taken")
	}

	// user dbus

	userIntro := fmt.Sprintf(`
	<node>
		<interface name="%s">
            <method name="SetPassword">
              <arg name="name" direction="in" type="s"/>
              <arg name="hint" direction="in" type="s"/>
			</method>
            <method name="SetAutomaticLogin">
              <arg name="autoLogin" direction="in" type="b"/>
			</method>
		</interface>̀%s</node>`, consts.DbusUserPrefix, introspect.IntrospectDataString)

	for _, s := range []userdbus{
		{
			endpoint:  "error",
			wantError: true,
		},
		{
			endpoint:  "noerror",
			wantError: false,
		},
	} {
		if err := conn.Export(s, dbus.ObjectPath("/org/freedesktop/Accounts/User"+s.endpoint), consts.DbusUserPrefix); err != nil {
			slog.Error("Setup: could not export %s %v", s.endpoint, err)
		}
		if err := conn.Export(introspect.Introspectable(userIntro), dbus.ObjectPath("/org/freedesktop/Accounts/User"+s.endpoint),
			"org.freedesktop.DBus.Introspectable"); err != nil {
			slog.Error("Setup: could not export introspectable for %s: %v", s.endpoint, err)
		}
	}
	reply, err = conn.RequestName(consts.DbusUserPrefix, dbus.NameFlagDoNotQueue)
	if err != nil {
		slog.Error("Setup: Failed to acquire user name on local system bus: %v", err)
	}
	if reply != dbus.RequestNameReplyPrimaryOwner {
		slog.Error("Setup: Failed to acquire user name on local system bus: name is already taken")
	}

	// hostname dbus
	hostnameIntro := fmt.Sprintf(`
	<node>
		<interface name="%s">
            <method name="SetStaticHostname">
              <arg name="hostname" direction="in" type="s"/>
              <arg name="someBool" direction="in" type="b"/>
            </method>
			<property name="StaticHostname" type="s" access="read"/>
		</interface>
		<interface name="org.freedesktop.DBus.Properties">
			<method name="Get">
				<arg name="interface" direction="in" type="s"/>
				<arg name="property" direction="in" type="s"/>
				<arg name="value" direction="out" type="v"/>
			</method>
		</interface>
	</node>`, consts.DbusHostnamePrefix)

	if err := conn.Export(h, dbus.ObjectPath("/org/freedesktop/hostname1"), consts.DbusHostnamePrefix); err != nil {
		slog.Error("Setup: could not export hostname1 mock: %v", err)
	}
	if err := conn.Export(introspect.Introspectable(hostnameIntro), dbus.ObjectPath("/org/freedesktop/hostname1"),
			"org.freedesktop.DBus.Introspectable"); err != nil {
		slog.Error("Setup: could not export introspectable for hostname1 mock: %v", err)
	}

	if err := conn.Export(h, dbus.ObjectPath("/org/freedesktop/hostname1"), "org.freedesktop.DBus.Peer"); err != nil {
		slog.Error("Setup: could not export Peer mock %v", err)
	}

	if err := conn.Export(introspect.Introspectable(peer), dbus.ObjectPath("/org/freedesktop/hostname1"),
		"org.freedesktop.DBus.Introspectable"); err != nil {
		slog.Error("Setup: could not export introspectable for Peer mock: %v", err)
	}

	reply, err = conn.RequestName(consts.DbusHostnamePrefix, dbus.NameFlagDoNotQueue)
	if err != nil {
		slog.Error("Setup: Failed to acquire user name on local system bus: %v", err)
	}
	if reply != dbus.RequestNameReplyPrimaryOwner {
		slog.Error("Setup: Failed to acquire user name on local system bus: name is already taken")
	}

	m.Run()
}
