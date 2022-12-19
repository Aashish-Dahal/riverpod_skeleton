import 'package:flutter/material.dart';
import 'package:riverpod_skeleton/app/widgets/molecules/bottom_nav_bar.dart';

class HomeNavigator extends StatelessWidget {
  final Widget child;
  const HomeNavigator({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Riverpod Skeleton'),
        ),
        body: child,
        bottomNavigationBar: const BottomNavBar());
  }
}
