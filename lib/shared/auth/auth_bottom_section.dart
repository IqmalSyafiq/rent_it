import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/controllers/auth_controllers/auth_fields_validator_controllers.dart';
import 'package:rent_it/controllers/auth_controllers/auth_view_controllers.dart';
import 'package:rent_it/resources/strings/auth_strings.dart';
import 'package:rent_it/shared/auth/auth_role_selector.dart';
import 'package:rent_it/shared/buttons/google_sign_in_button.dart';

class AuthBottomSection extends ConsumerStatefulWidget {
  const AuthBottomSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthBottomSectionState();
}

class _AuthBottomSectionState extends ConsumerState<AuthBottomSection> {
  final spacing = const SizedBox(height: 18);

  Future<void> bottomSwitcherAction(bool signUp) async {
    if (!signUp) {
      showAuthSelectorModal(context);
    } else {
      ref.read(authToggleProvider.notifier).toggleValue();
      ref.read(selectedRoleNotifierProvider.notifier).resetState();
      ref.read(formNotifierProvider.notifier).reset();
    }
  }

  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
          _buildContinueText(),
          spacing,
          const GoogleSignInButton(),
          const SizedBox(height: 18),
          _buildSwitcher()
        ]),
      );

  Widget _buildContinueText() => Text(AuthStrings.orContinueWith, style: TextStyle(fontSize: 14, color: Theme.of(context).colorScheme.outlineVariant));

  Widget _buildSwitcher() {
    ref.watch(authToggleProvider);
    final signUp = ref.watch(authToggleProvider.notifier).isSignUp;

    return Row(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(signUp ? AuthStrings.signInSwitcher : AuthStrings.signUpSwitcher, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.surfaceTint)),
      InkWell(
          onTap: () async => {
                await bottomSwitcherAction(signUp)
              },
          child: Text(
            signUp ? AuthStrings.login : AuthStrings.createNow,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
          ))
    ]);
  }
}
