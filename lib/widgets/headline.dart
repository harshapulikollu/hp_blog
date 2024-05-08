import 'package:flutter/material.dart';

class Headline extends StatelessWidget {
  const Headline({super.key, required this.headline});

  final String headline;

  @override
  Widget build(BuildContext context) {
    return Text(
      headline,
      style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
    );
  }
}
