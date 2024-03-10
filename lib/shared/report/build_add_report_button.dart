import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/controllers/user_controllers/user_controllers.dart';
import 'package:rent_it/models/app_user/app_user.dart';
import 'package:rent_it/shared/report/add_report_modal.dart';

class BuildAddReportButton extends ConsumerStatefulWidget {
  const BuildAddReportButton({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BuildAddReportButtonState();
}

class _BuildAddReportButtonState extends ConsumerState<BuildAddReportButton> {
  @override
  Widget build(BuildContext context) => ref.watch(userRoleStreamProvider).when(
        data: (userRole) => Visibility(
          visible: userRole == UserRole.tenant,
          child: FloatingActionButton(
            onPressed: () async => {
              showAddReportModal(context)
            },
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: Icon(
              Icons.add,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
        ),
        loading: Container.new,
        error: (_, __) => Container(),
      );
}
