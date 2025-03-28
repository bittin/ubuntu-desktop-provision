import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_bootstrap/l10n.dart';
import 'package:ubuntu_bootstrap/pages/storage/manual/manual_storage_dialogs.dart';
import 'package:ubuntu_bootstrap/pages/storage/manual/manual_storage_model.dart';
import 'package:ubuntu_bootstrap/pages/storage/manual/storage_columns.dart';
import 'package:ubuntu_bootstrap/pages/storage/manual/storage_table.dart';
import 'package:ubuntu_bootstrap/pages/storage/manual/storage_types.dart';
import 'package:ubuntu_bootstrap/widgets.dart';
import 'package:yaru/yaru.dart';

class PartitionBar extends ConsumerWidget {
  const PartitionBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(manualStorageModelProvider);
    return YaruBorderContainer(
      borderRadius: BorderRadius.circular(kYaruButtonRadius),
      clipBehavior: Clip.antiAlias,
      child: CustomPaint(
        size: const Size(double.infinity, 16),
        painter: _PartitionPainter(model),
      ),
    );
  }
}

Color _partitionColor(int index, int count) {
  assert(count > 0);
  final baseColor = HSLColor.fromColor(Colors.blue.shade900);
  final hue = (baseColor.hue + 360 / count * index) % 360;
  return baseColor.withHue(hue).toColor();
}

class _PartitionPainter extends CustomPainter {
  _PartitionPainter(this._model)
      : _selectedDiskIndex = _model.selectedDiskIndex,
        _selectedObjectIndex = _model.selectedObjectIndex;

  final ManualStorageModel _model;
  final int _selectedDiskIndex;
  final int _selectedObjectIndex;

  @override
  void paint(Canvas canvas, Size size) {
    final diskSize = _model.selectedDisk?.size ?? 0;
    if (diskSize <= 0) return;

    final rect = Offset.zero & size;
    final objects = _model.selectedDisk?.partitions;
    final objectCount = objects?.length ?? 0;
    for (var index = 0; index < objectCount; ++index) {
      final object = objects![index];
      if (object is! Partition) continue;
      final objectSize = object.size ?? 0;
      if (objectSize <= 0) continue;

      final paint = Paint();
      paint.color = _partitionColor(index, objects.length);
      paint.style = PaintingStyle.fill;

      final x = (object.offset ?? 0) / diskSize * rect.width;
      final width = rect.width * objectSize / diskSize;
      canvas.drawRect(Rect.fromLTWH(x, 0, width, rect.height), paint);
    }
  }

  @override
  bool shouldRepaint(covariant _PartitionPainter old) {
    return old._selectedDiskIndex != _selectedDiskIndex ||
        old._selectedObjectIndex != _selectedObjectIndex;
  }
}

class PartitionLegend extends ConsumerWidget {
  const PartitionLegend({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(manualStorageModelProvider);
    final lang = UbuntuBootstrapLocalizations.of(context);

    final objects = model.selectedDisk?.partitions ?? [];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: objects
            .mapIndexed(
              (index, object) => Padding(
                padding: EdgeInsetsDirectional.only(start: index > 0 ? 40 : 0),
                child: object.map(
                  partition: (partition) => _PartitionLabel(
                    title: partition.sysname,
                    size: partition.size ?? 0,
                    color: _partitionColor(index, objects.length),
                  ),
                  gap: (gap) => _PartitionLabel(
                    size: gap.size,
                    title: lang.freeDiskSpace,
                    borderColor: Theme.of(context).dividerColor,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _PartitionLabel extends StatelessWidget {
  const _PartitionLabel({
    required this.title,
    required this.size,
    this.color = Colors.transparent,
    this.borderColor = Colors.transparent,
  });

  final String title;
  final int size;
  final Color color;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 2, 8, 0),
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: color,
                border: Border.all(color: borderColor),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleSmall),
            Text(
              context.formatByteSize(size),
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ],
    );
  }
}

class PartitionTable extends ConsumerWidget {
  const PartitionTable({required this.controller, super.key});

  final AutoScrollController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(manualStorageModelProvider);
    return StorageTable(
      columns: [
        StorageDeviceColumn(),
        StorageTypeColumn(),
        StorageMountColumn(),
        StorageSizeColumn(),
        StorageSystemColumn(),
        StorageWipeColumn(
          onWipe: (disk, partition, wipe) {
            model.editPartition(disk, partition, wipe: wipe);
          },
        ),
      ],
      storages: model.disks,
      controller: controller,
      canSelect: model.canSelectStorage,
      isSelected: model.isStorageSelected,
      onSelected: model.selectStorage,
    );
  }
}

class PartitionButtonRow extends ConsumerWidget {
  const PartitionButtonRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(manualStorageModelProvider);
    final lang = UbuntuBootstrapLocalizations.of(context);

    return Row(
      children: [
        YaruBorderContainer(
          borderRadius: BorderRadius.circular(kYaruButtonRadius),
          clipBehavior: Clip.antiAlias,
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Tooltip(
                  message:
                      (model.selectedGap?.tooManyPrimaryPartitions ?? false)
                          ? lang.tooManyPrimaryPartitions
                          : '',
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide.none,
                      shape: const RoundedRectangleBorder(),
                    ),
                    onPressed: model.canAddPartition
                        ? () => showCreatePartitionDialog(
                              context,
                              model.selectedDisk!,
                              model.selectedGap!,
                            )
                        : null,
                    child: const Icon(Icons.add),
                  ),
                ),
                const VerticalDivider(width: 1),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide.none,
                    shape: const RoundedRectangleBorder(),
                  ),
                  onPressed: model.canRemovePartition && !model.waitingForReply
                      ? () => model.deletePartition(
                            model.selectedDisk!,
                            model.selectedPartition!,
                          )
                      : null,
                  child: const Icon(Icons.remove),
                ),
                const VerticalDivider(width: 1),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide.none,
                    shape: const RoundedRectangleBorder(),
                  ),
                  onPressed: model.canEditPartition
                      ? () => showEditPartitionDialog(
                            context,
                            model.selectedDisk!,
                            model.selectedPartition!,
                            model.selectedConfig,
                            model.trailingGap,
                          )
                      : null,
                  child: Text(lang.changeButtonText),
                ),
              ],
            ),
          ),
        ),
        const Spacer(),
        OverflowBar(
          children: [
            OutlinedButton(
              onPressed: model.canReformatDisk
                  ? () => _maybeReformatDisk(context, ref)
                  : null,
              child: Text(lang.newPartitionTable),
            ),
          ],
        ),
        OutlinedButton(
          onPressed: model.resetStorage,
          child: Text(UbuntuLocalizations.of(context).revertLabel),
        ),
      ],
    );
  }

  Future<void> _maybeReformatDisk(BuildContext context, WidgetRef ref) async {
    final model = ref.read(manualStorageModelProvider.notifier);
    final lang = UbuntuBootstrapLocalizations.of(context);

    final disk = model.selectedDisk!;
    if (disk.ptable != null) {
      final confirmed = await showConfirmationDialog(
        context,
        title: lang.newPartitionTableConfirmationTitle,
        message: lang.newPartitionTableConfirmationMessage,
      );
      if (!confirmed) return;
    }
    await model.reformatDisk(disk);
  }
}
