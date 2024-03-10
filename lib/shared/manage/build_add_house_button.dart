import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/controllers/user_controllers/user_controllers.dart';
import 'package:rent_it/models/app_user/app_user.dart';
import 'package:rent_it/shared/manage/add_house_modal.dart';

class BuildAddHouseButton extends ConsumerStatefulWidget {
  const BuildAddHouseButton({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BuildAddHouseButtonState();
}

class _BuildAddHouseButtonState extends ConsumerState<BuildAddHouseButton> {
  @override
  Widget build(BuildContext context) => ref.watch(userRoleStreamProvider).when(
        data: (userRole) => Visibility(
          visible: userRole == UserRole.owner,
          child: FloatingActionButton(
            onPressed: () async => {
              showAddHouseModal(context)
            },
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: Icon(
              Icons.add_home_outlined,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
        ),
        loading: Container.new,
        error: (_, __) => Container(),
      );
}
