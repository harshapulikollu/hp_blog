import 'package:blog_post_hp/cubit/home_cubit.dart';
import 'package:blog_post_hp/pages/details_page.dart';
import 'package:blog_post_hp/pages/home_page.dart';
import 'package:blog_post_hp/repository/get_home_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(GetPostsRepositoryImpl()),
      child: MaterialApp(
        title: 'HP Blog',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(useMaterial3: true),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          '/details': (context) => const DetailsPage(),
        },
      ),
    );
  }
}
