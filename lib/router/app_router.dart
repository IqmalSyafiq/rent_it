import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:rent_it/router/routes_info.dart';
import 'package:rent_it/shared/a_level/parent_scf.dart';
import 'package:rent_it/views/auth_view.dart';
import 'package:rent_it/views/home_view.dart';
import 'package:rent_it/views/manage_view.dart';
import 'package:rent_it/views/notification_view.dart';
import 'package:rent_it/views/report_view.dart';

enum AppRouteLocations {
  auth,
  home,
  notification,
  report,
  manage
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (_) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

class MyRouter {
  // Singleton instance
  static final MyRouter _instance = MyRouter._internal();

  factory MyRouter() {
    return _instance;
  }

  MyRouter._internal() {
    // Define your GoRouter configuration
    _router = GoRouter(
      refreshListenable: GoRouterRefreshStream(FirebaseAuth.instance.authStateChanges()),
      redirect: (context, state) {
        if (FirebaseAuth.instance.currentUser == null) {
          return RoutePaths.auth;
        } else if (FirebaseAuth.instance.currentUser != null && state.uri.toString().contains('auth')) {
          return RoutePaths.home;
        }
        return null;
      },
      errorBuilder: (context, state) {
        Logger().w('Error: ${state.error}');
        return const ParentScaffold(routeLocation: AppRouteLocations.home, child: HomeView());
      },
      routes: [
        GoRoute(
          name: RouteNames.auth,
          path: RoutePaths.auth,
          builder: (context, state) => const AuthView(),
        ),
        GoRoute(
          name: RouteNames.home,
          path: RoutePaths.home,
          pageBuilder: (context, state) => CustomSlideTransition(child: const ParentScaffold(routeLocation: AppRouteLocations.home, child: HomeView())),
          routes: [
            GoRoute(
              name: RouteNames.notification,
              path: RoutePaths.notification,
              pageBuilder: (context, state) => CustomSlideTransition(child: const ParentScaffold(routeLocation: AppRouteLocations.notification, child: NotificationView())),
            ),
            GoRoute(
              name: RouteNames.report,
              path: RoutePaths.report,
              pageBuilder: (context, state) => CustomSlideTransition(child: const ParentScaffold(routeLocation: AppRouteLocations.report, child: ReportView())),
            ),
            GoRoute(
              name: RouteNames.manage,
              path: RoutePaths.manage,
              pageBuilder: (context, state) => CustomSlideTransition(child: ParentScaffold(key: state.pageKey, routeLocation: AppRouteLocations.manage, child: const ManageView())),
            ),
          ],
        ),
      ],
    );
  }

  late GoRouter _router;

  GoRouter get router => _router;
}

class CustomSlideTransition extends CustomTransitionPage<void> {
  CustomSlideTransition({required super.child, super.key})
      : super(
          transitionDuration: const Duration(milliseconds: 100),
          transitionsBuilder: (_, animation, __, child) => FadeTransition(
            opacity: animation.drive(
              Tween(
                // ignore: prefer_int_literals
                begin: 0.0,
                // ignore: prefer_int_literals
                end: 1.0,
              ).chain(
                CurveTween(curve: Curves.ease),
              ),
            ),
            child: child,
          ),
        );
}
