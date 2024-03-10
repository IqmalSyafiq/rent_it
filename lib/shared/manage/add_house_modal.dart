import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/constant/app_text_styles.dart';

Future<void> showAddHouseModal(BuildContext context, {bool google = false}) async {
  return await showFlexibleBottomSheet(
    context: context,
    minHeight: 0,
    initHeight: 0.7,
    maxHeight: 0.7,
    bottomSheetBorderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
    builder: (context, controller, _) => const AddHouseModal(),
  );
}

class AddHouseModal extends ConsumerStatefulWidget {
  const AddHouseModal({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddHouseModalState();
}

class _AddHouseModalState extends ConsumerState<AddHouseModal> {
  @override
  Widget build(BuildContext context) => CustomScrollView(slivers: [
        SliverAppBar(
          title: Text('Add House', style: AppTextStyles.bodyLarge),
          pinned: true,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.close),
            ),
          ],
        ),
        const SliverFillRemaining()
      ]);
}
