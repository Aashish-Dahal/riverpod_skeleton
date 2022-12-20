import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_skeleton/app/core/utils/snack_bar.dart';
import 'package:riverpod_skeleton/app/widgets/atoms/button.dart';
import 'package:riverpod_skeleton/app/widgets/atoms/input_field.dart';
import '../../core/utils/app_colors.dart';
import '../../providers/auth/auth_provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey1 = GlobalKey<FormBuilderState>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Register Page'),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: FormBuilder(
              key: formKey1,
              child: Column(
                children: [
                  InputField(
                    name: 'name',
                    prefixIcon: const Icon(Icons.person),
                    label: const Text('Full name'),
                    hintText: 'Enter name',
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
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
                        registerNotifierProvider,
                        (prev, next) {
                          next.maybeWhen(
                            orElse: () => null,
                            authenticated: (user) {
                              showSuccess(
                                  message: "User Successfully Registered");
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
                        disabled: ref.watch(registerNotifierProvider).maybeWhen(
                            orElse: () => false, loading: () => true),
                        loading: ref.watch(registerNotifierProvider).maybeWhen(
                            orElse: () => false, loading: () => true),
                        label: 'Register',
                        onPressed: () {
                          if (formKey1.currentState!.validate()) {
                            formKey1.currentState!.save();
                            ref
                                .read(registerNotifierProvider.notifier)
                                .firebaseRegister(formKey1.currentState!.value);
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
                        text: "Already have an account? ",
                        style: Theme.of(context).textTheme.bodyText2),
                    TextSpan(
                        text: "Login",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: AppColors.purple),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => context.pop()),
                  ])),
                ],
              ),
            ),
          ),
        ));
  }
}
