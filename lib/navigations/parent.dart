import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/resources/strings/app_strings.dart';

class Parent extends ConsumerStatefulWidget {
  final Widget child;
  const Parent({required this.child, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ParentState();
}

class _ParentState extends ConsumerState<Parent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.appName),
        ),
        bottomNavigationBar: const BottomAppBar(color: Colors.amber),
        body: SafeArea(child: widget.child));
  }
}
