import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/constant/app_text_styles.dart';
import 'package:rent_it/controllers/manage_controllers/manage_controllers.dart';
import 'package:rent_it/controllers/user_controllers/user_controllers.dart';
import 'package:rent_it/models/app_user/app_user.dart';
import 'package:rent_it/models/house/house.dart';
import 'package:rent_it/shared/home/build_notifcation_section.dart';
import 'package:rent_it/shared/home/build_welcome.dart';
import 'package:rent_it/shared/manage/add_house_modal.dart';
import 'package:rent_it/shared/manage/house_modal.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BuildAuthedContent extends ConsumerStatefulWidget {
  const BuildAuthedContent({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BuildAuthedContentState();
}

class _BuildAuthedContentState extends ConsumerState<BuildAuthedContent> {
  final pageViewController = PageController();

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BuildWelcome(),
          _buildHouseContainer(),
          const BuildNotificationSection()
        ],
      );

  Widget _buildHouseContainer() {
    return ref.watch(userRoleStreamProvider).when(
        data: (userRole) => ref.watch(housesStreamProvider(userRole)).when(
            data: (houses) => Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: houses.isNotEmpty ? onHousesExist(houses) : onHouseDontExist(),
                    ),
                  ),
                ),
            loading: () => const CircularProgressIndicator(),
            error: (_, __) => Text('Error: ${_.toString()}')),
        loading: Container.new,
        error: (_, __) => Container());
  }

  List<Widget> onHousesExist(List<House> houses) => [
        Text('Your Houses', style: AppTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w700)),
        const SizedBox(height: 20),
        Expanded(
            child: PageView.builder(
                controller: pageViewController,
                itemCount: houses.length,
                itemBuilder: (context, index) => buildHouse(
                      house: houses[index],
                    ))),
        const SizedBox(height: 20),
        if (houses.length > 1) SmoothPageIndicator(controller: pageViewController, count: houses.length, effect: WormEffect(activeDotColor: Theme.of(context).colorScheme.primary, dotColor: Theme.of(context).colorScheme.surfaceTint)),
      ];

  Widget buildHouse({required House house}) => Container(
      margin: const EdgeInsets.only(right: 2),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondaryContainer, borderRadius: BorderRadius.circular(10)),
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(house.addressLineOne, style: AppTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w700)),
        Text(house.addressLineTwo ?? '', style: AppTextStyles.bodySmall.copyWith(color: Theme.of(context).colorScheme.surfaceTint)),
        Text('${house.postCode} ${house.city}', style: AppTextStyles.bodySmall.copyWith(color: Theme.of(context).colorScheme.surfaceTint)),
        Text(house.state, style: AppTextStyles.bodySmall.copyWith(color: Theme.of(context).colorScheme.surfaceTint)),
        const SizedBox(height: 15),
        buildManageButton(house.id)
      ]));

  Widget buildManageButton(String houseId) => InkWell(
        onTap: () => showHouseModal(context, houseId),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Text('View', style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w700, color: Theme.of(context).colorScheme.primary)),
        ]),
      );

  List<Widget> onHouseDontExist() => ref.watch(userRoleStreamProvider).when(
      data: (userRole) => userRole == UserRole.owner
          ? [
              Text('You have not added any houses yet', style: AppTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w700)),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: () => showAddHouseModal(context), style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.primary, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))), child: Text('Add House', style: AppTextStyles.bodyMedium.copyWith(color: Theme.of(context).colorScheme.onPrimary)))
            ]
          : [
              Text('You have not been added to any houses yet', style: AppTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w700))
            ],
      loading: () => [
            const CupertinoActivityIndicator()
          ],
      error: (_, __) => [
            Text('Error: ${_.toString()}')
          ]);
}
