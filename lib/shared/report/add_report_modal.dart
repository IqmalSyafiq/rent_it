import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/constant/app_text_styles.dart';

Future<void> showAddReportModal(BuildContext context, {bool google = false}) async {
  return await showFlexibleBottomSheet(
    context: context,
    minHeight: 0,
    initHeight: 0.7,
    maxHeight: 0.7,
    bottomSheetBorderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
    builder: (context, controller, _) => const AddReportModal(),
  );
}

class AddReportModal extends ConsumerStatefulWidget {
  const AddReportModal({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddReportModalState();
}

class _AddReportModalState extends ConsumerState<AddReportModal> {
  @override
  Widget build(BuildContext context) => CustomScrollView(slivers: [
        SliverAppBar(
          title: Text('Add Report', style: AppTextStyles.bodyLarge),
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
