import 'package:blog_post_hp/model/home.dart';
import 'package:blog_post_hp/repository/get_home_repo_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetPostsRepositoryImpl extends GetPostsInterface {
  @override
  Future<List<Post>> getPosts() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final query = firestore.collection('posts');
    final snapshot = await query.get();

    if (snapshot.docs.isNotEmpty) {
      return snapshot.docs.map((snapshot) {
        final data = snapshot.data();
        return Post(
          id: data['id'],
          title: data['title'],
          description: data['description'],
          thumbnail: data['thumbnail'],
          readTime: data['read_time'],
        );
      }).toList();
    } else {
      // the case where no document matches the query
      debugPrint("No document found for the query");
      return [];
    }
  }
}
