import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/shared/manage/build_small_house_widget.dart';

class ManageView extends ConsumerStatefulWidget {
  const ManageView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ManageViewState();
}

class _ManageViewState extends ConsumerState<ManageView> {
  @override
  Widget build(BuildContext context) {
    int numberOfHouses = 15;

    List<Widget> houses = List<Widget>.generate(
      numberOfHouses,
      (index) => const BuildSmallHouseWidget(),
    );

    return ListView(
      children: [
        ...houses,
      ],
    );
  }
}
