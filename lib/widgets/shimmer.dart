import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingCard extends StatelessWidget {
  final double width;
  final double height;

  const LoadingCard({super.key, this.width = 340.0, this.height = 300.0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: SizedBox(
          height: 300.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image placeholder
              Container(
                height: 200.0,
                color: Colors.red,
              ),
              const SizedBox(height: 16.0),
              // Text line 1 placeholder
              Container(
                height: 15.0,
                width: width * 0.9,
                color: Colors.grey[300],
              ),
              const SizedBox(height: 8.0),
              // Text line 2 placeholder
              Container(
                height: 35.0,
                width: width,
                color: Colors.grey[300],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
