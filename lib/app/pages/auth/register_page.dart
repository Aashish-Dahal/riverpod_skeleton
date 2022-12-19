import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_skeleton/app/providers/auth/auth_provider.dart';
import 'package:riverpod_skeleton/app/widgets/atoms/button.dart';
import 'package:riverpod_skeleton/app/widgets/atoms/input_field.dart';

import '../../core/utils/app_colors.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey1 = GlobalKey<FormBuilderState>();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Register Page'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: FormBuilder(
            key: formKey1,
            child: Column(
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
                  builder: (context, ref, child) {
                    return Button(
                      disabled: ref
                          .watch(authNotifierProvider)
                          .maybeWhen(orElse: () => false, loading: () => true),
                      loading: ref
                          .watch(authNotifierProvider)
                          .maybeWhen(orElse: () => false, loading: () => true),
                      label: 'Register',
                      onPressed: () {
                        if (formKey1.currentState!.validate()) {
                          formKey1.currentState!.save();
                          ref
                              .read(authNotifierProvider.notifier)
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
        ));
  }
}
