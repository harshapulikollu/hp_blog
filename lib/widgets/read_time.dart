import 'package:flutter/material.dart';

class ReadTime extends StatelessWidget {
  const ReadTime({super.key, required this.readTimeInMints});
  final String readTimeInMints;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'Read Time: $readTimeInMints',
        style: const TextStyle(color: Colors.green),
      ),
    );
  }
}
