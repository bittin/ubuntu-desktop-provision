import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_bootstrap/pages/storage/passphrase/passphrase_page.dart';
import 'package:ubuntu_bootstrap/services.dart';

/// Provider for [PassphraseModel].
final passphraseModelProvider = ChangeNotifierProvider(
  (_) => PassphraseModel(getService<StorageService>()),
);

/// View model for [PassphrasePage].
class PassphraseModel extends SafeChangeNotifier {
  /// Creates the model with the given client.
  PassphraseModel(this._service) {
    Listenable.merge([
      _passphrase,
      _confirmedPassphrase,
      _showPassphrase,
    ]).addListener(notifyListeners);
  }

  final StorageService _service;

  final _passphrase = ValueNotifier('');
  final _confirmedPassphrase = ValueNotifier('');
  final _showPassphrase = ValueNotifier(false);

  /// The current passphrase.
  String get passphrase => _passphrase.value;
  set passphrase(String value) => _passphrase.value = value;

  /// The confirmed passphrase for validation.
  String get confirmedPassphrase => _confirmedPassphrase.value;
  set confirmedPassphrase(String value) => _confirmedPassphrase.value = value;

  /// Defines if the passphrase is shown.
  bool get showPassphrase => _showPassphrase.value;
  set showPassphrase(bool value) => _showPassphrase.value = value;

  /// Defines whether or not the user has selected TPM FDE
  bool get isTpm => [
        GuidedCapability.CORE_BOOT_ENCRYPTED,
        GuidedCapability.CORE_BOOT_PREFER_ENCRYPTED,
      ].contains(_service.guidedCapability);

  /// Whether the current input is valid.
  bool get isValid =>
      passphrase.isNotEmpty && passphrase == confirmedPassphrase;

  PassphraseType get passphraseType => _service.passphraseType;

  /// Initializes the model.
  Future<bool> init() async {
    if ([
          GuidedCapability.LVM_LUKS,
          GuidedCapability.ZFS_LUKS_KEYSTORE,
          GuidedCapability.CORE_BOOT_ENCRYPTED,
          GuidedCapability.CORE_BOOT_PREFER_ENCRYPTED,
        ].contains(_service.guidedCapability) &&
        passphraseType != PassphraseType.none) {
      await loadPassphrase();
      return true;
    }

    await clearPassphrase();
    return false;
  }

  /// Loads the passphrase from the service.
  Future<void> loadPassphrase() async {
    var savedPassphrase = _service.passphrase ?? '';
    // For PIN: only restore the passphrase if it's numeric
    if (passphraseType == PassphraseType.pin &&
        !RegExp(r'^\d+$').hasMatch(savedPassphrase)) {
      savedPassphrase = '';
    }
    _passphrase.value = _confirmedPassphrase.value = savedPassphrase;
  }

  /// Saves the passphrase to the service and clears the local values.
  Future<void> savePassphrase() async {
    _service.passphrase = passphrase;
    _passphrase.value = '';
    _confirmedPassphrase.value = '';
  }

  /// Clears the passphrase in the service and the local values,
  Future<void> clearPassphrase() async {
    _service.passphrase = null;
    _passphrase.value = '';
    _confirmedPassphrase.value = '';
  }
}
