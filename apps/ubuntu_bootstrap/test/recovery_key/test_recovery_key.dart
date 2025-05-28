import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_bootstrap/pages/recovery_key/recovery_key_model.dart';

import 'test_recovery_key.mocks.dart';
export 'test_recovery_key.mocks.dart';

@GenerateMocks([RecoveryKeyModel])
RecoveryKeyModel buildRecoveryKeyModel({bool? init}) {
  final model = MockRecoveryKeyModel();
  when(model.init()).thenAnswer((_) async => init ?? false);
  when(model.confirmed).thenReturn(true);
  return model;
}
