import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreOptions extends StatelessWidget {
  const MoreOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: (_) => <PopupMenuItem<String>>[
              const PopupMenuItem<String>(
                value: 'github',
                child: Text('Code on Github'),
              ),
              const PopupMenuItem<String>(
                value: 'linkedIn',
                child: Text('Harsha linkedIn'),
              ),
              const PopupMenuItem<String>(
                  value: 'email', child: Text('Contact Harsha')),
            ],
        onSelected: _onItemClick);
  }

  void _onItemClick(String value) {
    switch (value) {
      case 'github':
        _launchUrl('https://github.com/harshapulikollu/hp_blog');
        return;
      case 'linkedIn':
        _launchUrl('https://www.linkedin.com/in/harshapulikollu/');
        return;
      case 'email':
        _launchUrl('mailto:harshapulikollu@gmail.com');
        return;
    }
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }
}
