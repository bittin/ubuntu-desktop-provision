// Mocks generated by Mockito 5.3.2 from annotations
// in ubuntu_test/src/generated.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:dbus/dbus.dart' as _i2;
import 'package:gsettings/src/gsettings.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;
import 'package:subiquity_client/src/client.dart' as _i7;
import 'package:subiquity_client/src/endpoint.dart' as _i4;
import 'package:subiquity_client/src/server.dart' as _i8;
import 'package:subiquity_client/src/server/process.dart' as _i9;
import 'package:subiquity_client/src/types.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeDBusValue_0 extends _i1.SmartFake implements _i2.DBusValue {
  _FakeDBusValue_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUri_1 extends _i1.SmartFake implements Uri {
  _FakeUri_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSourceSelectionAndSetting_2 extends _i1.SmartFake
    implements _i3.SourceSelectionAndSetting {
  _FakeSourceSelectionAndSetting_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeKeyboardSetup_3 extends _i1.SmartFake implements _i3.KeyboardSetup {
  _FakeKeyboardSetup_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeIdentityData_4 extends _i1.SmartFake implements _i3.IdentityData {
  _FakeIdentityData_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTimeZoneInfo_5 extends _i1.SmartFake implements _i3.TimeZoneInfo {
  _FakeTimeZoneInfo_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeApplicationStatus_6 extends _i1.SmartFake
    implements _i3.ApplicationStatus {
  _FakeApplicationStatus_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGuidedStorageResponseV2_7 extends _i1.SmartFake
    implements _i3.GuidedStorageResponseV2 {
  _FakeGuidedStorageResponseV2_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStorageResponseV2_8 extends _i1.SmartFake
    implements _i3.StorageResponseV2 {
  _FakeStorageResponseV2_8(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeWSLSetupOptions_9 extends _i1.SmartFake
    implements _i3.WSLSetupOptions {
  _FakeWSLSetupOptions_9(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeWSLConfigurationBase_10 extends _i1.SmartFake
    implements _i3.WSLConfigurationBase {
  _FakeWSLConfigurationBase_10(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeWSLConfigurationAdvanced_11 extends _i1.SmartFake
    implements _i3.WSLConfigurationAdvanced {
  _FakeWSLConfigurationAdvanced_11(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAnyStep_12 extends _i1.SmartFake implements _i3.AnyStep {
  _FakeAnyStep_12(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDriversResponse_13 extends _i1.SmartFake
    implements _i3.DriversResponse {
  _FakeDriversResponse_13(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeCodecsData_14 extends _i1.SmartFake implements _i3.CodecsData {
  _FakeCodecsData_14(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEndpoint_15 extends _i1.SmartFake implements _i4.Endpoint {
  _FakeEndpoint_15(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GSettings].
///
/// See the documentation for Mockito's code generation for more information.
class MockGSettings extends _i1.Mock implements _i5.GSettings {
  MockGSettings() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get schemaName => (super.noSuchMethod(
        Invocation.getter(#schemaName),
        returnValue: '',
      ) as String);
  @override
  _i6.Stream<List<String>> get keysChanged => (super.noSuchMethod(
        Invocation.getter(#keysChanged),
        returnValue: _i6.Stream<List<String>>.empty(),
      ) as _i6.Stream<List<String>>);
  @override
  _i6.Future<List<String>> list() => (super.noSuchMethod(
        Invocation.method(
          #list,
          [],
        ),
        returnValue: _i6.Future<List<String>>.value(<String>[]),
      ) as _i6.Future<List<String>>);
  @override
  _i6.Future<_i2.DBusValue> get(String? name) => (super.noSuchMethod(
        Invocation.method(
          #get,
          [name],
        ),
        returnValue: _i6.Future<_i2.DBusValue>.value(_FakeDBusValue_0(
          this,
          Invocation.method(
            #get,
            [name],
          ),
        )),
      ) as _i6.Future<_i2.DBusValue>);
  @override
  _i6.Future<_i2.DBusValue> getDefault(String? name) => (super.noSuchMethod(
        Invocation.method(
          #getDefault,
          [name],
        ),
        returnValue: _i6.Future<_i2.DBusValue>.value(_FakeDBusValue_0(
          this,
          Invocation.method(
            #getDefault,
            [name],
          ),
        )),
      ) as _i6.Future<_i2.DBusValue>);
  @override
  _i6.Future<bool> isSet(String? name) => (super.noSuchMethod(
        Invocation.method(
          #isSet,
          [name],
        ),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);
  @override
  _i6.Future<void> set(
    String? name,
    _i2.DBusValue? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #set,
          [
            name,
            value,
          ],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<void> unset(String? name) => (super.noSuchMethod(
        Invocation.method(
          #unset,
          [name],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<void> setAll(Map<String, _i2.DBusValue?>? values) =>
      (super.noSuchMethod(
        Invocation.method(
          #setAll,
          [values],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
}

/// A class which mocks [SubiquityClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockSubiquityClient extends _i1.Mock implements _i7.SubiquityClient {
  MockSubiquityClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<bool> get isOpen => (super.noSuchMethod(
        Invocation.getter(#isOpen),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);
  @override
  Uri url(
    String? unencodedPath, [
    Map<String, dynamic>? queryParameters,
  ]) =>
      (super.noSuchMethod(
        Invocation.method(
          #url,
          [
            unencodedPath,
            queryParameters,
          ],
        ),
        returnValue: _FakeUri_1(
          this,
          Invocation.method(
            #url,
            [
              unencodedPath,
              queryParameters,
            ],
          ),
        ),
      ) as Uri);
  @override
  void open(_i4.Endpoint? endpoint) => super.noSuchMethod(
        Invocation.method(
          #open,
          [endpoint],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i6.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<_i7.Variant> variant() => (super.noSuchMethod(
        Invocation.method(
          #variant,
          [],
        ),
        returnValue: _i6.Future<_i7.Variant>.value(_i7.Variant.SERVER),
      ) as _i6.Future<_i7.Variant>);
  @override
  _i6.Future<void> setVariant(_i7.Variant? variant) => (super.noSuchMethod(
        Invocation.method(
          #setVariant,
          [variant],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<_i3.SourceSelectionAndSetting> source() => (super.noSuchMethod(
        Invocation.method(
          #source,
          [],
        ),
        returnValue: _i6.Future<_i3.SourceSelectionAndSetting>.value(
            _FakeSourceSelectionAndSetting_2(
          this,
          Invocation.method(
            #source,
            [],
          ),
        )),
      ) as _i6.Future<_i3.SourceSelectionAndSetting>);
  @override
  _i6.Future<void> setSource(String? sourceId) => (super.noSuchMethod(
        Invocation.method(
          #setSource,
          [sourceId],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<String> locale() => (super.noSuchMethod(
        Invocation.method(
          #locale,
          [],
        ),
        returnValue: _i6.Future<String>.value(''),
      ) as _i6.Future<String>);
  @override
  _i6.Future<void> setLocale(String? locale) => (super.noSuchMethod(
        Invocation.method(
          #setLocale,
          [locale],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<_i3.KeyboardSetup> keyboard() => (super.noSuchMethod(
        Invocation.method(
          #keyboard,
          [],
        ),
        returnValue: _i6.Future<_i3.KeyboardSetup>.value(_FakeKeyboardSetup_3(
          this,
          Invocation.method(
            #keyboard,
            [],
          ),
        )),
      ) as _i6.Future<_i3.KeyboardSetup>);
  @override
  _i6.Future<void> setKeyboard(_i3.KeyboardSetting? setting) =>
      (super.noSuchMethod(
        Invocation.method(
          #setKeyboard,
          [setting],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<void> setInputSource(_i3.KeyboardSetting? setting) =>
      (super.noSuchMethod(
        Invocation.method(
          #setInputSource,
          [setting],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<String> proxy() => (super.noSuchMethod(
        Invocation.method(
          #proxy,
          [],
        ),
        returnValue: _i6.Future<String>.value(''),
      ) as _i6.Future<String>);
  @override
  _i6.Future<void> setProxy(String? proxy) => (super.noSuchMethod(
        Invocation.method(
          #setProxy,
          [proxy],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<String> mirror() => (super.noSuchMethod(
        Invocation.method(
          #mirror,
          [],
        ),
        returnValue: _i6.Future<String>.value(''),
      ) as _i6.Future<String>);
  @override
  _i6.Future<void> setMirror(String? mirror) => (super.noSuchMethod(
        Invocation.method(
          #setMirror,
          [mirror],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<bool> freeOnly() => (super.noSuchMethod(
        Invocation.method(
          #freeOnly,
          [],
        ),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);
  @override
  _i6.Future<void> setFreeOnly(bool? enable) => (super.noSuchMethod(
        Invocation.method(
          #setFreeOnly,
          [enable],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<_i3.IdentityData> identity() => (super.noSuchMethod(
        Invocation.method(
          #identity,
          [],
        ),
        returnValue: _i6.Future<_i3.IdentityData>.value(_FakeIdentityData_4(
          this,
          Invocation.method(
            #identity,
            [],
          ),
        )),
      ) as _i6.Future<_i3.IdentityData>);
  @override
  _i6.Future<void> setIdentity(_i3.IdentityData? identity) =>
      (super.noSuchMethod(
        Invocation.method(
          #setIdentity,
          [identity],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<_i3.UsernameValidation> validateUsername(String? username) =>
      (super.noSuchMethod(
        Invocation.method(
          #validateUsername,
          [username],
        ),
        returnValue:
            _i6.Future<_i3.UsernameValidation>.value(_i3.UsernameValidation.OK),
      ) as _i6.Future<_i3.UsernameValidation>);
  @override
  _i6.Future<_i3.TimeZoneInfo> timezone() => (super.noSuchMethod(
        Invocation.method(
          #timezone,
          [],
        ),
        returnValue: _i6.Future<_i3.TimeZoneInfo>.value(_FakeTimeZoneInfo_5(
          this,
          Invocation.method(
            #timezone,
            [],
          ),
        )),
      ) as _i6.Future<_i3.TimeZoneInfo>);
  @override
  _i6.Future<void> setTimezone(String? timezone) => (super.noSuchMethod(
        Invocation.method(
          #setTimezone,
          [timezone],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<_i3.ApplicationStatus> status({_i3.ApplicationState? current}) =>
      (super.noSuchMethod(
        Invocation.method(
          #status,
          [],
          {#current: current},
        ),
        returnValue:
            _i6.Future<_i3.ApplicationStatus>.value(_FakeApplicationStatus_6(
          this,
          Invocation.method(
            #status,
            [],
            {#current: current},
          ),
        )),
      ) as _i6.Future<_i3.ApplicationStatus>);
  @override
  _i6.Future<void> markConfigured(List<String>? endpointNames) =>
      (super.noSuchMethod(
        Invocation.method(
          #markConfigured,
          [endpointNames],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<void> confirm(String? tty) => (super.noSuchMethod(
        Invocation.method(
          #confirm,
          [tty],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<bool> hasRst() => (super.noSuchMethod(
        Invocation.method(
          #hasRst,
          [],
        ),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);
  @override
  _i6.Future<bool> hasBitLocker() => (super.noSuchMethod(
        Invocation.method(
          #hasBitLocker,
          [],
        ),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);
  @override
  _i6.Future<_i3.GuidedStorageResponseV2> getGuidedStorageV2(
          {bool? wait = true}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getGuidedStorageV2,
          [],
          {#wait: wait},
        ),
        returnValue: _i6.Future<_i3.GuidedStorageResponseV2>.value(
            _FakeGuidedStorageResponseV2_7(
          this,
          Invocation.method(
            #getGuidedStorageV2,
            [],
            {#wait: wait},
          ),
        )),
      ) as _i6.Future<_i3.GuidedStorageResponseV2>);
  @override
  _i6.Future<_i3.GuidedStorageResponseV2> setGuidedStorageV2(
          _i3.GuidedChoiceV2? choice) =>
      (super.noSuchMethod(
        Invocation.method(
          #setGuidedStorageV2,
          [choice],
        ),
        returnValue: _i6.Future<_i3.GuidedStorageResponseV2>.value(
            _FakeGuidedStorageResponseV2_7(
          this,
          Invocation.method(
            #setGuidedStorageV2,
            [choice],
          ),
        )),
      ) as _i6.Future<_i3.GuidedStorageResponseV2>);
  @override
  _i6.Future<_i3.StorageResponseV2> getOriginalStorageV2() =>
      (super.noSuchMethod(
        Invocation.method(
          #getOriginalStorageV2,
          [],
        ),
        returnValue:
            _i6.Future<_i3.StorageResponseV2>.value(_FakeStorageResponseV2_8(
          this,
          Invocation.method(
            #getOriginalStorageV2,
            [],
          ),
        )),
      ) as _i6.Future<_i3.StorageResponseV2>);
  @override
  _i6.Future<_i3.StorageResponseV2> getStorageV2({bool? wait = true}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getStorageV2,
          [],
          {#wait: wait},
        ),
        returnValue:
            _i6.Future<_i3.StorageResponseV2>.value(_FakeStorageResponseV2_8(
          this,
          Invocation.method(
            #getStorageV2,
            [],
            {#wait: wait},
          ),
        )),
      ) as _i6.Future<_i3.StorageResponseV2>);
  @override
  _i6.Future<_i3.StorageResponseV2> setStorageV2() => (super.noSuchMethod(
        Invocation.method(
          #setStorageV2,
          [],
        ),
        returnValue:
            _i6.Future<_i3.StorageResponseV2>.value(_FakeStorageResponseV2_8(
          this,
          Invocation.method(
            #setStorageV2,
            [],
          ),
        )),
      ) as _i6.Future<_i3.StorageResponseV2>);
  @override
  _i6.Future<_i3.StorageResponseV2> resetStorageV2() => (super.noSuchMethod(
        Invocation.method(
          #resetStorageV2,
          [],
        ),
        returnValue:
            _i6.Future<_i3.StorageResponseV2>.value(_FakeStorageResponseV2_8(
          this,
          Invocation.method(
            #resetStorageV2,
            [],
          ),
        )),
      ) as _i6.Future<_i3.StorageResponseV2>);
  @override
  _i6.Future<_i3.StorageResponseV2> addPartitionV2(
    _i3.Disk? disk,
    _i3.Gap? gap,
    _i3.Partition? partition,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #addPartitionV2,
          [
            disk,
            gap,
            partition,
          ],
        ),
        returnValue:
            _i6.Future<_i3.StorageResponseV2>.value(_FakeStorageResponseV2_8(
          this,
          Invocation.method(
            #addPartitionV2,
            [
              disk,
              gap,
              partition,
            ],
          ),
        )),
      ) as _i6.Future<_i3.StorageResponseV2>);
  @override
  _i6.Future<_i3.StorageResponseV2> editPartitionV2(
    _i3.Disk? disk,
    _i3.Partition? partition,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #editPartitionV2,
          [
            disk,
            partition,
          ],
        ),
        returnValue:
            _i6.Future<_i3.StorageResponseV2>.value(_FakeStorageResponseV2_8(
          this,
          Invocation.method(
            #editPartitionV2,
            [
              disk,
              partition,
            ],
          ),
        )),
      ) as _i6.Future<_i3.StorageResponseV2>);
  @override
  _i6.Future<_i3.StorageResponseV2> deletePartitionV2(
    _i3.Disk? disk,
    _i3.Partition? partition,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #deletePartitionV2,
          [
            disk,
            partition,
          ],
        ),
        returnValue:
            _i6.Future<_i3.StorageResponseV2>.value(_FakeStorageResponseV2_8(
          this,
          Invocation.method(
            #deletePartitionV2,
            [
              disk,
              partition,
            ],
          ),
        )),
      ) as _i6.Future<_i3.StorageResponseV2>);
  @override
  _i6.Future<_i3.StorageResponseV2> addBootPartitionV2(_i3.Disk? disk) =>
      (super.noSuchMethod(
        Invocation.method(
          #addBootPartitionV2,
          [disk],
        ),
        returnValue:
            _i6.Future<_i3.StorageResponseV2>.value(_FakeStorageResponseV2_8(
          this,
          Invocation.method(
            #addBootPartitionV2,
            [disk],
          ),
        )),
      ) as _i6.Future<_i3.StorageResponseV2>);
  @override
  _i6.Future<_i3.StorageResponseV2> reformatDiskV2(_i3.Disk? disk) =>
      (super.noSuchMethod(
        Invocation.method(
          #reformatDiskV2,
          [disk],
        ),
        returnValue:
            _i6.Future<_i3.StorageResponseV2>.value(_FakeStorageResponseV2_8(
          this,
          Invocation.method(
            #reformatDiskV2,
            [disk],
          ),
        )),
      ) as _i6.Future<_i3.StorageResponseV2>);
  @override
  _i6.Future<void> reboot({bool? immediate = false}) => (super.noSuchMethod(
        Invocation.method(
          #reboot,
          [],
          {#immediate: immediate},
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<void> shutdown({bool? immediate = false}) => (super.noSuchMethod(
        Invocation.method(
          #shutdown,
          [],
          {#immediate: immediate},
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<_i3.WSLSetupOptions> wslSetupOptions() => (super.noSuchMethod(
        Invocation.method(
          #wslSetupOptions,
          [],
        ),
        returnValue:
            _i6.Future<_i3.WSLSetupOptions>.value(_FakeWSLSetupOptions_9(
          this,
          Invocation.method(
            #wslSetupOptions,
            [],
          ),
        )),
      ) as _i6.Future<_i3.WSLSetupOptions>);
  @override
  _i6.Future<void> setWslSetupOptions(_i3.WSLSetupOptions? options) =>
      (super.noSuchMethod(
        Invocation.method(
          #setWslSetupOptions,
          [options],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<_i3.WSLConfigurationBase> wslConfigurationBase() =>
      (super.noSuchMethod(
        Invocation.method(
          #wslConfigurationBase,
          [],
        ),
        returnValue: _i6.Future<_i3.WSLConfigurationBase>.value(
            _FakeWSLConfigurationBase_10(
          this,
          Invocation.method(
            #wslConfigurationBase,
            [],
          ),
        )),
      ) as _i6.Future<_i3.WSLConfigurationBase>);
  @override
  _i6.Future<void> setWslConfigurationBase(_i3.WSLConfigurationBase? conf) =>
      (super.noSuchMethod(
        Invocation.method(
          #setWslConfigurationBase,
          [conf],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<_i3.WSLConfigurationAdvanced> wslConfigurationAdvanced() =>
      (super.noSuchMethod(
        Invocation.method(
          #wslConfigurationAdvanced,
          [],
        ),
        returnValue: _i6.Future<_i3.WSLConfigurationAdvanced>.value(
            _FakeWSLConfigurationAdvanced_11(
          this,
          Invocation.method(
            #wslConfigurationAdvanced,
            [],
          ),
        )),
      ) as _i6.Future<_i3.WSLConfigurationAdvanced>);
  @override
  _i6.Future<void> setWslConfigurationAdvanced(
          _i3.WSLConfigurationAdvanced? conf) =>
      (super.noSuchMethod(
        Invocation.method(
          #setWslConfigurationAdvanced,
          [conf],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<_i3.AnyStep> getKeyboardStep([String? step = r'0']) =>
      (super.noSuchMethod(
        Invocation.method(
          #getKeyboardStep,
          [step],
        ),
        returnValue: _i6.Future<_i3.AnyStep>.value(_FakeAnyStep_12(
          this,
          Invocation.method(
            #getKeyboardStep,
            [step],
          ),
        )),
      ) as _i6.Future<_i3.AnyStep>);
  @override
  _i6.Future<_i3.DriversResponse> getDrivers() => (super.noSuchMethod(
        Invocation.method(
          #getDrivers,
          [],
        ),
        returnValue:
            _i6.Future<_i3.DriversResponse>.value(_FakeDriversResponse_13(
          this,
          Invocation.method(
            #getDrivers,
            [],
          ),
        )),
      ) as _i6.Future<_i3.DriversResponse>);
  @override
  _i6.Future<void> setDrivers({required bool? install}) => (super.noSuchMethod(
        Invocation.method(
          #setDrivers,
          [],
          {#install: install},
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<_i3.CodecsData> getCodecs() => (super.noSuchMethod(
        Invocation.method(
          #getCodecs,
          [],
        ),
        returnValue: _i6.Future<_i3.CodecsData>.value(_FakeCodecsData_14(
          this,
          Invocation.method(
            #getCodecs,
            [],
          ),
        )),
      ) as _i6.Future<_i3.CodecsData>);
  @override
  _i6.Future<void> setCodecs({required bool? install}) => (super.noSuchMethod(
        Invocation.method(
          #setCodecs,
          [],
          {#install: install},
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
}

/// A class which mocks [SubiquityServer].
///
/// See the documentation for Mockito's code generation for more information.
class MockSubiquityServer extends _i1.Mock implements _i8.SubiquityServer {
  MockSubiquityServer() {
    _i1.throwOnMissingStub(this);
  }

  @override
  set process(_i9.SubiquityProcess? _process) => super.noSuchMethod(
        Invocation.setter(
          #process,
          _process,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i4.Endpoint get endpoint => (super.noSuchMethod(
        Invocation.getter(#endpoint),
        returnValue: _FakeEndpoint_15(
          this,
          Invocation.getter(#endpoint),
        ),
      ) as _i4.Endpoint);
  @override
  _i6.Future<_i4.Endpoint> start({
    List<String>? args,
    Map<String, String>? environment,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #start,
          [],
          {
            #args: args,
            #environment: environment,
          },
        ),
        returnValue: _i6.Future<_i4.Endpoint>.value(_FakeEndpoint_15(
          this,
          Invocation.method(
            #start,
            [],
            {
              #args: args,
              #environment: environment,
            },
          ),
        )),
      ) as _i6.Future<_i4.Endpoint>);
  @override
  _i6.Future<void> stop() => (super.noSuchMethod(
        Invocation.method(
          #stop,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
}
