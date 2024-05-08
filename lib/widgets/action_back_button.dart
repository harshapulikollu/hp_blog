import 'package:blog_post_hp/widgets/action_button_circular_bg.dart';
import 'package:flutter/material.dart';

class ActionBackButton extends StatelessWidget {
  const ActionBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ActionButtonCircularBg(
      child: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
    );
  }
}
