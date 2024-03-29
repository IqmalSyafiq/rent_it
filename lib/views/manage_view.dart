import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/controllers/home_controllers/home_controllers.dart';
import 'package:rent_it/controllers/manage_controllers/manage_controllers.dart';
import 'package:rent_it/shared/manage/build_small_house_widget.dart';

class ManageView extends ConsumerStatefulWidget {
  const ManageView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ManageViewState();
}

class _ManageViewState extends ConsumerState<ManageView> {
  @override
  Widget build(BuildContext context) {
    return ref.watch(userHouseStreamProvider).when(
        data: (houses) => ListView(children: [
              for (var house in houses) BuildSmallHouseWidget(houseId: house.id, addressLineOne: house.addressLineOne, addressLineTwo: house.addressLineTwo ?? '')
            ]),
        loading: Container.new,
        error: (_, __) => Text(_.toString()));
  }
}
