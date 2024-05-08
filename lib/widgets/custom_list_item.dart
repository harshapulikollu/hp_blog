import 'package:blog_post_hp/model/home.dart';
import 'package:blog_post_hp/pages/details_page.dart';
import 'package:blog_post_hp/widgets/header_image.dart';
import 'package:blog_post_hp/widgets/headline.dart';
import 'package:blog_post_hp/widgets/read_time.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:readmore/readmore.dart';

class CustomListItem extends StatelessWidget {
  const CustomListItem({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: ValueListenableBuilder(
          valueListenable: Hive.box('viewed_posts').listenable(),
          builder: (context, box, child) {
            final List<int> viewedPosts =
                box.get('viewed_posts', defaultValue: <int>[]);
            return GestureDetector(
              onTap: () => onCardClick(context, box, viewedPosts, post.id),
              child: Card(
                elevation: 0.0,
                child: Opacity(
                  opacity: viewedPosts.contains(post.id) ? 0.6 : 1.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      HeaderImage(
                        thumbnail: post.thumbnail,
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Headline(
                          headline: post.title,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ReadMoreText(
                          post.description,
                          trimMode: TrimMode.Line,
                          trimLines: 2,
                          colorClickableText: Colors.pink,
                          trimCollapsedText: 'Read more',
                          trimExpandedText: 'Read less',
                          moreStyle: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                          isExpandable: false,
                        ),
                      ),
                      ReadTime(readTimeInMints: post.readTime),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  void onCardClick(
      BuildContext context, Box<dynamic> box, List<int> blogPost, int postId) {
    if (!blogPost.contains(postId)) {
      blogPost.add(postId);
      box.put('viewed_posts', blogPost);
    }
    Navigator.pushNamed(
      context,
      '/details',
      arguments: DetailsPageArguments(
        id: post.id,
        title: post.title,
        description: post.description,
        thumbnail: post.thumbnail,
        readTimeInMints: post.readTime,
      ),
    );
  }
}
