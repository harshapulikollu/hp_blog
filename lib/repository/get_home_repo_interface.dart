import 'package:blog_post_hp/model/home.dart';

abstract class GetPostsInterface {
  Future<List<Post>> getPosts();
}
