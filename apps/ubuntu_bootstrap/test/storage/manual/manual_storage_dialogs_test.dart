// ignore_for_file: unawaited_futures

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_bootstrap/pages/storage/manual/manual_storage_dialogs.dart';
import 'package:ubuntu_bootstrap/pages/storage/manual/manual_storage_model.dart';
import 'package:ubuntu_bootstrap/pages/storage/manual/manual_storage_page.dart';
import 'package:ubuntu_bootstrap/pages/storage/manual/storage_types.dart';
import 'package:ubuntu_bootstrap/services.dart';
import 'package:ubuntu_provision/services.dart';
import 'package:ubuntu_test/ubuntu_test.dart';
import 'package:ubuntu_utils/ubuntu_utils.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:yaru/yaru.dart';
import 'package:yaru_test/yaru_test.dart';

import 'test_manual_storage.dart';

void main() {
  testWidgets('create partition', (tester) async {
    final disk = fakeDisk();
    const gap = Gap(offset: 0, size: 100000000, usable: GapUsable.YES);
    final model = buildManualStorageModel(selectedDisk: disk);

    registerMockService<UdevService>(MockUdevService());

    await tester.pumpWidget(
      ProviderScope(
        overrides: [manualStorageModelProvider.overrideWith((_) => model)],
        child: tester.buildApp((_) => const ManualStoragePage()),
      ),
    );

    final result = showCreatePartitionDialog(
      tester.element(find.byType(ManualStoragePage)),
      disk,
      gap,
    );
    await tester.pumpAndSettle();

    await tester.tap(find.byType(MenuButtonBuilder<DataUnit>));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const ValueKey(DataUnit.bytes)).last);
    await tester.pump();

    await tester.enterText(find.byType(SpinBox), '12345678');
    await tester.pump();

    await tester.tap(find.byType(MenuButtonBuilder<PartitionFormat?>));
    await tester.pumpAndSettle();

    await tester.tap(find.menuItem(PartitionFormat.btrfs.displayName));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(YaruAutocomplete<String>), '/tst');
    await tester.pump();

    await tester.tapOk();
    await result;

    verify(
      model.addPartition(
        disk,
        gap,
        size: mibiAlign(12345678, gap.size),
        format: PartitionFormat.btrfs,
        mount: '/tst',
      ),
    ).called(1);
  });

  testWidgets('create partition with invalid mount point', (tester) async {
    final disk = fakeDisk();
    const gap = Gap(offset: 0, size: 1000000, usable: GapUsable.YES);
    final model = buildManualStorageModel(selectedDisk: disk);

    registerMockService<UdevService>(MockUdevService());

    await tester.pumpWidget(
      ProviderScope(
        overrides: [manualStorageModelProvider.overrideWith((_) => model)],
        child: tester.buildApp((_) => const ManualStoragePage()),
      ),
    );

    showCreatePartitionDialog(
      tester.element(find.byType(ManualStoragePage)),
      disk,
      gap,
    );
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(YaruAutocomplete<String>), '/tst foo');
    await tester.pump();

    expect(find.button(find.okLabel), isDisabled);
  });

  testWidgets('edit partition', (tester) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(960, 680);

    final disk = fakeDisk(
      partitions: [
        const Partition(
          number: 1,
          size: 1234567,
          format: 'ext4',
          wipe: 'superblock',
          mount: '/tst',
          preserve: true,
        ),
        const Gap(offset: 123, size: 1000000, usable: GapUsable.YES),
      ],
    );
    final model = buildManualStorageModel(selectedDisk: disk);

    registerMockService<UdevService>(MockUdevService());

    await tester.pumpWidget(
      ProviderScope(
        overrides: [manualStorageModelProvider.overrideWith((_) => model)],
        child: tester.buildApp((_) => const ManualStoragePage()),
      ),
    );

    final result = showEditPartitionDialog(
      tester.element(find.byType(ManualStoragePage)),
      disk,
      disk.partitions.whereType<Partition>().first,
      null,
      disk.partitions.whereType<Gap>().first,
    );
    await tester.pumpAndSettle();

    await tester.tap(find.byType(MenuButtonBuilder<DataUnit>));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const ValueKey(DataUnit.bytes)).last);
    await tester.pump();

    await tester.enterText(find.byType(SpinBox), '123');
    await tester.pump();

    await tester.tap(find.byType(MenuButtonBuilder<PartitionFormat?>));
    await tester.pumpAndSettle();

    await tester.tap(find.menuItem(PartitionFormat.btrfs.displayName));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(YaruAutocomplete<String>), '/tst');
    await tester.pump();

    await tester.tapOk();
    await result;

    verify(
      model.editPartition(
        disk,
        disk.partitions.whereType<Partition>().first,
        size: 123,
        format: PartitionFormat.btrfs,
        wipe: true,
        mount: '/tst',
      ),
    ).called(1);
  });

  testWidgets('edit partition with invalid mount point', (tester) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(960, 680);

    final disk = fakeDisk(
      partitions: [
        const Partition(
          number: 1,
          size: 1234567,
          format: 'ext4',
          wipe: 'superblock',
          mount: '/tst',
          preserve: true,
        ),
        const Gap(offset: 123, size: 1000000, usable: GapUsable.YES),
      ],
    );
    final model = buildManualStorageModel(selectedDisk: disk);

    registerMockService<UdevService>(MockUdevService());

    await tester.pumpWidget(
      ProviderScope(
        overrides: [manualStorageModelProvider.overrideWith((_) => model)],
        child: tester.buildApp((_) => const ManualStoragePage()),
      ),
    );

    showEditPartitionDialog(
      tester.element(find.byType(ManualStoragePage)),
      disk,
      disk.partitions.whereType<Partition>().first,
      null,
      disk.partitions.whereType<Gap>().first,
    );
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(YaruAutocomplete<String>), 'tst');
    await tester.pump();

    expect(find.button(find.okLabel), isDisabled);
  });

  testWidgets('prevent creating VFAT-formatted /boot partition',
      (tester) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(960, 680);

    final disk = fakeDisk();
    const gap = Gap(offset: 0, size: 100000000, usable: GapUsable.YES);
    final model = buildManualStorageModel(selectedDisk: disk);

    registerMockService<UdevService>(MockUdevService());

    await tester.pumpWidget(
      ProviderScope(
        overrides: [manualStorageModelProvider.overrideWith((_) => model)],
        child: tester.buildApp((_) => const ManualStoragePage()),
      ),
    );

    showCreatePartitionDialog(
      tester.element(find.byType(ManualStoragePage)),
      disk,
      gap,
    );
    await tester.pumpAndSettle();

    await tester.tap(find.byType(MenuButtonBuilder<PartitionFormat?>));
    await tester.pumpAndSettle();

    await tester.tap(find.menuItem(PartitionFormat.vfat.displayName));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(YaruAutocomplete<String>), '/boot');
    await tester.pump();

    expect(find.button(find.okLabel), isDisabled);
  });

  testWidgets('prevent formatting existing /boot as VFAT', (tester) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(960, 680);

    final disk = fakeDisk(
      partitions: [
        const Partition(
          number: 1,
          size: 1234567,
          format: 'ext4',
          wipe: 'superblock',
          mount: '/boot',
          preserve: true,
        ),
        const Gap(offset: 123, size: 1000000, usable: GapUsable.YES),
      ],
    );
    final model = buildManualStorageModel(selectedDisk: disk);

    registerMockService<UdevService>(MockUdevService());

    await tester.pumpWidget(
      ProviderScope(
        overrides: [manualStorageModelProvider.overrideWith((_) => model)],
        child: tester.buildApp((_) => const ManualStoragePage()),
      ),
    );

    showEditPartitionDialog(
      tester.element(find.byType(ManualStoragePage)),
      disk,
      disk.partitions.whereType<Partition>().first,
      null,
      disk.partitions.whereType<Gap>().first,
    );
    await tester.pumpAndSettle();

    await tester.tap(find.byType(MenuButtonBuilder<PartitionFormat?>));
    await tester.pumpAndSettle();

    await tester.tap(find.menuItem(PartitionFormat.vfat.displayName));
    await tester.pumpAndSettle();

    expect(find.button(find.okLabel), isDisabled);
  });
}
