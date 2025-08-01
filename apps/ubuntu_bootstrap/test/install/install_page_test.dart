import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_bootstrap/l10n.dart';
import 'package:ubuntu_bootstrap/pages/install/install_model.dart';
import 'package:ubuntu_bootstrap/pages/install/install_page.dart';
import 'package:ubuntu_bootstrap/pages/install/slide_view.dart';
import 'package:yaru/icons.dart';
import 'package:yaru_test/yaru_test.dart';

import 'test_install.dart';

void main() {
  setUpAll(YaruTestWindow.ensureInitialized);

  Finder findsSlide(String text) {
    return find.descendant(
      of: find.byType(SlideView),
      matching: find.text(text),
    );
  }

  testWidgets('show slides', (tester) async {
    final model = buildInstallModel();
    await tester.pumpApp((_) => buildPage(model));
    await tester.pumpAndSettle();

    expect(find.byType(SlideView), findsOneWidget);

    expect(findsSlide('slide_1'), findsOneWidget);
  });

  testWidgets('navigate slides', (tester) async {
    final model = buildInstallModel();
    await tester.pumpApp((_) => buildPage(model));
    await tester.pumpAndSettle();

    final backButton = find.iconButton(YaruIcons.pan_start);
    expect(backButton, findsOneWidget);

    final nextButton = find.iconButton(YaruIcons.pan_end);
    expect(nextButton, findsOneWidget);

    // initially at first slide
    expect(findsSlide('slide_1'), findsOneWidget);
    expect(findsSlide('slide_2'), findsNothing);
    expect(backButton, isDisabled);
    expect(nextButton, isEnabled);

    // go to second slide
    await tester.tap(nextButton);
    await tester.pumpAndSettle();
    expect(findsSlide('slide_1'), findsNothing);
    expect(findsSlide('slide_2'), findsOneWidget);
    expect(backButton, isEnabled);
    expect(nextButton, isDisabled);

    // back to first slide
    await tester.tap(backButton);
    await tester.pumpAndSettle();
    expect(findsSlide('slide_1'), findsOneWidget);
    expect(findsSlide('slide_2'), findsNothing);
    expect(backButton, isDisabled);
    expect(nextButton, isEnabled);
  });

  double getLogOffset(WidgetTester tester) {
    final slide = find.byType(AnimatedSlide);
    expect(slide, findsOneWidget);
    return tester.widget<AnimatedSlide>(slide).offset.dy;
  }

  testWidgets('show log', (tester) async {
    final model = buildInstallModel(isLogVisible: false);
    await tester.pumpApp((_) => buildPage(model));
    await tester.pumpAndSettle();

    expect(getLogOffset(tester), equals(1.0));

    await tester.tap(find.iconButton(YaruIcons.terminal));
    verify(model.toggleLogVisibility()).called(1);
  });

  testWidgets('hide log', (tester) async {
    final model = buildInstallModel(isLogVisible: true);
    await tester.pumpApp((_) => buildPage(model));
    await tester.pumpAndSettle();

    expect(getLogOffset(tester), equals(0.0));

    await tester.tap(find.iconButton(YaruIcons.terminal));
    verify(model.toggleLogVisibility()).called(1);
  });

  testWidgets('installation state', (tester) async {
    final model = buildInstallModel();
    await tester.pumpApp((_) => buildPage(model));
    await tester.pumpAndSettle();

    final context = tester.element(find.byType(InstallPage));
    final l10n = UbuntuBootstrapLocalizations.of(context);

    expect(find.text(l10n.copyingFiles), findsOneWidget);
    expect(find.text(l10n.installingSystem), findsNothing);
    expect(find.text(l10n.configuringSystem), findsNothing);
    expect(find.text(l10n.installationFailed), findsNothing);

    when(model.event)
        .thenReturn(InstallationEvent.fromString('installing system'));
    await tester.pumpContainer(
      'force rebuild for installing system',
      (_) => buildPage(model),
    );
    await tester.pump();

    expect(find.text(l10n.installingSystem), findsOneWidget);
    expect(find.text(l10n.copyingFiles), findsNothing);
    expect(find.text(l10n.configuringSystem), findsNothing);
    expect(find.text(l10n.installationFailed), findsNothing);

    when(model.event)
        .thenReturn(InstallationEvent.fromString('final system configuration'));
    await tester.pumpContainer(
      'force rebuild for configuring system',
      (_) => buildPage(model),
    );
    await tester.pump();

    expect(find.text(l10n.configuringSystem), findsOneWidget);
    expect(find.text(l10n.copyingFiles), findsNothing);
    expect(find.text(l10n.installingSystem), findsNothing);
    expect(find.text(l10n.installationFailed), findsNothing);

    when(model.hasError).thenReturn(true);
    await tester.pumpContainer(
      'force rebuild for hasError',
      (_) => buildPage(model),
    );
    await tester.pump();

    expect(find.text(l10n.installationFailed), findsOneWidget);
    expect(find.text(l10n.copyingFiles), findsNothing);
    expect(find.text(l10n.installingSystem), findsNothing);
    expect(find.text(l10n.configuringSystem), findsNothing);
  });

  testWidgets('core desktop has no continue testing', (tester) async {
    final model = buildInstallModel(
      isDone: true,
    );
    await tester.pumpApp((_) => buildPage(model));

    final context = tester.element(find.byType(InstallPage));
    final l10n = UbuntuBootstrapLocalizations.of(context);

    final continueTestingButton = find.button(l10n.continueTesting);
    expect(continueTestingButton, findsNothing);
  });
}
