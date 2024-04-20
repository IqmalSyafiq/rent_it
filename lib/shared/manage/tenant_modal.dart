import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/constant/app_text_styles.dart';
import 'package:rent_it/controllers/manage_controllers/manage_controllers.dart';
import 'package:rent_it/controllers/user_controllers/user_controllers.dart';
import 'package:rent_it/models/app_user/app_user.dart';
import 'package:rent_it/services/low_level_services/manage_services/manage_services.dart';
import 'package:rent_it/services/top_level_services/main_services.dart/main_services.dart';
import 'package:rent_it/shared/app_snackbar.dart';
import 'package:rent_it/shared/build_info_widgets.dart';
import 'package:rent_it/shared/buttons/secondary_button.dart';

Future<void> showTenantModal(BuildContext context, String tenantId, String houseId) async {
  return await showFlexibleBottomSheet(
    context: context,
    minHeight: 0,
    initHeight: 0.7,
    maxHeight: 0.7,
    bottomSheetBorderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
    builder: (context, controller, _) => TenantModal(tenantId: tenantId, houseId: houseId),
  );
}

class TenantModal extends ConsumerStatefulWidget {
  final String tenantId;
  final String houseId;
  const TenantModal({required this.tenantId, required this.houseId, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TenantModalState();
}

class _TenantModalState extends ConsumerState<TenantModal> {
  @override
  Widget build(BuildContext context) => CustomScrollView(slivers: [
        SliverAppBar(title: buildAppbarText(), pinned: true, automaticallyImplyLeading: false, actions: [
          IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close))
        ]),
        SliverFillRemaining(
          hasScrollBody: false,
          child: buildContent(),
        )
      ]);

  Widget buildAppbarText() => ref.watch(userByIdStreamProvider(widget.tenantId)).when(
        data: (user) => Text(user.userName, style: AppTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w700)),
        loading: Container.new,
        error: (_, __) => Text(_.toString()),
      );

  Widget buildContent() => ref.watch(userByIdStreamProvider(widget.tenantId)).when(
        data: (user) => Padding(
          padding: const EdgeInsets.only(top: 16, left: 24, right: 24, bottom: 16),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            buildUserInfoSection(user),
            buildTenancyInfo(),
            buildTenancyDocumentsSection(),
            buildRemoveTenantButton(),
          ]),
        ),
        loading: Container.new,
        error: (_, __) => Text(_.toString()),
      );

  Widget buildUserInfoSection(AppUser user) => buildSection(children: [
        const BuildInfoHeading(text: 'Tenant Info'),
        BuildInfoContainer(title: 'Username', value: user.userName),
        BuildInfoContainer(title: 'Email', value: user.email),
      ]);

  Widget buildTenancyInfo() => ref.watch(tenancyStreamProvider('${widget.tenantId}.${widget.houseId}')).when(
        data: (tenancy) => buildSection(children: [
          const BuildInfoHeading(text: 'Tenancy Info'),
          BuildInfoContainer(title: 'Tenancy Period', value: getDateDifferenceInYearsMonthsDays(tenancy?.startDate ?? 0, tenancy?.endDate ?? 0)),
          BuildInfoContainer(title: 'Start Date', value: formatMillisecondsSinceEpoch(tenancy?.startDate ?? 0)),
          BuildInfoContainer(title: 'End Date', value: formatMillisecondsSinceEpoch(tenancy?.endDate ?? 0)),
          BuildInfoContainer(title: 'Rent Amount', value: 'RM ${tenancy?.rentAmount}'),
        ]),
        loading: Container.new,
        error: (_, __) => Container(),
      );

  Widget buildTenancyDocumentsSection() => ref.watch(tenancyStreamProvider('${widget.tenantId}.${widget.houseId}')).when(
        data: (tenancy) => ref.watch(tenancyDocumentsStreamProvider(tenancy?.id)).when(
            data: (tenancyDocuments) => buildSection(
                  children: [
                    const BuildInfoHeading(text: 'Tenancy Documents'),
                    ...tenancyDocuments
                        .map((document) => BuildInfoContainer(
                              title: document.documentType,
                              value: document.documentName,
                              extraInfo: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                      onPressed: () async => {
                                            await downloadDocument(context, document.documentUrl, document.documentName)
                                          },
                                      icon: const Icon(Icons.downloading_sharp)),
                                ],
                              ),
                            ))
                        .toList(),
                  ],
                ),
            loading: Container.new,
            error: (_, __) => Text(_.toString())),
        loading: Container.new,
        error: (_, __) => Container(),
      );

  Widget buildHouseName(String houseId) => ref.watch(houseStreamProvider(houseId)).when(
        data: (house) {
          String houseName = 'Address not found';

          if (house != null) {
            houseName = house.addressLineOne;
          }

          return BuildInfoContainer(title: 'House', value: houseName);
        },
        loading: () => const CupertinoActivityIndicator(),
        error: (_, __) => Text(_.toString()),
      );

  Widget buildFromUser(String reporterId) => ref.watch(userByIdStreamProvider(reporterId)).when(
        data: (user) {
          return BuildInfoContainer(title: 'From', value: user.userName);
        },
        loading: () => const CupertinoActivityIndicator(),
        error: (_, __) => Text(_.toString()),
      );

  Widget buildSection({List<Widget>? children}) => Container(
        margin: const EdgeInsets.only(bottom: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children ?? [],
        ),
      );

  Widget buildRemoveTenantButton() => ref.watch(houseStreamProvider(widget.houseId)).when(
        data: (house) => ref.watch(tenancyStreamProvider('${widget.tenantId}.${widget.houseId}')).when(
              data: (tenancy) => SecondaryButton(
                onPressed: () async => {
                  if (house != null)
                    {
                      await removeTenant(house, widget.tenantId, tenancy?.id ?? '').then((_) {
                        final snackBar = appSnackBar(context, message: 'Tenant Removed');
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        Navigator.pop(context);
                      })
                    }
                },
                needLoading: true,
                text: 'Remove Tenant',
                textColor: Theme.of(context).colorScheme.error,
              ),
              loading: Container.new,
              error: (_, __) => Container(),
            ),
        loading: Container.new,
        error: (_, __) => Container(),
      );
}
