import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_bootstrap/l10n.dart';
import 'package:ubuntu_bootstrap/pages/storage/storage_model.dart';
import 'package:ubuntu_bootstrap/widgets.dart';
import 'package:ubuntu_provision/ubuntu_provision.dart';
import 'package:ubuntu_utils/ubuntu_utils.dart';
import 'package:ubuntu_wizard/ubuntu_wizard.dart';

export 'storage_model.dart'
    show
        StorageType,
        StorageTypeAlongside,
        StorageTypeErase,
        StorageTypeEraseInstall,
        StorageTypeManual;

/// Select between guided and manual partitioning.
class StoragePage extends ConsumerWidget with ProvisioningPage {
  StoragePage({super.key});

  @override
  Future<bool> load(BuildContext context, WidgetRef ref) {
    return ref.read(storageModelProvider.notifier).init().then((_) => true);
  }

  static String formatAlongside(
    UbuntuBootstrapLocalizations lang,
    String product,
    List<OsProber> os,
  ) {
    switch (os.length) {
      case 0:
        return lang.installationTypeAlongsideUnknown(product);
      case 1:
        return lang.installationTypeAlongside(product, os.single.long);
      case 2:
        return os.hasDuplicates
            ? lang.installationTypeAlongsideMulti(product)
            : lang.installationTypeAlongsideDual(
                product,
                os.first.long,
                os.last.long,
              );
      default:
        return lang.installationTypeAlongsideMulti(product);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = UbuntuBootstrapLocalizations.of(context);
    final flavor = ref.watch(flavorProvider);
    final theme = Theme.of(context);

    final (
      canEraseDisk,
      canEraseAndInstall,
      canInstallAlongside,
      canManualPartition,
      existingOS,
      guidedCapability,
      hasAdvancedFeatures,
      hasBitLocker,
    ) = ref.watch(
      storageModelProvider.select(
        (model) => (
          model.canEraseDisk,
          model.canEraseAndInstall,
          model.canInstallAlongside,
          model.canManualPartition,
          model.existingOS,
          model.guidedCapability,
          model.hasAdvancedFeatures,
          model.hasBitLocker
        ),
      ),
    );

    return HorizontalPage(
      windowTitle: lang.installationTypeTitle,
      title: lang.installationTypeHeader(flavor.displayName),
      bottomBar: Builder(
        builder: (context) {
          final notifier = ref.read(storageModelProvider.notifier);

          return WizardBar(
            leading: const BackWizardButton(),
            trailing: [
              NextWizardButton(
                onNext: notifier.save,
                enabled:
                    canEraseDisk || canInstallAlongside || canManualPartition,
                // If the user returns back to select another installation type, the
                // previously configured storage must be reset to make all guided
                // partitioning targets available.
                onReturn: notifier.resetStorage,
              ),
            ],
          );
        },
      ),
      children: [
        if (hasBitLocker)
          BitlockerInfoBox(
            canInstallAlongside: canInstallAlongside,
            onPressed: canInstallAlongside
                ? null
                : ref.read(storageModelProvider.notifier).reboot,
          ),
        if (canInstallAlongside || hasBitLocker)
          _InstallationTypeTile(
            storageType: StorageType.alongside,
            title: Text(
              formatAlongside(
                lang,
                flavor.displayName,
                existingOS ?? [],
              ),
            ),
            subtitle: Text(
              lang.installationTypeAlongsideInfo(flavor.displayName),
              style: theme.textTheme.bodySmall!.copyWith(
                color: canInstallAlongside ? null : theme.disabledColor,
              ),
            ),
            enabled: canInstallAlongside,
          ),
        if (canEraseAndInstall)
          ...ref
              .read(storageModelProvider.notifier)
              .getEraseInstallTargets()
              .map(
                (target) => Builder(
                  builder: (context) {
                    final notifier = ref.read(storageModelProvider.notifier);

                    return _InstallationTypeTile(
                      storageType: StorageTypeEraseInstall(target),
                      title: Text(
                        lang.installationTypeEraseAndInstall(
                          notifier.getEraseInstallOsName(target) ?? 'unknown',
                          flavor.displayName,
                        ),
                      ),
                      subtitle: _WarningSubtitle(
                        text: lang.installationTypeEraseAndInstallInfo(
                          notifier.getEraseInstallOsName(target) ?? 'unknown',
                        ),
                      ),
                    );
                  },
                ),
              ),
        if (canEraseDisk) ...[
          _InstallationTypeTile(
            storageType: StorageType.erase,
            title: Text(lang.installationTypeErase(flavor.displayName)),
            subtitle: _WarningSubtitle(text: lang.installationTypeEraseInfo),
          ),
        ],
        if (canManualPartition)
          _InstallationTypeTile(
            storageType: StorageType.manual,
            title: Text(lang.installationTypeManual),
            subtitle: Text(
              lang.installationTypeManualInfo(flavor.displayName),
              style: theme.textTheme.bodySmall,
            ),
          ),
      ].withSpacing(kWizardSpacing / 2),
    );
  }
}

extension _OsProberList on List<OsProber> {
  /// Whether the system has any OS installed multiple times.
  bool get hasDuplicates =>
      length > 1 && length != map((os) => os.long).toSet().length;
}

class _InstallationTypeTile extends ConsumerWidget {
  const _InstallationTypeTile({
    required this.storageType,
    required this.title,
    this.subtitle,
    this.enabled = true,
  });

  final StorageType storageType;
  final Widget title;
  final Widget? subtitle;
  final bool enabled;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(storageModelProvider);

    void onChanged(StorageType? value) => model.type = value;

    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Material(
        child: OptionButton<StorageType?>(
          title: title,
          subtitle: subtitle,
          value: storageType,
          groupValue: model.type,
          onChanged: enabled ? onChanged : null,
        ),
      ),
    );
  }
}

class _WarningSubtitle extends ConsumerWidget {
  const _WarningSubtitle({required this.text});

  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return RichText(
      text: TextSpan(
        text: UbuntuLocalizations.of(context).warningLabel,
        style: theme.textTheme.bodySmall!.copyWith(
          fontWeight: FontWeight.bold,
        ),
        children: <TextSpan>[
          TextSpan(text: ': ', style: theme.textTheme.bodySmall),
          TextSpan(text: text, style: theme.textTheme.bodySmall),
        ],
      ),
    );
  }
}
