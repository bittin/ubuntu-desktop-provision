import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ubuntu_bootstrap/l10n.dart';
import 'package:ubuntu_bootstrap/pages/autoinstall/autoinstall_landscape_model.dart';
import 'package:ubuntu_bootstrap/pages/autoinstall/autoinstall_model.dart';
import 'package:ubuntu_provision/ubuntu_provision.dart';
import 'package:ubuntu_wizard/ubuntu_wizard.dart';

class AutoinstallLandscapeErrorPage extends ConsumerWidget
    with ProvisioningPage {
  const AutoinstallLandscapeErrorPage({super.key});

  @override
  Future<bool> load(BuildContext context, WidgetRef ref) async =>
      ref.watch(autoinstallModelProvider).type == AutoinstallType.landscape &&
      ref.watch(landscapeDataModelProvider).unretryableError;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = UbuntuBootstrapLocalizations.of(context);
    final landscapeModel = ref.watch(landscapeDataModelProvider);

    return HorizontalPage(
      windowTitle: l10n.landscapePageTitle,
      title: landscapeModel.error?.toString() ?? '',
      bottomBar: WizardBar(
        leading: const BackWizardButton(
        ),
      ),
      children: [
        Text('Contact your IT support or try a different installation option.'),
        const SizedBox(height: kWizardSpacing),
        Text('Error code: ${landscapeModel.authenticationStatus}'),
      ],
    );
  }
}
