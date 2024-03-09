import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/constant/app_text_styles.dart';
import 'package:rent_it/controllers/navigations_controllers/bottom_navigation_controllers.dart';
import 'package:rent_it/router/app_router.dart';
import 'package:rent_it/shared/build_user_avatart.dart';
import 'package:rent_it/shared/settings/user_settings.dart';

AppBar buildTopBar(BuildContext context, WidgetRef ref, AppRouteLocations routeLocation) {
  String? title;

  if (routeLocation == AppRouteLocations.notification) {
    title = 'Notifications';
  } else if (routeLocation == AppRouteLocations.report) {
    title = 'Reports';
  } else if (routeLocation == AppRouteLocations.manage) {
    title = 'Manage Houses';
  }

  return AppBar(
    toolbarHeight: 85,
    leadingWidth: 70,
    leading: routeLocation == AppRouteLocations.home
        ? const Row(children: [
            SizedBox(width: 20),
            BuildUserAvatar()
          ])
        : buildBackButton(context, ref),
    title: routeLocation == AppRouteLocations.home
        ? null
        : Text(
            title!,
            style: AppTextStyles.titleLarge.copyWith(fontWeight: FontWeight.w600),
          ),
    centerTitle: true,
    actions: [
      buildSettingButton(context),
      const SizedBox(width: 20),
    ],
  );
}

IconButton buildTopBarIconButton(BuildContext context, IconData icon, Function() onPressed) {
  return IconButton(onPressed: onPressed, icon: Icon(icon, size: 30));
}

IconButton buildBackButton(BuildContext context, WidgetRef ref) {
  return buildTopBarIconButton(
      context,
      Icons.arrow_back,
      () async => {
            Navigator.of(context).pop(),
            ref.read(navigationControllerProvider.notifier).setTab(AppTab.home)
          });
}

IconButton buildSettingButton(BuildContext context) {
  return IconButton(
      onPressed: () async => {
            showSettingModal(context)
          },
      icon: Icon(Icons.settings_outlined, size: 30, color: Theme.of(context).colorScheme.scrim));
}
