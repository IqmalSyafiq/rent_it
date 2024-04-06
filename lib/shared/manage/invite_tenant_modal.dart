// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/constant/app_text_styles.dart';
import 'package:rent_it/resources/getters/auth_form_getters.dart';
import 'package:rent_it/services/low_level_services/manage_services/invite_tenant_services.dart';
import 'package:rent_it/shared/app_snackbar.dart';
import 'package:rent_it/shared/app_text_field.dart';
import 'package:rent_it/shared/buttons/primary_button.dart';

Future<void> showInviteTenantModal(BuildContext context, String houseId) async {
  return showDialog(
    context: context,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: InviteTenantModal(houseId: houseId),
    ),
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

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 280,
        child: CustomScrollView(slivers: [
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
        ]),
      );

  Widget buildContent() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextField(controller: emailController, type: FieldTypes.tenantEmail),
          const SizedBox(height: 16),
          buildInviteTenantButton()
        ],
      );

  Widget buildInviteTenantButton() {
    return PrimaryButton(
      needLoading: true,
      onPressed: () async {
        bool? value = await inviteTenant(widget.houseId, emailController.text);
        String message = value == false ? 'Error Encountered' : 'Tenant Invited';
        bool isError = value == false;

        final snackBar = appSnackBar(context, message: message, error: isError);
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        if (value != false) {
          Navigator.pop(context);
        }
      },
      text: 'Invite Tenant',
    );
  }
}
