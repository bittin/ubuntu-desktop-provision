import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gsettings/gsettings.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_bootstrap/app/installation_step.dart';
import 'package:ubuntu_bootstrap/l10n.dart';
import 'package:ubuntu_bootstrap/services.dart';
import 'package:ubuntu_provision/ubuntu_provision.dart';
import 'package:ubuntu_wizard/ubuntu_wizard.dart';
import 'package:yaru/yaru.dart';

import '../../../packages/ubuntu_provision/test/test_utils.mocks.dart';

export '../../../packages/ubuntu_provision/test/test_utils.mocks.dart';
export 'test_utils.mocks.dart';

extension WidgetTesterX on WidgetTester {
  static Type context = WizardPage;

  UbuntuBootstrapLocalizations get lang {
    final widget = element(find.byType(context).first);
    return UbuntuBootstrapLocalizations.of(widget);
  }

  Future<void> pumpApp(WidgetBuilder builder) async {
    return pumpWidget(buildApp(builder));
  }

  Future<void> pumpContainer(String name, WidgetBuilder builder) async {
    return pumpWidget(
      Container(key: ValueKey(name), child: buildApp(builder)),
    );
  }

  Widget buildApp(WidgetBuilder builder) {
    view.devicePixelRatio = 1;
    view.physicalSize = const Size(960, 680);

    return MaterialApp(
      localizationsDelegates: GlobalUbuntuBootstrapLocalizations.delegates,
      theme: yaruLight,
      home: Wizard(
        routes: {
          '/': WizardRoute(
            builder: builder,
            onNext: (settings) => '/next',
          ),
          '/next': WizardRoute(
            builder: (_) => const Row(
              children: [
                Text('Next page'),
                BackWizardButton(),
              ],
            ),
          ),
        },
      ),
    );
  }
}

@GenerateMocks([
  GSettings,
  InstallerService,
  PostInstallService,
  RefreshService,
  StorageService,
  PageImages,
])
class _Dummy {} // ignore: unused_element

/// Registers a mock [PageConfigService].
///
/// The [overridePages] argument will override the pages that are returned
/// if provided. All pages defined in [InstallationStep] except `try-or-install`
/// are returned by default.
MockPageConfigService setupMockPageConfig({
  Map<String, PageConfigEntry>? overridePages,
  Iterable<String>? overridePageKeys,
  bool isOem = false,
  bool includeTryOrInstall = false,
}) {
  final simpleOverrides =
      overridePageKeys?.map((key) => MapEntry(key, const PageConfigEntry()));
  final pages = overridePages ??
      Map.fromEntries(
        simpleOverrides ??
            InstallationStep.values.map(
              (step) => MapEntry(step.name, const PageConfigEntry()),
            ),
      );
  final pageConfigService = MockPageConfigService();
  registerMockService<PageConfigService>(pageConfigService);
  when(pageConfigService.pages).thenReturn(pages);
  when(pageConfigService.isOem).thenReturn(isOem);
  when(pageConfigService.includeTryOrInstall).thenReturn(includeTryOrInstall);
  return pageConfigService;
}

const keyboardSetup = KeyboardSetup(
  setting: KeyboardSetting(layout: 'us', variant: 'altgr-intl'),
  layouts: [
    KeyboardLayout(
      code: 'us',
      name: 'English (US)',
      variants: [
        KeyboardVariant(
          code: '',
          name: 'English (US)',
        ),
        KeyboardVariant(
          code: 'altgr-intl',
          name: 'English (US) - English (intl., with AltGr dead keys)',
        ),
      ],
    ),
    KeyboardLayout(
      code: 'de',
      name: 'German',
      variants: [KeyboardVariant(code: '', name: 'German')],
    ),
  ],
);

class MockBuildContext extends Mock implements BuildContext {}
