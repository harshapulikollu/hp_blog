import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key, required this.body});
  final String body;

  @override
  Widget build(BuildContext context) {
    return Text(
      body,
      style: const TextStyle(
        fontSize: 16.0,
      ),
    );
  }
}
