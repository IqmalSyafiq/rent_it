import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/controllers/navigations_controllers/bottom_navigation_controllers.dart';
import 'package:rent_it/router/app_router.dart';
import 'package:rent_it/shared/navigation/bottom_navigation_bar.dart';
import 'package:rent_it/shared/settings/user_settings.dart';

class ParentScaffold extends ConsumerStatefulWidget {
  final AppRouteLocations routeLocation;
  final Widget child;
  final bool hideNavigations;
  const ParentScaffold({required this.routeLocation, required this.child, this.hideNavigations = false, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ParentScaffoldState();
}

class _ParentScaffoldState extends ConsumerState<ParentScaffold> {
  @override
  Widget build(BuildContext context) {
    ref.watch(navigationControllerProvider);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 85,
        leadingWidth: 70,
        leading: Row(children: [
          const SizedBox(width: 20),
          SizedBox(
              width: 45,
              height: 45,
              child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  backgroundImage: FirebaseAuth.instance.currentUser?.photoURL != null && FirebaseAuth.instance.currentUser?.photoURL != ''
                      ? NetworkImage(
                          FirebaseAuth.instance.currentUser?.photoURL ?? '',
                        )
                      : null,
                  child: FirebaseAuth.instance.currentUser?.photoURL == null || FirebaseAuth.instance.currentUser?.photoURL == ''
                      ? Icon(
                          Icons.person,
                          size: 26,
                          color: Theme.of(context).colorScheme.primary,
                        )
                      : null))
        ]),
        actions: [
          IconButton(
              onPressed: () async => {
                    showSettingModal(context)
                  },
              icon: Icon(Icons.settings_outlined, size: 30, color: Theme.of(context).colorScheme.scrim)),
          const SizedBox(width: 20),
        ],
      ),
      bottomNavigationBar: widget.hideNavigations ? null : const AppBottomNavigationBar(),
      body: SafeArea(child: widget.child),
    );
  }
}
