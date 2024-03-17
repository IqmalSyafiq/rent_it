import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/constant/app_text_styles.dart';
import 'package:rent_it/resources/getters/form_field_getters.dart';
import 'package:rent_it/shared/app_text_input_field.dart';
import 'package:rent_it/shared/buttons/primary_button.dart';
import 'package:rent_it/shared/custom_form_dropdown.dart';

Future<void> showAddReportModal(BuildContext context, {bool google = false}) async {
  return await showFlexibleBottomSheet(
    context: context,
    minHeight: 0,
    initHeight: 0.85,
    maxHeight: 0.85,
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
  final reportTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) => CustomScrollView(slivers: [
        SliverAppBar(title: Text('Add Report', style: AppTextStyles.bodyLarge), pinned: true, automaticallyImplyLeading: false, actions: [
          IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close))
        ]),
        SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 32, bottom: 16),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('Provide the information below to report the issue', style: AppTextStyles.bodyMedium.copyWith(color: Theme.of(context).colorScheme.outlineVariant)),
                  const SizedBox(height: 32),
                  AppFormTextField(controller: reportTitleController, type: FormFieldType.reportTitle),
                  CustomFormDropdown(
                      label: 'House',
                      hint: 'Select House',
                      items: const [
                        'House 1',
                        'House 2'
                      ],
                      onItemSelected: (value) {}),
                  CustomFormDropdown(
                      label: 'Type of Report',
                      hint: 'Select Type of Report',
                      items: const [
                        'House ',
                        'Others'
                      ],
                      onItemSelected: (value) {}),
                  AppFormTextField(controller: reportTitleController, type: FormFieldType.reportDescription),
                  PrimaryButton(onPressed: () {}, text: 'Submit')
                ])))
      ]);
}
