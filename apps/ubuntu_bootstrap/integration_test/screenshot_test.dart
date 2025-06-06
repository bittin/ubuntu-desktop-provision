import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_bootstrap/app/installation_step.dart';
import 'package:ubuntu_bootstrap/ubuntu_bootstrap.dart';
import 'package:ubuntu_provision/ubuntu_provision.dart';
import 'package:ubuntu_provision_test/ubuntu_provision_test.dart';
import 'package:ubuntu_test/ubuntu_test.dart';
import 'package:ubuntu_utils/ubuntu_utils.dart';
import 'package:yaru/yaru.dart';
import 'package:yaru_test/yaru_test.dart';

// TODO: These tests will only pass if run as a group, not individually. This is a known limitation
// tracked by this issue: https://github.com/canonical/ubuntu-desktop-provision/issues/861

Future<void> main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  final window = await YaruWindow.ensureInitialized();

  setUpAll(() => autoUpdateGoldenFiles = true);

  setUp(() async {
    await cleanUpSubiquity();
    registerMockService<DesktopService>(FakeDesktopService());
    registerMockService<ProductService>(FakeProductService());
    await YaruWindowTitleBar.ensureInitialized();
    return YaruTestWindow.ensureInitialized(
      state: const YaruWindowState(isActive: true, isClosable: true),
    );
  });

  tearDown(() async {
    final windowClosed = YaruTestWindow.waitForClosed();
    await window.close();
    await windowClosed;
    await resetAllServices();
    rootBundle.clear();
  });

  testWidgets(
    'locale',
    (tester) async {
      await tester.runApp(() => runInstallerApp([], theme: currentTheme));
      await tester.pumpAndSettle();

      await tester.testLocalePage(screenshot: '$currentThemeName/locale');
    },
    variant: themeVariant,
  );

  testWidgets(
    'accessibility',
    (tester) async {
      await tester.runApp(() => runInstallerApp([], theme: currentTheme));
      await tester.pumpAndSettle();

      await tester.jumpToPage(InstallationStep.accessibility.route);
      await tester.pumpAndSettle();

      await tester.testAccessibilityPage(
        screenshot: '$currentThemeName/accessibility',
      );
    },
    variant: themeVariant,
  );

  testWidgets(
    'rst',
    (tester) async {
      registerService<SubiquityClient>(FakeSubiquityClient.new);

      await tester.runApp(() => runInstallerApp([], theme: currentTheme));
      await tester.pumpAndSettle();

      await tester.jumpToPage(InstallationStep.rst.route);
      await tester.pumpAndSettle();

      await tester.testRstPage(
        screenshot: '$currentThemeName/rst',
      );
    },
    variant: themeVariant,
  );

  testWidgets(
    'keyboard',
    (tester) async {
      await tester.runApp(() => runInstallerApp([], theme: currentTheme));
      await tester.pumpAndSettle();

      await tester.jumpToPage(InstallationStep.keyboard.route);
      await tester.pumpAndSettle();

      await tester.testKeyboardPage(
        screenshot: '$currentThemeName/keyboard',
      );
    },
    variant: themeVariant,
  );

  testWidgets(
    'network',
    (tester) async {
      await tester.runApp(() => runInstallerApp([], theme: currentTheme));
      await tester.pumpAndSettle();

      await tester.jumpToPage(InstallationStep.network.route);
      await tester.pumpAndSettle();

      await tester.testNetworkPage(
        mode: ConnectMode.none,
        screenshot: '$currentThemeName/network',
      );
    },
    variant: themeVariant,
  );

  testWidgets(
    'refresh',
    (tester) async {
      await tester.runApp(() => runInstallerApp([], theme: currentTheme));
      await tester.pumpAndSettle();

      await tester.jumpToPage(InstallationStep.refresh.route);
      await tester.pumpAndSettle();

      await tester.testRefreshPage(
        screenshot: '$currentThemeName/refresh',
      );
    },
    variant: themeVariant,
  );

  testWidgets(
    'try-or-install',
    (tester) async {
      await tester
          .runApp(() => runInstallerApp(['--welcome'], theme: currentTheme));
      await tester.pumpAndSettle();

      await tester.jumpToPage(InstallationStep.tryOrInstall.route);
      await tester.pumpAndSettle();

      await tester.testTryOrInstallPage(
        option: TryOrInstallOption.installUbuntu,
        screenshot: '$currentThemeName/try-or-install',
      );
    },
    variant: themeVariant,
  );

  testWidgets('autoinstall', (tester) async {
    await tester.runApp(() => runInstallerApp([], theme: currentTheme));
    await tester.pumpAndSettle();

    await tester.jumpToPage(InstallationStep.autoinstall.route);
    await tester.pumpAndSettle();

    await tester.testAutoinstallPage(
      screenshot: '$currentThemeName/autoinstall',
    );
  });

  testWidgets(
    'source',
    (tester) async {
      await tester.runApp(() => runInstallerApp([], theme: currentTheme));
      await tester.pumpAndSettle();

      await tester.jumpToPage(InstallationStep.sourceSelection.route);
      await tester.pumpAndSettle();

      await tester.testSourceSelectionPage(
        screenshot: '$currentThemeName/source',
      );
    },
    variant: themeVariant,
  );

  testWidgets(
    'codecs-and-drivers',
    (tester) async {
      await tester.runApp(() => runInstallerApp([], theme: currentTheme));
      await tester.pumpAndSettle();

      await tester.jumpToPage(InstallationStep.codecsAndDrivers.route);
      await tester.pumpAndSettle();

      await tester.testCodecsAndDriversPage(
        screenshot: '$currentThemeName/codecs-and-drivers',
      );
    },
    variant: themeVariant,
  );

  testWidgets(
    'storage',
    (tester) async {
      await tester.runApp(() => runInstallerApp([], theme: currentTheme));
      await tester.pumpAndSettle();

      await tester.jumpToStorageWizard();
      await tester.pumpAndSettle();

      await tester.testStoragePage(
        type: StorageType.erase,
        screenshot: '$currentThemeName/storage',
      );
    },
    variant: themeVariant,
  );

  testWidgets(
    'storage-advanced-features',
    (tester) async {
      await tester.runApp(
        () => runInstallerApp(
          [
            '--dry-run-config=examples/dry-run-configs/tpm.yaml',
          ],
          theme: currentTheme,
        ),
      );
      await tester.pumpAndSettle();

      await tester.jumpToStorageWizard();
      await tester.pumpAndSettle();

      await tester.testStoragePage(type: StorageType.erase);
      await tester.testGuidedCapabilityPage(
        guidedCapability: GuidedCapability.LVM,
        screenshot: '$currentThemeName/storage-advanced-features',
      );
    },
    variant: themeVariant,
  );

  testWidgets(
    'storage-alongside-windows',
    (tester) async {
      await tester.runApp(
        () => runInstallerApp(
          [
            '--machine-config=examples/machines/win10.json',
          ],
          theme: currentTheme,
        ),
      );
      await tester.pumpAndSettle();

      await tester.jumpToStorageWizard();
      await tester.pumpAndSettle();

      await tester.testStoragePage(
        type: StorageType.alongside,
        screenshot: '$currentThemeName/storage-alongside-windows',
        hasBitLocker: true,
      );
    },
    variant: themeVariant,
  );

  testWidgets(
    'storage-manual',
    (tester) async {
      await tester.runApp(
        () => runInstallerApp(
          [
            '--',
            '--bootloader=uefi',
          ],
          theme: currentTheme,
        ),
      );
      await tester.pumpAndSettle();

      await tester.jumpToStorageWizard();
      await tester.pumpAndSettle();

      await tester.testStoragePage(type: StorageType.manual);

      await tester.testManualStoragePage(
        storage: [
          fakeDisk(
            path: '/dev/sda',
            partitions: [
              Partition(
                size: toBytes(50, DataUnit.gigabytes),
                mount: '/',
                path: '/dev/sda1',
              ),
            ],
          ),
        ],
        screenshot: '$currentThemeName/storage-manual',
      );
    },
    variant: themeVariant,
  );

  testWidgets(
    'storage-guided-resize',
    (tester) async {
      await tester.runApp(
        () => runInstallerApp(
          [
            '--machine-config=examples/machines/win10-along-ubuntu.json',
            '--',
            '--bootloader=uefi',
          ],
          theme: currentTheme,
        ),
      );
      await tester.pumpAndSettle();

      await tester.jumpToStorageWizard();
      await tester.pumpAndSettle();

      await tester.testStoragePage(type: StorageType.alongside);

      await tester.testGuidedResizePage(
        size: 30,
        screenshot: '$currentThemeName/storage-guided-resize',
      );
    },
    variant: themeVariant,
  );

  testWidgets(
    'storage-guided-reformat',
    (tester) async {
      await tester.runApp(
        () => runInstallerApp(
          [
            '--machine-config=examples/machines/imsm.json',
          ],
          theme: currentTheme,
        ),
      );
      await tester.pumpAndSettle();

      await tester.jumpToStorageWizard();
      await tester.pumpAndSettle();

      await tester.testStoragePage(type: StorageType.erase);

      await tester.testGuidedReformatPage(
        screenshot: '$currentThemeName/storage-guided-reformat',
      );
    },
    variant: themeVariant,
  );

  testWidgets(
    'not-enough-space',
    (tester) async {
      final client = FakeSubiquityClient();
      registerServiceInstance<SubiquityClient>(client);

      final service = FakeStorageService(client);
      registerServiceInstance<StorageService>(service);

      await tester.runApp(() => runInstallerApp([], theme: currentTheme));
      await tester.pumpAndSettle();

      await tester.jumpToPage(InstallationStep.sourceSelection.route);
      await tester.jumpToPage(InstallationStep.notEnoughDiskSpace.route);
      await tester.pumpAndSettle();

      await tester.testNotEnoughDiskSpacePage(
        screenshot: '$currentThemeName/not-enough-space',
      );
    },
    variant: themeVariant,
  );

  testWidgets(
    'passphrase type',
    (tester) async {
      await tester.runApp(
        () => runInstallerApp(
          [
            '--dry-run-config=examples/dry-run-configs/tpm.yaml',
          ],
          theme: currentTheme,
        ),
      );
      await tester.pumpAndSettle();

      await tester.jumpToStorageWizard();
      await tester.pumpAndSettle();

      await tester.testStoragePage(
        type: StorageType.erase,
      );

      await tester.testGuidedCapabilityPage(
        guidedCapability: GuidedCapability.CORE_BOOT_ENCRYPTED,
      );

      await tester.testPassphraseTypePage(
        screenshot: '$currentThemeName/passphrase-type',
      );
    },
    variant: themeVariant,
  );

  testWidgets(
    'passphrase',
    (tester) async {
      await tester.runApp(
        () => runInstallerApp(
          [
            '--machine-config=examples/machines/win10-along-ubuntu.json',
          ],
          theme: currentTheme,
        ),
      );
      await tester.pumpAndSettle();

      await tester.jumpToStorageWizard();
      await tester.pumpAndSettle();

      await tester.testStoragePage(
        type: StorageType.erase,
      );

      await tester.testGuidedCapabilityPage(
        guidedCapability: GuidedCapability.LVM_LUKS,
      );

      await tester.testPassphrasePage(
        passphrase: 'password',
        screenshot: '$currentThemeName/passphrase',
      );
    },
    variant: themeVariant,
  );

  testWidgets(
    'identity',
    (tester) async {
      await tester.runApp(() => runInstallerApp([], theme: currentTheme));
      await tester.pumpAndSettle();

      await tester.jumpToPage(InstallationStep.identity.route);
      await tester.pumpAndSettle();

      await tester.testIdentityPage(
        identity: const Identity(
          realname: 'Ubuntu User',
          hostname: 'ubuntu',
          username: 'user',
        ),
        password: 'password',
        screenshot: '$currentThemeName/identity',
      );
    },
    variant: themeVariant,
  );

  testWidgets(
    'active-directory',
    (tester) async {
      final client = FakeSubiquityClient();
      registerServiceInstance<SubiquityClient>(client);

      final service = FakeActiveDirectoryService(client);
      registerServiceInstance<ActiveDirectoryService>(service);

      await tester.runApp(() => runInstallerApp([], theme: currentTheme));
      await tester.pumpAndSettle();

      await tester.jumpToPage(InstallationStep.activeDirectory.route);
      await tester.pumpAndSettle();

      await tester.testActiveDirectoryPage(
        adminName: 'admin',
        password: 'password',
        screenshot: '$currentThemeName/active-directory',
      );
    },
    variant: themeVariant,
  );

  testWidgets(
    'timezone',
    (tester) async {
      await tester.runApp(() => runInstallerApp([], theme: currentTheme));
      await tester.pumpAndSettle();

      await tester.jumpToPage(InstallationStep.timezone.route);
      await tester.pumpAndSettle();

      await tester.testTimezonePage(
        screenshot: '$currentThemeName/timezone',
        shouldNavigate: false,
      );
    },
    variant: themeVariant,
  );

  testWidgets(
    'confirm',
    (tester) async {
      await tester.runApp(
        () => runInstallerApp(
          [
            '--',
            '--bootloader=uefi',
          ],
          theme: currentTheme,
        ),
      );
      await tester.pumpAndSettle();

      await tester.jumpToStorageWizard();
      await tester.pumpAndSettle();

      await tester.testStoragePage(
        type: StorageType.erase,
      );
      await tester.testGuidedCapabilityPage();

      await tester.testIdentityPage(
        identity: const Identity(
          realname: 'Ubuntu User',
          hostname: 'ubuntu',
          username: 'user',
        ),
        password: 'password',
      );

      await tester.testTimezonePage();

      await tester.testConfirmPage(
        screenshot: '$currentThemeName/confirm',
      );
      await tester.pumpAndSettle();
    },
    variant: themeVariant,
  );

  testWidgets(
    'install',
    (tester) async {
      await YaruTestWindow.ensureInitialized(
        state: const YaruWindowState(isActive: true, isClosable: false),
      );

      await tester.runApp(() => runInstallerApp([], theme: currentTheme));
      await tester.pumpAndSettle();

      await tester.jumpToPage(InstallationStep.install.route);
      await tester.pump(kThemeAnimationDuration);
      const defaultSlidesCount = 10;

      for (var i = 0; i < defaultSlidesCount; ++i) {
        await tester.takeScreenshot(
          '$currentThemeName/install-$i',
        );
        if (i < defaultSlidesCount - 1) {
          await tester.tap(find.iconButton(YaruIcons.pan_end));
          await tester.pump(kThemeAnimationDuration);
        }
      }
    },
    variant: themeVariant,
  );

  testWidgets(
    'complete',
    (tester) async {
      registerService<SubiquityClient>(
        () => FakeSubiquityClient(ApplicationState.DONE),
      );

      await tester.runApp(() => runInstallerApp([], theme: currentTheme));
      await tester.pumpAndSettle();

      await tester.jumpToPage(InstallationStep.done.route);
      await tester.pumpAndSettle();

      await tester.testDonePage(
        screenshot: '$currentThemeName/complete',
      );
    },
    variant: themeVariant,
  );
}

class FakeActiveDirectoryService extends SubiquityActiveDirectoryService {
  FakeActiveDirectoryService(super.client);

  @override
  Future<bool> isUsed() async => true;
}

class FakeDesktopService implements DesktopService {
  @override
  Future<void> inhibit() async {}

  @override
  Future<void> close() async {}
}

class FakeProductService implements ProductService {
  @override
  ProductInfo getProductInfo() =>
      const ProductInfo(name: 'Ubuntu', version: '23.04');

  @override
  String getReleaseNotesURL(String languageCode) =>
      'https://wiki.ubuntu.com/ManticMinotaur/ReleaseNotes';
}

class FakeStorageService extends StorageService {
  FakeStorageService(super.client);

  @override
  int get installMinimumSize => 24426577920;

  @override
  int get largestDiskSize => 16284385280;
}

class FakeSubiquityClient extends SubiquityClient {
  FakeSubiquityClient([this.state = ApplicationState.WAITING]);

  final ApplicationState state;

  @override
  Future<ApplicationStatus> getStatus({ApplicationState? current}) async {
    return fakeApplicationStatus(state);
  }

  @override
  Stream<ApplicationStatus?> monitorStatus() {
    return Stream.value(fakeApplicationStatus(state));
  }

  @override
  Future<bool> hasRst() async => true;
}

ThemeData get currentTheme => themeVariant.currentValue!;
String get currentThemeName => themeVariant.currentName;

final themeVariant = YaruThemeVariant();

extension on WidgetTester {
  Future<void> jumpToStorageWizard() async {
    // an installation source must be explicitly selected before calling storage APIs
    await jumpToPage(InstallationStep.sourceSelection.route);
    await tapNext();
    await pumpAndSettle();
    await tapNext();
    await pumpUntil(find.byType(StorageWizard));
  }
}
