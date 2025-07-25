// Mocks generated by Mockito 5.4.4 from annotations
// in ubuntu_bootstrap/test/storage/passphrase/test_passphrase.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;
import 'dart:ui' as _i6;

import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i3;
import 'package:ubuntu_bootstrap/pages/storage/passphrase/passphrase_model.dart'
    as _i2;
import 'package:ubuntu_bootstrap/services.dart' as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [PassphraseModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockPassphraseModel extends _i1.Mock implements _i2.PassphraseModel {
  MockPassphraseModel() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get passphrase => (super.noSuchMethod(
        Invocation.getter(#passphrase),
        returnValue: _i3.dummyValue<String>(
          this,
          Invocation.getter(#passphrase),
        ),
      ) as String);

  @override
  String get confirmedPassphrase => (super.noSuchMethod(
        Invocation.getter(#confirmedPassphrase),
        returnValue: _i3.dummyValue<String>(
          this,
          Invocation.getter(#confirmedPassphrase),
        ),
      ) as String);

  @override
  bool get showPassphrase => (super.noSuchMethod(
        Invocation.getter(#showPassphrase),
        returnValue: false,
      ) as bool);

  @override
  set showPassphrase(bool? value) => super.noSuchMethod(
        Invocation.setter(
          #showPassphrase,
          value,
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool get isTpm => (super.noSuchMethod(
        Invocation.getter(#isTpm),
        returnValue: false,
      ) as bool);

  @override
  bool get isValid => (super.noSuchMethod(
        Invocation.getter(#isValid),
        returnValue: false,
      ) as bool);

  @override
  _i4.PassphraseType get passphraseType => (super.noSuchMethod(
        Invocation.getter(#passphraseType),
        returnValue: _i4.PassphraseType.passphrase,
      ) as _i4.PassphraseType);

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);

  @override
  bool get isDisposed => (super.noSuchMethod(
        Invocation.getter(#isDisposed),
        returnValue: false,
      ) as bool);

  @override
  void setPassphraseAndEntropy(
    String? passphrase, {
    bool? debounce = false,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #setPassphraseAndEntropy,
          [passphrase],
          {#debounce: debounce},
        ),
        returnValueForMissingStub: null,
      );

  @override
  void setConfirmedPassphrase(
    String? value, {
    bool? debounce = false,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #setConfirmedPassphrase,
          [value],
          {#debounce: debounce},
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i5.Future<bool> init() => (super.noSuchMethod(
        Invocation.method(
          #init,
          [],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);

  @override
  _i5.Future<void> loadPassphrase() => (super.noSuchMethod(
        Invocation.method(
          #loadPassphrase,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> savePassphrase() => (super.noSuchMethod(
        Invocation.method(
          #savePassphrase,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> clearPassphrase() => (super.noSuchMethod(
        Invocation.method(
          #clearPassphrase,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  void addListener(_i6.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListener(_i6.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
