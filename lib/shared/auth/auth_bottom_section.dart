import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/controllers/auth_controllers/auth_view_controllers.dart';

class AuthBottomSection extends ConsumerStatefulWidget {
  const AuthBottomSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthBottomSectionState();
}

class _AuthBottomSectionState extends ConsumerState<AuthBottomSection> {
  final spacing = const SizedBox(height: 18);
  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
          buildContinueText(),
          spacing,
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  shadowColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.outlineVariant),
                  backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.onInverseSurface),
                  fixedSize: MaterialStateProperty.all(const Size(double.infinity, 48)),
                  shape: MaterialStateProperty.all(const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4)))),
                ),
                child: Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
                  Image.asset('assets/images/google.png', width: 18, height: 18),
                  const SizedBox(width: 12),
                  Text('Google', style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant)),
                ])),
          ),
          const SizedBox(height: 18),
          buildSwitcher()
        ]),
      );

  Widget buildContinueText() => Text('or continue with', style: TextStyle(fontSize: 14, color: Theme.of(context).colorScheme.outlineVariant));

  Widget buildSwitcher() {
    ref.watch(authToggleProvider);
    final signUp = ref.watch(authToggleProvider.notifier).isSignUp;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(signUp ? 'Already have an account ' : "Don't have an account? ", style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.surfaceTint)),
        InkWell(onTap: () => ref.read(authToggleProvider.notifier).toggleValue(), child: Text(signUp ? 'Log in' : 'Create now', style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600))),
      ],
    );
  }
}
