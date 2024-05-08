import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HeaderImage extends StatelessWidget {
  const HeaderImage({super.key, required this.thumbnail, this.fit});
  final String thumbnail;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: thumbnail,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: CachedNetworkImage(
          imageUrl: thumbnail,
          height: 250.0,
          fit: fit ?? BoxFit.cover,
          progressIndicatorBuilder: (context, url, downloadProgress) => Center(
            child: CircularProgressIndicator(value: downloadProgress.progress),
          ),
          errorWidget: (context, url, error) => const Center(
            child: Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
