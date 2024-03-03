import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/controllers/auth_controllers/auth_fields_validator_controllers.dart';
import 'package:rent_it/controllers/auth_controllers/auth_view_controllers.dart';
import 'package:rent_it/models/app_user/app_user.dart';
import 'package:rent_it/resources/strings/auth_strings.dart';
import 'package:rent_it/shared/buttons/primary_button.dart';
import 'package:rent_it/shared/buttons/secondary_button.dart';

Future<UserRole?> showAuthSelectorModal(BuildContext context, {bool google = false}) async {
  return await showFlexibleBottomSheet<UserRole?>(
    context: context,
    minHeight: 0,
    initHeight: 0.3,
    maxHeight: 0.3,
    bottomSheetBorderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
    builder: (context, controller, _) => AuthRoleSelector(google: google),
  );
}

class AuthRoleSelector extends ConsumerStatefulWidget {
  final bool google;
  const AuthRoleSelector({this.google = false, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthRoleSelectorState();
}

class _AuthRoleSelectorState extends ConsumerState<AuthRoleSelector> {
  Future<void> buttonsAction(bool owner) async {
    if (owner) {
      ref.read(selectedRoleNotifierProvider.notifier).setAsOwner();
    } else {
      ref.read(selectedRoleNotifierProvider.notifier).setAsTenant();
    }

    if (!widget.google) {
      ref.read(authToggleProvider.notifier).toggleValue();
      ref.read(formNotifierProvider.notifier).reset();
    }

    Navigator.pop(context, ref.read(selectedRoleNotifierProvider.notifier).role);
  }

  @override
  Widget build(BuildContext context) => Expanded(
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _buildLeading(),
            Expanded(child: Container()),
            _buildTenantButton(),
            const SizedBox(height: 16),
            _buildOwnerButton()
          ])));

  Widget _buildLeading() => SizedBox(
      width: 192,
      child: Text(
        AuthStrings.roleSelectorLeading,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.outlineVariant),
      ));

  Widget _buildTenantButton() => PrimaryButton(
      onPressed: () async => {
            buttonsAction(false)
          },
      text: AuthStrings.tenant);

  Widget _buildOwnerButton() => SecondaryButton(
      onPressed: () async => {
            buttonsAction(true)
          },
      text: AuthStrings.owner);
}
