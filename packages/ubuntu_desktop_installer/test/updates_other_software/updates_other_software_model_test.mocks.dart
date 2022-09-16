// Mocks generated by Mockito 5.3.0 from annotations
// in ubuntu_desktop_installer/test/updates_other_software/updates_other_software_model_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:ubuntu_desktop_installer/services/power_service.dart' as _i3;
import 'package:upower/upower.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeUPowerKbdBacklight_0 extends _i1.SmartFake
    implements _i2.UPowerKbdBacklight {
  _FakeUPowerKbdBacklight_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUPowerDevice_1 extends _i1.SmartFake implements _i2.UPowerDevice {
  _FakeUPowerDevice_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [PowerService].
///
/// See the documentation for Mockito's code generation for more information.
class MockPowerService extends _i1.Mock implements _i3.PowerService {
  MockPowerService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.UPowerKbdBacklight get kbdBacklight => (super.noSuchMethod(
        Invocation.getter(#kbdBacklight),
        returnValue: _FakeUPowerKbdBacklight_0(
          this,
          Invocation.getter(#kbdBacklight),
        ),
      ) as _i2.UPowerKbdBacklight);
  @override
  set kbdBacklight(_i2.UPowerKbdBacklight? _kbdBacklight) => super.noSuchMethod(
        Invocation.setter(
          #kbdBacklight,
          _kbdBacklight,
        ),
        returnValueForMissingStub: null,
      );
  @override
  String get daemonVersion => (super.noSuchMethod(
        Invocation.getter(#daemonVersion),
        returnValue: '',
      ) as String);
  @override
  bool get onBattery => (super.noSuchMethod(
        Invocation.getter(#onBattery),
        returnValue: false,
      ) as bool);
  @override
  bool get lidIsPresent => (super.noSuchMethod(
        Invocation.getter(#lidIsPresent),
        returnValue: false,
      ) as bool);
  @override
  bool get lidIsClosed => (super.noSuchMethod(
        Invocation.getter(#lidIsClosed),
        returnValue: false,
      ) as bool);
  @override
  List<_i2.UPowerDevice> get devices => (super.noSuchMethod(
        Invocation.getter(#devices),
        returnValue: <_i2.UPowerDevice>[],
      ) as List<_i2.UPowerDevice>);
  @override
  _i2.UPowerDevice get displayDevice => (super.noSuchMethod(
        Invocation.getter(#displayDevice),
        returnValue: _FakeUPowerDevice_1(
          this,
          Invocation.getter(#displayDevice),
        ),
      ) as _i2.UPowerDevice);
  @override
  _i4.Stream<_i2.UPowerDevice> get deviceAdded => (super.noSuchMethod(
        Invocation.getter(#deviceAdded),
        returnValue: _i4.Stream<_i2.UPowerDevice>.empty(),
      ) as _i4.Stream<_i2.UPowerDevice>);
  @override
  _i4.Stream<_i2.UPowerDevice> get deviceRemoved => (super.noSuchMethod(
        Invocation.getter(#deviceRemoved),
        returnValue: _i4.Stream<_i2.UPowerDevice>.empty(),
      ) as _i4.Stream<_i2.UPowerDevice>);
  @override
  _i4.Stream<List<String>> get propertiesChanged => (super.noSuchMethod(
        Invocation.getter(#propertiesChanged),
        returnValue: _i4.Stream<List<String>>.empty(),
      ) as _i4.Stream<List<String>>);
  @override
  _i4.Future<void> connect() => (super.noSuchMethod(
        Invocation.method(
          #connect,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<String> getCriticalAction() => (super.noSuchMethod(
        Invocation.method(
          #getCriticalAction,
          [],
        ),
        returnValue: _i4.Future<String>.value(''),
      ) as _i4.Future<String>);
  @override
  _i4.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}
