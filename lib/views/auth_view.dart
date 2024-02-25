import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/shared/auth/auth_bottom_section.dart';

class AuthView extends ConsumerStatefulWidget {
  const AuthView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthViewState();
}

class _AuthViewState extends ConsumerState<AuthView> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        )),
        body: SafeArea(
            child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text('Login', style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w600)),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Email', style: Theme.of(context).textTheme.bodyMedium),
                              const SizedBox(height: 6),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: 'Enter your email',
                                  hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5)),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(4), borderSide: BorderSide(color: Theme.of(context).colorScheme.outline)),
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.outline)),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.outline)),
                                  filled: true,
                                  fillColor: Theme.of(context).colorScheme.onInverseSurface,
                                ),
                                style: Theme.of(context).textTheme.bodyMedium,
                              )
                            ],
                          ),
                          const SizedBox(height: 24),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Password', style: Theme.of(context).textTheme.bodyMedium),
                              const SizedBox(height: 6),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: 'Enter your password',
                                  hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5)),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(4), borderSide: BorderSide(color: Theme.of(context).colorScheme.outline)),
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.outline)),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.outline)),
                                  filled: true,
                                  fillColor: Theme.of(context).colorScheme.onInverseSurface,
                                ),
                                obscureText: true,
                                style: Theme.of(context).textTheme.bodyMedium,
                              )
                            ],
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
                                fixedSize: MaterialStateProperty.all(const Size(double.infinity, 48)),
                                shape: MaterialStateProperty.all(const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4)))),
                              ),
                              child: Text('Login', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onInverseSurface)),
                            ),
                          ),
                          const SizedBox(height: 40),
                          const AuthBottomSection()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        )),
      );
}
