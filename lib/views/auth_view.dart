import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/controllers/auth_controllers/auth_view_controllers.dart';
import 'package:rent_it/resources/getters/auth_form_getters.dart';
import 'package:rent_it/resources/strings/auth_strings.dart';
import 'package:rent_it/services/top_level_services/auth_services/auth_services.dart';
import 'package:rent_it/shared/app_text_field.dart';
import 'package:rent_it/shared/auth/auth_bottom_section.dart';
import 'package:rent_it/shared/auth/auth_leading.dart';
import 'package:rent_it/shared/buttons/primary_button.dart';

class AuthView extends ConsumerStatefulWidget {
  const AuthView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthViewState();
}

//signin controllers
final signInEmailController = TextEditingController();
final signInPasswordController = TextEditingController();

// signup controllers
final usernameController = TextEditingController();
final emailController = TextEditingController();
final passwordController = TextEditingController();
final confirmPasswordController = TextEditingController();

class _AuthViewState extends ConsumerState<AuthView> {
  @override
  void initState() {
    setState(() {
      signInEmailController.clear();
      signInPasswordController.clear();
      usernameController.clear();
      emailController.clear();
      passwordController.clear();
      confirmPasswordController.clear();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(authToggleProvider);
    final signUp = ref.watch(authToggleProvider.notifier).isSignUp;

    return Scaffold(
        appBar: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        )),
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
                hasScrollBody: false,
                child: SafeArea(
                    child: Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: Column(children: [
                          _buildLeading(signUp),
                          Expanded(
                              child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(horizontal: 40),
                                  child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
                                    if (signUp) ..._signUpWidgets() else ..._signInWidgets(),
                                    const SizedBox(height: 40),
                                    const AuthBottomSection()
                                  ])))
                        ]))))
          ],
        ));
  }

  Widget _buildLeading(bool signUp) {
    ref.watch(selectedRoleNotifierProvider);
    final owner = ref.watch(selectedRoleNotifierProvider.notifier).isOwner;

    String leadingText = AuthStrings.login;

    if (signUp) {
      leadingText = owner ? AuthStrings.createOwner : AuthStrings.createTenant;
    }

    return AuthLeading(text: leadingText);
  }

  List<Widget> _signInWidgets() => [
        AppTextField(controller: signInEmailController, type: FieldTypes.email),
        AppTextField(controller: signInPasswordController, type: FieldTypes.password),
        PrimaryButton(
            needLoading: true,
            onPressed: () async => {
                  AuthSevices(context: context, ref: ref).signIn(email: signInEmailController.text, password: signInPasswordController.text)
                },
            text: AuthStrings.login),
      ];

  List<Widget> _signUpWidgets() => [
        AppTextField(controller: usernameController, type: FieldTypes.username),
        AppTextField(controller: emailController, type: FieldTypes.email),
        AppTextField(controller: passwordController, type: FieldTypes.password),
        AppTextField(controller: confirmPasswordController, type: FieldTypes.confirmPassword, passwordController: passwordController),
        PrimaryButton(
            onPressed: () async => {
                  AuthSevices(context: context, ref: ref).createUser(email: emailController.text, password: passwordController.text, userName: usernameController.text)
                },
            text: AuthStrings.register),
      ];
}
