// import 'dart:async';
//
// import 'package:app_links/app_links.dart';
// import 'package:blog_post_hp/cubit/home_cubit.dart';
// import 'package:blog_post_hp/widgets/custom_list_item.dart';
// import 'package:blog_post_hp/widgets/home_listview.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//
//   late AppLinks _appLinks;
//   StreamSubscription<Uri>? _linkSubscription;
//
//   @override
//   void initState() {
//     super.initState();
//
//     initDeepLinks();
//   }
//
//   @override
//   void dispose() {
//     _linkSubscription?.cancel();
//
//     super.dispose();
//   }
//
//   Future<void> initDeepLinks() async {
//     _appLinks = AppLinks();
//
//     // Handle links
//     _linkSubscription = _appLinks.uriLinkStream.listen((uri) {
//       print('onAppLink: $uri');
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(child: Scaffold(
//       appBar: AppBar(
//         title: const Text('Blog posts'),
//       ),
//       body: BlocBuilder<HomeCubit, HomeState>(
//         builder: (context, state){
//           if (state is HomeLoading) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//
//           if (state is HomeLoadingFailed) {
//             return const Center(
//               child: Text('Oops, something went wrong'),
//             );
//           }
//
//           if (state is HomeLoadedSuccessfully) {
//             final posts = state.responseApi;
//             return HomeListview(posts: posts);
//           }
//
//           return const SizedBox();
//         },
//       ),
//     ));
//   }
// }
//
//

import 'package:blog_post_hp/cubit/home_cubit.dart';
import 'package:blog_post_hp/widgets/home_listview.dart';
import 'package:blog_post_hp/widgets/loading_list_shimmer.dart';
import 'package:blog_post_hp/widgets/more_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('HP Blog'),
        centerTitle: true,
        actions: const [
          MoreOptions(),
        ],
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const LoadingListShimmer();
          }

          if (state is HomeLoadingFailed) {
            return const Center(
              child: Text('Oops, something went wrong'),
            );
          }

          if (state is HomeLoadedSuccessfully) {
            final posts = state.responseApi;
            return HomeListview(posts: posts);
          }

          return const SizedBox();
        },
      ),
    ));
  }
}
