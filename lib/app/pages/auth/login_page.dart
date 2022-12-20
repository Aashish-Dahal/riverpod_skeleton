import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_skeleton/app/config/routes/route_name.dart';
import 'package:riverpod_skeleton/app/core/utils/app_colors.dart';
import 'package:riverpod_skeleton/app/widgets/atoms/button.dart';
import 'package:riverpod_skeleton/app/widgets/atoms/input_field.dart';
import '../../core/utils/snack_bar.dart';
import '../../providers/auth/auth_provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Login Page'),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: FormBuilder(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InputField(
                    name: 'email',
                    prefixIcon: const Icon(Icons.email_outlined),
                    label: const Text('Email'),
                    hintText: 'Enter email',
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.email()
                    ]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InputField(
                    name: 'password',
                    obscureText: true,
                    prefixIcon: const Icon(Icons.lock_outlined),
                    label: const Text('Password'),
                    hintText: 'Enter password',
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Consumer(
                    builder: (_, ref, child) {
                      ref.listen(
                        loginNotifierProvider,
                        (prev, next) {
                          next.maybeWhen(
                            orElse: () => null,
                            authenticated: (user) {
                              showSuccess(message: "Authenticated");
                            },
                            unauthenticated: (message) {
                              showError(
                                message: message,
                              );
                            },
                          );
                        },
                      );
                      return Button(
                        label: 'Login',
                        disabled: ref.watch(loginNotifierProvider).maybeWhen(
                            orElse: () => false, loading: () => true),
                        loading: ref.watch(loginNotifierProvider).maybeWhen(
                            orElse: () => false, loading: () => true),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            ref
                                .read(loginNotifierProvider.notifier)
                                .firebaseLogin(formKey.currentState!.value);
                          }
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Don't have an account? ",
                        style: Theme.of(context).textTheme.bodyText2),
                    TextSpan(
                        text: "Register",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: AppColors.purple),
                        recognizer: TapGestureRecognizer()
                          ..onTap =
                              () => context.pushNamed(RouteName.register)),
                  ])),
                ],
              ),
            ),
          ),
        ));
  }
}
