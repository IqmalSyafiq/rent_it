import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rent_it/router/routes_info.dart';
import 'package:rent_it/views/home_view.dart';

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
      initialLocation: RoutePaths.auth,
      refreshListenable: GoRouterRefreshStream(FirebaseAuth.instance.authStateChanges()),
      redirect: (context, state) {
        if (FirebaseAuth.instance.currentUser != null) {
          return RoutePaths.home;
        }
        if (FirebaseAuth.instance.currentUser == null) {
          return RoutePaths.auth;
        }
        return null;
      },
      errorBuilder: (context, state) => const HomeView(),
      routes: [
        GoRoute(
          name: RouteNames.auth,
          path: RoutePaths.auth,
          builder: (context, state) => const HomeView(),
        ),
        GoRoute(
          name: RoutePaths.home,
          path: RoutePaths.home,
          builder: (context, state) => const HomeView(),
          // routes: [
          //   GoRoute(
          //     name: RoutePaths.registration,
          //     path: RoutePaths.registration,
          //     builder: (context, state) => const RegistrationPage(),
          //   ),
          // ],
        ),
      ],
    );
  }

  late GoRouter _router;

  GoRouter get router => _router;
}
