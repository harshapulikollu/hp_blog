import 'package:blog_post_hp/widgets/action_back_button.dart';
import 'package:blog_post_hp/widgets/action_share_button.dart';
import 'package:blog_post_hp/widgets/body.dart';
import 'package:blog_post_hp/widgets/header_image.dart';
import 'package:blog_post_hp/widgets/headline.dart';
import 'package:blog_post_hp/widgets/read_time.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as DetailsPageArguments;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              background:
                  HeaderImage(thumbnail: args.thumbnail, fit: BoxFit.cover),
            ),
            leading: const ActionBackButton(),
            actions: [
              ActionShareButton(postId: args.id),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Column(
                children: [
                  Headline(headline: args.title),
                  ReadTime(readTimeInMints: args.readTimeInMints),
                  Body(body: args.description),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

/// class for the arguments required to [DetailsPage] passed through [Navigator.pushNamed]
class DetailsPageArguments {
  final int id;
  final String title;
  final String description;
  final String thumbnail;
  final String readTimeInMints;
  DetailsPageArguments({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnail,
    required this.readTimeInMints,
  });
}
