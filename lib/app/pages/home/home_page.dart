import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_skeleton/app/services/auth/index.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('Home Page'),
        const SizedBox(
          height: 10,
        ),
        Consumer(
          builder: (context, ref, child) {
            return ElevatedButton(
                onPressed: () {
                  ref.watch(authServiceProvider).logout();
                },
                child: const Text('Logout'));
          },
        )
      ],
    );
  }
}
