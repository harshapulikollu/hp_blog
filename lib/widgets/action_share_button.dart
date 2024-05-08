import 'package:blog_post_hp/widgets/action_button_circular_bg.dart';
import 'package:flutter/material.dart';
import 'package:social_share/social_share.dart';

class ActionShareButton extends StatelessWidget {
  const ActionShareButton({super.key, required this.postId});
  final int postId;

  @override
  Widget build(BuildContext context) {
    return ActionButtonCircularBg(
      child: IconButton(
        onPressed: () => _onShareClick(postId),
        icon: const Icon(
          Icons.share,
          color: Colors.white,
        ),
      ),
    );
  }

  void _onShareClick(int blogId) {
    SocialShare.shareOptions(
        "Check out the blog hpblogposts://hpblogposts.com/blog/$blogId");
  }
}
