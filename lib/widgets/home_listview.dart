import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:blog_post_hp/model/home.dart';
import 'package:blog_post_hp/widgets/custom_list_item.dart';
import 'package:flutter/material.dart';

class HomeListview extends StatefulWidget {
  const HomeListview({super.key, required this.posts});
  final List<Post> posts;

  @override
  State<HomeListview> createState() => _HomeListviewState();
}

class _HomeListviewState extends State<HomeListview> {
  final ScrollController _scrollController = ScrollController();

  late AppLinks _appLinks;
  StreamSubscription<Uri>? _linkSubscription;

  @override
  void initState() {
    super.initState();
    initDeepLinks();
  }

  @override
  void dispose() {
    _linkSubscription?.cancel();
    super.dispose();
  }

  Future<void> initDeepLinks() async {
    _appLinks = AppLinks();

    // Handle links
    _linkSubscription = _appLinks.uriLinkStream.listen((uri) {
      scrollToIndex(uri.pathSegments[1]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemBuilder: (BuildContext context, int index) {
        return CustomListItem(
          post: widget.posts[index],
        );
      },
      itemCount: widget.posts.length,
    );
  }

  void scrollToIndex(String pathSegment) {
    int index = widget.posts.indexWhere((item) {
      return item.id.toString() == pathSegment;
    });

    /// navigating back to root(home) page, if user is not present in root(home) page
    Navigator.of(context).popUntil((route) => route.isFirst);
    _scrollController.animateTo(
      475.0 * index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }
}
