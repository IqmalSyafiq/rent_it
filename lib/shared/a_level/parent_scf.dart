import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/controllers/navigations_controllers/bottom_navigation_controllers.dart';
import 'package:rent_it/router/app_router.dart';
import 'package:rent_it/shared/navigation/bottom_navigation_bar.dart';
import 'package:rent_it/shared/navigation/build_top_bar.dart';

class ParentScaffold extends ConsumerStatefulWidget {
  final AppRouteLocations routeLocation;
  final Widget child;
  final bool hideNavigations;
  final Widget? floatingActionButton;
  const ParentScaffold({required this.routeLocation, required this.child, this.hideNavigations = false, this.floatingActionButton, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ParentScaffoldState();
}

class _ParentScaffoldState extends ConsumerState<ParentScaffold> {
  @override
  Widget build(BuildContext context) {
    ref.watch(navigationControllerProvider);
    return Scaffold(
      appBar: buildTopBar(context, ref, widget.routeLocation),
      bottomNavigationBar: widget.hideNavigations ? null : const AppBottomNavigationBar(),
      floatingActionButton: widget.floatingActionButton,
      body: SafeArea(child: Padding(padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), child: widget.child)),
    );
  }
}
