import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ubuntu_bootstrap/pages.dart';
import 'package:ubuntu_provision/ubuntu_provision.dart';
import 'package:ubuntu_utils/ubuntu_utils.dart';
import 'package:ubuntu_wizard/ubuntu_wizard.dart';

/// Represents each step or page in the installer workflow.
///
/// Each step corresponds to an enum value, which defines the page's behavior
/// and its role in the installer. The order of the enums determines the sequence
/// in which the steps appear in the installer.
///
/// New pages must be added as additional enums to integrate into the workflow.
///
/// Properties:
/// - `discreteStep`: Indicates whether the step is displayed as a discrete wizard step. Discrete
/// steps get their own circle progress indicator at the bottom of the window.
/// - `wizardStep`: Specifies if the step is part of the wizard flow. Wizard steps appear with
/// circle progress indicators and the default step navigation at the bottom of the window.
/// - `required`: Marks the step as mandatory in the workflow.
/// - `allowedToHide`: Determines if the step can be conditionally hidden.
///
/// References:
/// - [A discrete, wizard step](https://github.com/canonical/ubuntu-desktop-provision-screenshots/blob/main/bootstrap/light/accessibility.png)
/// - [A non-discrete, wizard step](https://github.com/canonical/ubuntu-desktop-provision-screenshots/blob/main/bootstrap/light/rst.png)
/// - [A non-discrete, non-wizard step](https://github.com/canonical/ubuntu-desktop-provision-screenshots/blob/main/bootstrap/light/install-0.png)
enum InstallationStep with RouteName {
  loading(
    LoadingPage.new,
    discreteStep: false,
    wizardStep: false,
    required: true,
  ),
  locale(LocalePage.new),
  accessibility(AccessibilityPage.new, allowedToHide: true),
  rst(RstPage.new, discreteStep: false, required: true),
  keyboard(KeyboardPage.new),
  network(NetworkPage.new),
  refresh(RefreshPage.new, allowedToHide: true),
  tryOrInstall(TryOrInstallPage.new, discreteStep: false, allowedToHide: true),
  autoinstall(AutoinstallPage.new, allowedToHide: true),
  autoinstallLandscapeDomain(AutoinstallLandscapeDomainPage.new),
  autoinstallLandscapeQr(AutoinstallLandscapeQrPage.new),
  autoinstallLandscapeError(
    AutoinstallLandscapeErrorPage.new,
    discreteStep: false,
    onBackOverride: autoinstall,
  ),
  autoinstallDirect(AutoinstallDirectPage.new),
  sourceSelection(SourceSelectionPage.new, allowedToHide: true),
  codecsAndDrivers(CodecsAndDriversPage.new),
  notEnoughDiskSpace(NotEnoughDiskSpacePage.new, discreteStep: false),
  secureBoot(SecureBootPage.new, discreteStep: false, required: true),
  storage(StorageWizard.new, discreteStep: false),
  identity(IdentityPage.new),
  activeDirectory(ActiveDirectoryPage.new),
  timezone(TimezonePage.new),
  confirm(ConfirmPage.new, required: true),
  install(InstallPage.new, discreteStep: false, required: true),
  recoveryKey(RecoveryKeyPage.new),
  done(DonePage.new, wizardStep: false, required: true),
  error(
    _errorPageFactory,
    discreteStep: false,
    wizardStep: false,
    required: true,
  );

  const InstallationStep(
    this.pageFactory, {
    this.discreteStep = true,
    this.wizardStep = true,
    this.allowedToHide = false,
    this.required = false,
    this.onBackOverride,
  });

  final ProvisioningPage Function() pageFactory;

  /// If this is true the page is handled separately from the wizard steps.
  final bool wizardStep;

  /// If this is true the page has its own step in the wizard progress bar.
  final bool discreteStep;

  /// Whether the page can be hidden.
  final bool allowedToHide;

  /// Whether the page is required.
  final bool required;

  /// Installation step to navigate to when back is pressed.
  final InstallationStep? onBackOverride;

  /// Gets all the pages that should be handled by the wizard.
  static Iterable<InstallationStep> get wizardSteps =>
      values.where((e) => e.wizardStep);

  static Iterable<String> get requiredRoutes =>
      values.where((e) => e.required).map((e) => e.route);

  WizardRoute toRoute(BuildContext context, WidgetRef ref) {
    final page = pageFactory();
    return WizardRoute(
      builder: (_) => page,
      userData: WizardRouteData(step: pageIndex),
      onLoad: (_) {
        if (ref.context.mounted) {
          return page.load(context, ref);
        }
        return false;
      },
      onBack: onBackOverride != null ? (_) => onBackOverride!.route : null,
    );
  }

  /// The index of this page in the wizard progress bar.
  int get pageIndex {
    final initialIndex = values.indexOf(this);
    var index = 0;
    for (var i = 0; i <= initialIndex; i++) {
      if (values[i].discreteStep) {
        index++;
      }
    }
    return index - 1;
  }

  static InstallationStep? fromName(String name) {
    return values.firstWhereOrNull((e) => e.name == name);
  }

  static Iterable<String> get allowedToHideKeys =>
      values.where((e) => e.allowedToHide).map((e) => e.name);
}

ProvisioningPage _errorPageFactory() {
  return const ErrorPage(allowRestart: true);
}
