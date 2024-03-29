import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/constant/app_text_styles.dart';
import 'package:rent_it/controllers/manage_controllers/manage_controllers.dart';
import 'package:rent_it/shared/home/build_notifcation_section.dart';
import 'package:rent_it/shared/home/build_welcome.dart';
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
    return ref.watch(userHouseStreamProvider).when(
        data: (houses) => Expanded(
                child: Container(
              margin: const EdgeInsets.symmetric(vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Your houses', style: AppTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w500, color: Theme.of(context).colorScheme.surfaceTint)),
                  const SizedBox(height: 10),
                  Expanded(
                    child: PageView.builder(
                        controller: pageViewController,
                        itemCount: houses.length,
                        itemBuilder: (context, index) {
                          var house = houses[index];

                          return Container(
                              margin: const EdgeInsets.only(right: 2),
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondaryContainer, borderRadius: BorderRadius.circular(10)),
                              child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start, children: [
                                Text(house.addressLineOne, style: AppTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w700)),
                                Text(house.addressLineTwo ?? '', style: AppTextStyles.bodySmall.copyWith(color: Theme.of(context).colorScheme.surfaceTint)),
                                Text('${house.postCode} ${house.city}', style: AppTextStyles.bodySmall.copyWith(color: Theme.of(context).colorScheme.surfaceTint)),
                                Text(house.state, style: AppTextStyles.bodySmall.copyWith(color: Theme.of(context).colorScheme.surfaceTint)),
                                const SizedBox(height: 15),
                                Row(children: [
                                  Text('Manage', style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w700, color: Theme.of(context).colorScheme.primary)),
                                  const SizedBox(width: 10),
                                  Icon(Icons.edit_note_outlined, color: Theme.of(context).colorScheme.primary, size: 20)
                                ])
                              ]));
                        }),
                  ),
                  if (houses.length > 1) ...[
                    const SizedBox(height: 10),
                    Align(
                      child: SmoothPageIndicator(
                          controller: pageViewController, // PageController
                          count: houses.length,
                          effect: ExpandingDotsEffect(dotHeight: 12, dotWidth: 12, dotColor: Theme.of(context).colorScheme.scrim, activeDotColor: Theme.of(context).colorScheme.primary),
                          onDotClicked: (index) {}),
                    )
                  ]
                ],
              ),
            )),
        loading: () => const CircularProgressIndicator(),
        error: (_, __) => Text('Error: ${_.toString()}'));
  }
}
