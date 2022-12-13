import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_skeleton/app/config/routes/route_name.dart';
import 'package:riverpod_skeleton/app/providers/nav_bar_provider.dart';

class BottomNavBar extends ConsumerStatefulWidget {
  const BottomNavBar({super.key});

  @override
  ConsumerState<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends ConsumerState<BottomNavBar> {
  @override
  Widget build(
    BuildContext context,
  ) {
    final int position = ref.watch(navBarNotifierProvider);
    return NavigationBar(
        selectedIndex: position,
        onDestinationSelected: _onDestinationSelected,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
          NavigationDestination(icon: Icon(Icons.person), label: 'settings')
        ]);
  }

  void _onDestinationSelected(int index) {
    ref.read(navBarNotifierProvider.notifier).setPosition(index);
    switch (index) {
      case 0:
        context.goNamed(RouteName.home);
        break;
      case 1:
        context.goNamed(RouteName.profile);
        break;
      case 2:
        context.goNamed(RouteName.setting);
        break;
      default:
    }
  }
}
