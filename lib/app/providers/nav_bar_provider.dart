import 'package:flutter_riverpod/flutter_riverpod.dart';

final navBarNotifierProvider =
    StateNotifierProvider<NavBarNotifierProvider, int>(
        (ref) => NavBarNotifierProvider(0));

class NavBarNotifierProvider extends StateNotifier<int> {
  NavBarNotifierProvider(super.state);
  void setPosition(int value) {
    state = value;
  }
}
