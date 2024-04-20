import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/constant/app_text_styles.dart';
import 'package:rent_it/controllers/manage_controllers/manage_controllers.dart';
import 'package:rent_it/models/house/house.dart';
import 'package:rent_it/services/low_level_services/notification_services/notification_services.dart';
import 'package:rent_it/shared/app_snackbar.dart';
import 'package:rent_it/shared/buttons/primary_button.dart';
import 'package:rent_it/shared/buttons/secondary_button.dart';

Future<void> showInvitationModal(BuildContext context, String notificationId, String houseId, String tenancyId) async {
  return await showFlexibleBottomSheet(
    context: context,
    minHeight: 0,
    initHeight: 0.3,
    maxHeight: 0.3,
    bottomSheetBorderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
    builder: (context, controller, _) => InvitationModal(
      notificationId: notificationId,
      houseId: houseId,
      tenancyId: tenancyId,
    ),
  );
}

class InvitationModal extends ConsumerStatefulWidget {
  final String notificationId;
  final String houseId;
  final String tenancyId;
  const InvitationModal({required this.notificationId, required this.houseId, required this.tenancyId, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InvitationModalState();
}

class _InvitationModalState extends ConsumerState<InvitationModal> {
  @override
  Widget build(BuildContext context) => CustomScrollView(slivers: [
        SliverAppBar(title: Text('House Invitation', style: AppTextStyles.bodyLarge), pinned: true, automaticallyImplyLeading: false, actions: [
          IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close))
        ]),
        SliverFillRemaining(hasScrollBody: false, child: Padding(padding: const EdgeInsets.only(top: 16, left: 24, right: 24), child: buildContent()))
      ]);

  Widget buildContent() => ref.watch(houseStreamProvider(widget.houseId)).when(
      data: (house) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('You have been invited to join ${house?.addressLineOne}', style: AppTextStyles.bodyMedium),
              const SizedBox(height: 16),
              buildAcceptButton(house!),
              const SizedBox(height: 16),
              buildDeclineButton()
            ],
          ),
      loading: CupertinoActivityIndicator.new,
      error: (_, __) => Container());

  Widget buildAcceptButton(House house) => PrimaryButton(
      needLoading: true,
      onPressed: () async => {
            await acceptInvitation(house, widget.tenancyId).then((value) {
              deleteInvitation(widget.notificationId);
              final snackbar = appSnackBar(context, message: 'Invitation Accepted');
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
              Navigator.pop(context);
            })
          },
      text: 'Accept Invitation');

  Widget buildDeclineButton() => SecondaryButton(
      needLoading: true,
      onPressed: () async => {
            await deleteInvitation(widget.notificationId).then((value) {
              final snackbar = appSnackBar(context, message: 'Invitation Declined');
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
              Navigator.pop(context);
            })
          },
      text: 'Decline Invitation');
}
