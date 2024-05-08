// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'package:hive/hive.dart';
import 'dart:convert';

part 'home.g.dart';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

@HiveType(typeId: 1)
class Post extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final String thumbnail;
  @HiveField(4)
  final String readTime;

  Post({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnail,
    required this.readTime,
  });

  Post copyWith({
    int? id,
    String? title,
    String? description,
    String? thumbnail,
    String? readTime,
  }) =>
      Post(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        thumbnail: thumbnail ?? this.thumbnail,
        readTime: readTime ?? this.readTime,
      );

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        thumbnail: json["thumbnail"],
        readTime: json["read_time"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "thumbnail": thumbnail,
        "read_time": readTime,
      };
}
