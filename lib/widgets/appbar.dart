import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final List<Widget>? actions;
  const CommonAppBar({Key? key, required this.title, this.scaffoldKey, this.actions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: const TextStyle(color: Colors.white)),
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
