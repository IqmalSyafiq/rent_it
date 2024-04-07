import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/constant/app_text_styles.dart';

Future<void> showAddDocumentModal(BuildContext context, String tenancyId) async {
  return await showFlexibleBottomSheet(
    context: context,
    minHeight: 0,
    initHeight: 0.5,
    maxHeight: 0.5,
    bottomSheetBorderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
    builder: (context, controller, _) => AddDocumentModal(tenancyId: tenancyId),
  );
}

class AddDocumentModal extends ConsumerStatefulWidget {
  final String tenancyId;
  const AddDocumentModal({required this.tenancyId, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddDocumentModalState();
}

class _AddDocumentModalState extends ConsumerState<AddDocumentModal> {
  @override
  Widget build(BuildContext context) => CustomScrollView(slivers: [
        SliverAppBar(
          title: Text('Add Document', style: AppTextStyles.bodyLarge),
          pinned: true,
          automaticallyImplyLeading: false,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8))),
          actions: [
            IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close))
          ],
        ),
        SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              padding: const EdgeInsets.only(top: 16, left: 24, right: 24),
              child: Container(),
            ))
      ]);
}
