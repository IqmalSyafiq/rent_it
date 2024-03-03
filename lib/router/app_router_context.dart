import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rent_it/controllers/navigations_controllers/bottom_navigation_controllers.dart';
import 'package:rent_it/router/routes_info.dart';

/// Extension on [BuildContext] to simplify navigation
extension RouterContextExtension on BuildContext {
  void pop({bool? useNavPop}) {
    if (useNavPop!) {
      Navigator.popUntil(this, (route) => route.isFirst);
    } else {
      GoRouter.of(this).pop();
    }
  }

  void goHome({
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
  }) {
    GoRouter.of(this).goNamed(
      RouteNames.home,
      queryParameters: queryParams,
      extra: extra,
    );
  }

  void goToPage({
    AppTab tab = AppTab.home,
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
  }) {
    final route = tab == AppTab.home
        ? RouteNames.home
        : tab == AppTab.notification
            ? RouteNames.notification
            : tab == AppTab.report
                ? RouteNames.report
                : tab == AppTab.manage
                    ? RouteNames.manage
                    : RouteNames.home;

    GoRouter.of(this).goNamed(
      route,
      queryParameters: queryParams,
      extra: extra,
    );
  }
}
