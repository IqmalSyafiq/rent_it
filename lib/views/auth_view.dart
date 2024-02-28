import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/shared/app_text_field.dart';
import 'package:rent_it/shared/auth/auth_bottom_section.dart';
import 'package:rent_it/shared/buttons/primary_button.dart';

class AuthView extends ConsumerStatefulWidget {
  const AuthView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthViewState();
}

final emailController = TextEditingController();
final passwordController = TextEditingController();

class _AuthViewState extends ConsumerState<AuthView> {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      )),
      body: SafeArea(
          child: CustomScrollView(slivers: [
        SliverFillRemaining(
            child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text('Login', style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w600)),
          ),
          Expanded(
            child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
                  AppTextField(controller: emailController, label: 'Email', hintText: 'Enter your email'),
                  AppTextField(controller: passwordController, label: 'Password', hintText: 'Enter your password', obscureText: true),
                  PrimaryButton(onPressed: () {}, text: 'Login'),
                  const SizedBox(height: 40),
                  const AuthBottomSection()
                ])),
          )
        ]))
      ])));
}
