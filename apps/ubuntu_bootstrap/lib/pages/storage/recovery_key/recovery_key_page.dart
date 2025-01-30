import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ubuntu_bootstrap/l10n.dart';
import 'package:ubuntu_bootstrap/pages/storage/recovery_key/recovery_key_model.dart';
import 'package:ubuntu_bootstrap/pages/storage/storage_model.dart';
import 'package:ubuntu_bootstrap/widgets/info_box.dart';
import 'package:ubuntu_provision/ubuntu_provision.dart';
import 'package:ubuntu_utils/ubuntu_utils.dart';
import 'package:ubuntu_wizard/ubuntu_wizard.dart';
import 'package:yaru/yaru.dart';

class RecoveryKeyPage extends ConsumerWidget {
  const RecoveryKeyPage({super.key});

  static Future<bool> load(WidgetRef ref) {
    if (ref.read(storageModelProvider).type == StorageType.manual) {
      return Future.value(false);
    }

    return ref.read(recoveryKeyModelProvider).init();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = UbuntuBootstrapLocalizations.of(context);
    final model = ref.watch(recoveryKeyModelProvider);
    final flavor = ref.watch(flavorProvider);

    return HorizontalPage(
      windowTitle: l10n.recoveryKeyTitle,
      title: l10n.recoveryKeyHeader,
      bottomBar: WizardBar(
        leading: const BackWizardButton(),
        trailing: [
          NextWizardButton(
            enabled: ref.watch(
              recoveryKeyModelProvider.select((model) => model.confirmed),
            ),
          ),
        ],
      ),
      children: <Widget>[
        InfoBox(
          title: l10n.recoveryKeyInfoHeader,
          subtitle: l10n.recoveryKeyInfoBody(flavor.displayName),
          type: InfoBoxType.warning,
          isThreeLine: true,
        ),
        Text(l10n.recoveryKeyCommand),
        SelectableText(
          kRecoveryKeyCommand,
          style: TextStyle(
            fontFamily: 'Ubuntu Mono',
            fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
            textBaseline: TextBaseline.alphabetic,
          ),
        ),
        Text(l10n.recoveryKeyStorageAdvice),
        YaruCheckButton(
          title: Text(
            l10n.recoveryKeyConfirmation,
            maxLines: 2,
          ),
          contentPadding: kWizardPadding,
          value: model.confirmed,
          onChanged: model.setConfirmed,
        ),
      ].withSpacing(kWizardSpacing),
    );
  }
}
