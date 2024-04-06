// ignore_for_file: use_build_context_synchronously

import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/constant/app_text_styles.dart';
import 'package:rent_it/controllers/manage_controllers/manage_controllers.dart';
import 'package:rent_it/controllers/user_controllers/user_controllers.dart';
import 'package:rent_it/models/app_user/app_user.dart';
import 'package:rent_it/models/house/house.dart';
import 'package:rent_it/models/report/report.dart';
import 'package:rent_it/resources/getters/form_field_getters.dart';
import 'package:rent_it/services/low_level_services/report_services/report_services.dart';
import 'package:rent_it/services/top_level_services/main_services.dart/main_services.dart';
import 'package:rent_it/shared/app_snackbar.dart';
import 'package:rent_it/shared/app_text_input_field.dart';
import 'package:rent_it/shared/buttons/primary_button.dart';
import 'package:rent_it/shared/custom_form_dropdown.dart';

Future<void> showAddReportModal(BuildContext context) async {
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
  final reportDescriptionController = TextEditingController();
  House? house;
  ReportType? reportType;

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
                  _buildHouseDropdown(),
                  _buildReportTypeDropdown(),
                  AppFormTextField(controller: reportDescriptionController, type: FormFieldType.reportDescription),
                  _buildSubmitButton()
                ])))
      ]);

  Widget _buildHouseDropdown() => ref.watch(housesStreamProvider(UserRole.tenant)).when(
        data: (houses) => CustomFormDropdown(
            label: 'House',
            hint: 'Select House',
            items: houses.map((house) => house.addressLineOne).toList(),
            onItemSelected: (value) {
              setState(() {
                house = houses.firstWhere((element) => element.addressLineOne == value);
              });
            }),
        loading: () => const CupertinoActivityIndicator(),
        error: (error, stack) => Text('Error: $error'),
      );

  Widget _buildReportTypeDropdown() => CustomFormDropdown(
        label: 'Report Type',
        hint: 'Select Report Type',
        items: ReportType.values.map((e) {
          String str = e.toString().split('.').last;
          return '${str[0].toUpperCase()}${str.substring(1)}';
        }).toList(),
        onItemSelected: (value) {
          setState(() {
            reportType = ReportType.values.firstWhere((element) => element.toString().split('.').last == value.toLowerCase());
          });
        },
      );

  Widget _buildSubmitButton() => ref.watch(userNameStreamProvider).when(
      data: (userName) => PrimaryButton(
          needLoading: true,
          disabled: reportTitleController.text.isEmpty && reportDescriptionController.text.isEmpty && (house == null || reportType == null),
          onDisabledPressed: () => showErrorSnackbar(context, 'Please fill in all fields'),
          onPressed: () async {
            await addReport(reportTitleController.text, reportDescriptionController.text, house!, userName);

            final snackbar = appSnackBar(context, message: 'Report Submitted');
            ScaffoldMessenger.of(context).showSnackBar(snackbar);

            Navigator.pop(context);
          },
          text: 'Submit'),
      loading: Container.new,
      error: (_, __) => Container());
}
