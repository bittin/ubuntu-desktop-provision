import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_bootstrap/pages/storage/passphrase/passphrase_model.dart';
import 'package:ubuntu_bootstrap/services.dart';

import 'test_passphrase.mocks.dart';
export '../../test_utils.dart';
export 'test_passphrase.mocks.dart';

@GenerateMocks([PassphraseModel])
PassphraseModel buildPassphraseModel({
  bool? isValid,
  bool? isTpm,
  String? passphrase,
  String? confirmedPassphrase,
  bool? showPassphrase,
  bool? usePassphrase,
  PassphraseType? passphraseType,
}) {
  final model = MockPassphraseModel();
  when(model.isValid).thenReturn(isValid ?? true);
  when(model.isTpm).thenReturn(isTpm ?? false);
  when(model.passphrase).thenReturn(passphrase ?? '');
  when(model.confirmedPassphrase).thenReturn(confirmedPassphrase ?? '');
  when(model.showPassphrase).thenReturn(showPassphrase ?? false);
  when(model.passphraseType)
      .thenReturn(passphraseType ?? PassphraseType.passphrase);
  when(model.init()).thenAnswer((_) async => usePassphrase ?? true);
  return model;
}
