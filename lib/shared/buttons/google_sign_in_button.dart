import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/controllers/auth_controllers/auth_view_controllers.dart';
import 'package:rent_it/resources/strings/auth_strings.dart';
import 'package:rent_it/services/top_level_services/auth_services/auth_services.dart';

class GoogleSignInButton extends ConsumerStatefulWidget {
  const GoogleSignInButton({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends ConsumerState<GoogleSignInButton> {
  bool loading = false;

  void toggleLoading() {
    setState(() {
      loading = !loading;
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(selectedRoleNotifierProvider);
    final role = ref.watch(selectedRoleNotifierProvider.notifier).role;

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () async => {
                toggleLoading(),
                AuthSevices(context: context, ref: ref).signInWithGoogle(role).then((value) => toggleLoading())
              },
          style: ButtonStyle(
            shadowColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.outlineVariant),
            backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.onInverseSurface),
            fixedSize: MaterialStateProperty.all(const Size(double.infinity, 48)),
            shape: MaterialStateProperty.all(const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4)))),
          ),
          child: loading
              ? CupertinoActivityIndicator(color: Theme.of(context).colorScheme.outlineVariant)
              : Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
                  Image.asset('assets/images/google.png', width: 18, height: 18),
                  const SizedBox(width: 12),
                  Text(AuthStrings.google, style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant)),
                ])),
    );
  }
}
