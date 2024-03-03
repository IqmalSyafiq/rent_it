import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/controllers/home_controllers/home_controllers.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ref.watch(userRoleStreamProvider).when(
        data: (userRole) {
          return Container(
            color: Colors.deepOrangeAccent,
            child: const Center(
              child: Text('Home View'),
            ),
          );
        },
        loading: CupertinoActivityIndicator.new,
        error: (_, __) => Text(_.toString()));
  }
}



// 3 conditons here, when user have no role and user with role of tenant or owner. Need to create 3 different state based on the role so that we can show different UI based on the role.