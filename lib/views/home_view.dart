import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/controllers/user_controllers/user_controllers.dart';
import 'package:rent_it/router/app_router.dart';
import 'package:rent_it/shared/a_level/parent_scf.dart';
import 'package:rent_it/shared/auth/auth_role_selector.dart';
import 'package:rent_it/shared/home/build_authed_content.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  final pageViewController = PageController();

  @override
  Widget build(BuildContext context) {
    return ref.watch(userRoleStreamProvider).when(
        data: (userRole) {
          return ParentScaffold(
            routeLocation: AppRouteLocations.home,
            hideNavigations: userRole == null,
            child: userRole == null ? _buildOnboarding() : const BuildAuthedContent(),
          );
        },
        loading: CupertinoActivityIndicator.new,
        error: (_, __) => Text(_.toString()));
  }

  Widget _buildOnboarding() {
    return const Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
            height: 300,
            child: Flex(direction: Axis.vertical, children: [
              AuthRoleSelector()
            ])));
  }
}

// 3 conditons here, when user have no role and user with role of tenant or owner. Need to create 3 different state based on the role so that we can show different UI based on the role.
