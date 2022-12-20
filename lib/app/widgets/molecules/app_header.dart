import 'package:flutter/material.dart';
import '../atoms/logout_dialog.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  final bool removeLogoutButton;
  final Widget? title;
  final List<Widget>? actions;
  const AppHeader(
      {super.key, this.removeLogoutButton = false, this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: title ?? const Text('Riverpod Skeleton'),
      actions: actions ??
          [
            if (!removeLogoutButton)
              IconButton(
                  onPressed: () {
                    logoutDialog(context);
                  },
                  icon: const Icon(Icons.logout_outlined))
          ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
