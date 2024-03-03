import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ManageView extends ConsumerStatefulWidget {
  const ManageView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ManageViewState();
}

class _ManageViewState extends ConsumerState<ManageView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.redAccent,
        child: const Center(
          child: Text('Manage View'),
        ));
  }
}
