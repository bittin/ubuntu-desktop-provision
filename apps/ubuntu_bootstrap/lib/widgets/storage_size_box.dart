import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:ubuntu_utils/ubuntu_utils.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:ubuntu_wizard/ubuntu_wizard.dart';

/// Storage size entry with a spinbox and a data size unit dropdown.
class StorageSizeBox extends StatelessWidget {
  const StorageSizeBox({
    required this.size,
    required this.unit,
    required this.maximum,
    required this.onSizeChanged,
    required this.onUnitSelected,
    super.key,
    this.minimum = 0,
    this.autofocus = false,
    this.spacing = kWizardBarSpacing,
  });

  /// The current value in bytes.
  final int size;

  /// The unit for visualization.
  final DataUnit unit;

  /// The minimum value in bytes.
  final int minimum;

  /// The maximum value in bytes.
  final int maximum;

  /// The callback called whenever the size changes.
  final ValueChanged<int> onSizeChanged;

  /// The callback called whenever the user selects a size unit.
  final ValueChanged<DataUnit> onUnitSelected;

  /// Whether the widget should automatically gain focus if nothing else is
  /// already focused.
  final bool autofocus;

  /// The spacing between the value spinbox and the unit dropdown. Defaults to
  /// `kButtonBarSpacing`.
  final double spacing;

  @override
  Widget build(BuildContext context) {
    final minBytes = fromBytes(minimum, unit);
    final maxBytes = fromBytes(maximum, unit);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          flex: 3,
          child: SizedBox(
            width: 240,
            child: SpinBox(
              value: fromBytes(size, unit),
              min: minBytes,
              max: maxBytes,
              onChanged: (value) =>
                  onSizeChanged(toBytes(value.clamp(minBytes, maxBytes), unit)),
              autofocus: autofocus,
            ),
          ),
        ),
        SizedBox(width: spacing),
        IntrinsicWidth(
          child: MenuButtonBuilder<DataUnit>(
            values: DataUnit.values,
            selected: unit,
            onSelected: onUnitSelected,
            itemBuilder: (context, unit, _) {
              return Text(unit.l10n(context), key: ValueKey(unit));
            },
            child: IndexedStack(
              index: unit.index,
              children: DataUnit.values
                  .map((unit) => Text(unit.l10n(context)))
                  .toList(),
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}

class StorageTextBox extends StatelessWidget {
  const StorageTextBox({
    required this.size,
    required this.unit,
    required this.minimum,
    required this.maximum,
    required this.onSizeChanged,
    required this.onUnitSelected,
    super.key,
  });

  /// The current value in bytes.
  final int size;

  /// The unit for visualization.
  final DataUnit unit;

  /// The minimum value in bytes.
  final int minimum;

  /// The maximum value in bytes.
  final int maximum;

  /// The callback called whenever the size changes.
  final ValueChanged<int> onSizeChanged;

  /// The callback called whenever the user selects a size unit.
  final ValueChanged<DataUnit> onUnitSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 85,
          child: TextFormField(
            initialValue: fromBytes(size, unit).toStringAsFixed(1),
            onFieldSubmitted: (value) =>
                onSizeChanged(toBytes(double.parse(value), unit)),
          ),
        ),
        const SizedBox(width: kWizardBarSpacing),
        IntrinsicWidth(
          child: MenuButtonBuilder<DataUnit>(
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            ),
            values: const [DataUnit.megabytes, DataUnit.gigabytes],
            selected: unit,
            onSelected: onUnitSelected,
            itemBuilder: (context, unit, _) {
              return Text(unit.l10n(context), key: ValueKey(unit));
            },
            child: IndexedStack(
              index: unit.index,
              children: DataUnit.values
                  .map((unit) => Text(unit.l10n(context)))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
