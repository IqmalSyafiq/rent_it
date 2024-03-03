import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AppTab {
  home,
  notification,
  report,
  manage
}

class NavigationController extends StateNotifier<int> {
  NavigationController() : super(AppTab.home.index);

  void setTab(AppTab tab) {
    state = tab.index;
  }

  AppTab get currentTab => AppTab.values[state];
}

final navigationControllerProvider = StateNotifierProvider<NavigationController, int>((ref) => NavigationController());
