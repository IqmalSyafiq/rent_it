import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/constant/app_text_styles.dart';
import 'package:rent_it/controllers/manage_controllers/manage_controllers.dart';
import 'package:rent_it/controllers/user_controllers/user_controllers.dart';
import 'package:rent_it/models/app_user/app_user.dart';
import 'package:rent_it/models/house/house.dart';
import 'package:rent_it/shared/build_info_widgets.dart';
import 'package:rent_it/shared/manage/invite_tenant_modal.dart';

Future<void> showHouseModal(BuildContext context, String houseId) async {
  return await showFlexibleBottomSheet(
    context: context,
    minHeight: 0,
    initHeight: 0.7,
    maxHeight: 0.7,
    bottomSheetBorderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
    builder: (context, controller, _) => HouseModal(houseId: houseId),
  );
}

class HouseModal extends ConsumerStatefulWidget {
  final String houseId;
  const HouseModal({
    required this.houseId,
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HouseModalState();
}

class _HouseModalState extends ConsumerState<HouseModal> {
  @override
  Widget build(BuildContext context) => CustomScrollView(slivers: [
        SliverAppBar(title: buildAppbarText(), pinned: true, automaticallyImplyLeading: false, actions: [
          IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close))
        ]),
        SliverFillRemaining(hasScrollBody: false, child: buildContent())
      ]);

  Widget buildAppbarText() => ref.watch(houseStreamProvider(widget.houseId)).when(
        data: (house) => Text(house?.addressLineOne ?? 'House', style: AppTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w700)),
        loading: Container.new,
        error: (_, __) => Text(_.toString()),
      );

  Widget buildContent() => ref.watch(userRoleStreamProvider).when(
      data: (userRole) => ref.watch(houseStreamProvider(widget.houseId)).when(
            data: (house) => Padding(
                padding: const EdgeInsets.only(top: 16, left: 24, right: 24),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  buildAddressDetails(house),
                  buildHouseDetails(house),
                  buildTenantSection()
                ])),
            loading: Container.new,
            error: (_, __) => Text(_.toString()),
          ),
      loading: Container.new,
      error: (_, __) => Text(_.toString()));

  Widget buildAddressDetails(House? house) => buildSection(
        children: [
          const BuildInfoHeading(text: 'Address Details'),
          BuildInfoContainer(title: 'Address', value: '${house?.addressLineOne ?? ''}, ${house?.addressLineTwo ?? ''}'),
          BuildInfoContainer(title: 'Postcode', value: house?.postCode.toString() ?? ''),
          BuildInfoContainer(title: 'City', value: house?.city ?? ''),
          BuildInfoContainer(title: 'State', value: house?.state ?? ''),
        ],
      );

  Widget buildHouseDetails(House? house) => buildSection(
        children: [
          const BuildInfoHeading(text: 'House Details'),
          BuildInfoContainer(title: 'Number of Bedroom', value: house?.numRooms.toString() ?? ''),
          BuildInfoContainer(title: 'Number of Bathroom', value: house?.bathrooms.toString() ?? ''),
          BuildInfoContainer(title: 'Description', value: house?.description ?? ''),
        ],
      );

//! need to show this only to the owner
//* show the list of tenancy with tenant/user id attached to it
  Widget buildTenants(House? house) => ref.watch(tenantsStreamProvider(house?.id ?? '')).when(
        data: (tenants) => buildSection(
          children: [
            const BuildInfoHeading(text: 'Tenants'),
            ...tenants.map((tenant) => buildTenantInfo(tenant.tenantId)).toList(),
            addTenantButton(house?.id ?? '')
          ],
        ),
        loading: Container.new,
        error: (_, __) => Text(_.toString()),
      );

  Widget buildTenantInfo(String tenantId) => ref.watch(userByIdStreamProvider(tenantId)).when(
        data: (user) => BuildInfoContainer(title: user.userName, value: user.email),
        loading: Container.new,
        error: (_, __) => Text(_.toString()),
      );

  Widget addTenantButton(String houseId) => Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          ),
          onPressed: () => {
            showInviteTenantModal(context, houseId)
          },
          child: Text('Add Tenant', style: AppTextStyles.bodySmall),
        ),
      );

  Widget buildTenantSection() => ref.watch(userRoleStreamProvider).when(
      data: (userRole) {
        if (userRole == UserRole.owner) {
          return ref.watch(houseStreamProvider(widget.houseId)).when(
                data: (house) => buildTenants(house),
                loading: Container.new,
                error: (_, __) => Text(_.toString()),
              );
        }
        return Container();
      },
      loading: Container.new,
      error: (_, __) => Text(_.toString()));

  Widget buildSection({List<Widget>? children}) => Container(
        margin: const EdgeInsets.only(bottom: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children ?? [],
        ),
      );
}
