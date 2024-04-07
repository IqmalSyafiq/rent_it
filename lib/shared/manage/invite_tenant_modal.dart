// ignore_for_file: use_build_context_synchronously

import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/constant/app_text_styles.dart';
import 'package:rent_it/controllers/manage_controllers/manage_controllers.dart';
import 'package:rent_it/resources/getters/auth_form_getters.dart';
import 'package:rent_it/services/low_level_services/manage_services/invite_tenant_services.dart';
import 'package:rent_it/shared/app_date_picker_field.dart';
import 'package:rent_it/shared/app_snackbar.dart';
import 'package:rent_it/shared/app_text_field.dart';
import 'package:rent_it/shared/buttons/primary_button.dart';

Future<void> showInviteTenantModal(BuildContext context, String houseId) async {
  return await showFlexibleBottomSheet(
    context: context,
    minHeight: 0,
    initHeight: 0.7,
    maxHeight: 0.7,
    bottomSheetBorderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
    builder: (context, controller, _) => InviteTenantModal(houseId: houseId),
  );
}

class InviteTenantModal extends ConsumerStatefulWidget {
  final String houseId;
  const InviteTenantModal({required this.houseId, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InviteTenantModalState();
}

class _InviteTenantModalState extends ConsumerState<InviteTenantModal> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController startDateFinalController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController endDateFinalController = TextEditingController();

  @override
  Widget build(BuildContext context) => CustomScrollView(slivers: [
        SliverAppBar(
          title: Text('Invite Tenant', style: AppTextStyles.bodyLarge),
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
              child: buildContent(),
            ))
      ]);

  Widget buildContent() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextField(controller: emailController, type: FieldTypes.tenantEmail),
          AppDatePickerField(controller: startDateController, finalController: startDateFinalController, label: 'Tenancy Start Date'),
          AppDatePickerField(controller: endDateController, finalController: endDateFinalController, label: 'Tenancy End Date'),
          const SizedBox(height: 16),
          buildInviteTenantButton()
        ],
      );

  Widget buildInviteTenantButton() {
    return ref.watch(houseStreamProvider(widget.houseId)).when(
        data: (house) => PrimaryButton(
              needLoading: true,
              onPressed: () async {
                if (house != null) {
                  DateTime startDate = DateTime.parse(startDateFinalController.text);
                  int startDateMilli = startDate.millisecondsSinceEpoch;

                  DateTime endDate = DateTime.parse(endDateFinalController.text);
                  int endDateMilli = endDate.millisecondsSinceEpoch;

                  bool? value = await inviteTenant(
                    house,
                    emailController.text,
                    startDateMilli,
                    endDateMilli,
                  );
                  String message = value == false ? 'Error Encountered' : 'Tenant Invited';
                  bool isError = value == false;

                  final snackBar = appSnackBar(context, message: message, error: isError);
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);

                  if (value != false) {
                    Navigator.pop(context);
                  }
                }
              },
              text: 'Invite Tenant',
            ),
        loading: Container.new,
        error: (_, __) => Container());
  }
}
