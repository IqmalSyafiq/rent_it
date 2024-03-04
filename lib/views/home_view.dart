import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/constant/app_text_styles.dart';
import 'package:rent_it/controllers/user_controllers/user_controllers.dart';
import 'package:rent_it/router/app_router.dart';
import 'package:rent_it/shared/a_level/parent_scf.dart';
import 'package:rent_it/shared/auth/auth_role_selector.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning,';
    }
    if (hour < 17) {
      return 'Good Afternoon,';
    }
    return 'Good Evening,';
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(userRoleStreamProvider).when(
        data: (userRole) {
          return ParentScaffold(
            routeLocation: AppRouteLocations.home,
            hideNavigations: userRole == null,
            child: userRole == null
                ? _buildOnboarding()
                : Container(
                    padding: const EdgeInsets.all(20),
                    child: _buildWelcome(),
                  ),
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

  Widget _buildWelcome() => ref.watch(userNameStreamProvider).when(
      data: (userName) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(greeting(), style: AppTextStyles.titleLarge.copyWith(fontWeight: FontWeight.w500)),
              const SizedBox(height: 6),
              Text(userName, style: AppTextStyles.titleLarge.copyWith(fontWeight: FontWeight.w700)),
            ],
          ),
      loading: Container.new,
      error: (_, __) => Container());
}



// 3 conditons here, when user have no role and user with role of tenant or owner. Need to create 3 different state based on the role so that we can show different UI based on the role.