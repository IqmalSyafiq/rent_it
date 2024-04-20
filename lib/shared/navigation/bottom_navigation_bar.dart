import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/controllers/navigations_controllers/bottom_navigation_controllers.dart';
import 'package:rent_it/controllers/notification_controllers/notification_controllers.dart';
import 'package:rent_it/resources/strings/top_level_strings/firebase/realtime_db_refs.dart';
import 'package:rent_it/router/app_router_context.dart';

class AppBottomNavigationBar extends ConsumerStatefulWidget {
  const AppBottomNavigationBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends ConsumerState<AppBottomNavigationBar> {
  late final NavigationController navigationController;

  @override
  void initState() {
    super.initState();
    navigationController = ref.read(navigationControllerProvider.notifier);
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(navigationControllerProvider);
    return BottomAppBar(
      color: Theme.of(context).colorScheme.onInverseSurface,
      surfaceTintColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: AppTab.values.map((tab) => _buildIconButton(tab)).toList()),
      ),
    );
  }

  Widget _buildIconButton(AppTab tab) {
    return Stack(
      children: [
        IconButton(
          icon: Icon(getIconData(tab, isSelected: navigationController.currentTab == tab), size: 34),
          color: navigationController.currentTab == tab ? Theme.of(context).colorScheme.inverseSurface : Theme.of(context).colorScheme.scrim,
          onPressed: () {
            navigationController.setTab(tab);
            context.goToPage(tab: tab);
          },
        ),
        if (tab == AppTab.notification)
          ref.watch(userNotificationsListStreamProvider(RealtimeDatabaseRefs().notifications(FirebaseAuth.instance.currentUser?.uid ?? ''))).when(
              data: (notifications) {
                if (notifications.isEmpty) {
                  return Container();
                }
                return Positioned(
                    right: 0,
                    child: Container(
                        padding: const EdgeInsets.all(1),
                        decoration: BoxDecoration(color: Theme.of(context).colorScheme.onTertiaryContainer, borderRadius: BorderRadius.circular(20)),
                        constraints: const BoxConstraints(minWidth: 22, minHeight: 22),
                        child: Center(
                          child: Text(notifications.length.toString(), // Replace with your dynamic data
                              style: TextStyle(color: Theme.of(context).colorScheme.primaryContainer),
                              textAlign: TextAlign.center),
                        )));
              },
              loading: Container.new,
              error: (_, __) => Container()),
      ],
    );
  }

  IconData getIconData(AppTab tab, {bool isSelected = false}) {
    switch (tab) {
      case AppTab.home:
        return isSelected ? Icons.home : Icons.home_outlined;
      case AppTab.notification:
        return isSelected ? Icons.notifications : Icons.notifications_outlined;
      case AppTab.report:
        return isSelected ? Icons.article : Icons.article_outlined;
      case AppTab.manage:
        return isSelected ? Icons.maps_home_work : Icons.maps_home_work_outlined;
      default:
        throw UnimplementedError('Missing icon for $tab');
    }
  }
}
