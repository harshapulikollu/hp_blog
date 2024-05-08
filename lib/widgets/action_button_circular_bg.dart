import 'package:flutter/material.dart';

class ActionButtonCircularBg extends StatelessWidget {
  const ActionButtonCircularBg({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: CircleAvatar(
        backgroundColor: Colors.black38,
        child: child,
      ),
    );
  }
}
