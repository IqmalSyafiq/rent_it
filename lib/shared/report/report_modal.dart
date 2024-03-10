import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/constant/app_text_styles.dart';

Future<void> showReportModal(BuildContext context, {bool google = false}) async {
  return await showFlexibleBottomSheet(
    context: context,
    minHeight: 0,
    initHeight: 0.7,
    maxHeight: 0.7,
    bottomSheetBorderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
    builder: (context, controller, _) => const ReportModal(),
  );
}

class ReportModal extends ConsumerStatefulWidget {
  const ReportModal({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ReportModalState();
}

class _ReportModalState extends ConsumerState<ReportModal> {
  @override
  Widget build(BuildContext context) => CustomScrollView(slivers: [
        SliverAppBar(
          title: Text('Report', style: AppTextStyles.bodyLarge),
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
