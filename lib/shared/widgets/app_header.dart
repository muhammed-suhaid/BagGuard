import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key, this.leading, this.title, this.trailing});

  final Widget? leading;
  final Widget? title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Row(
        children: [
          leading ?? SizedBox(width: 48),

          Expanded(child: Center(child: title)),

          trailing ?? SizedBox(width: 48),
        ],
      ),
    );
  }
}
