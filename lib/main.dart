import 'package:blog_post_hp/model/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await _initHive();
  runApp(const MyApp());
}

/// method to [init] [Hive] and registering [HiveAdapters]
Future<void> _initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PostAdapter());

  await Hive.openBox('viewed_posts');
}
