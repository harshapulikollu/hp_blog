import 'package:blog_post_hp/widgets/shimmer.dart';
import 'package:flutter/material.dart';

class LoadingListShimmer extends StatelessWidget {
  const LoadingListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return const LoadingCard();
      },
      itemCount: 5,
    );
  }
}
