import 'dart:io';

import 'package:hive/hive.dart';

part 'models.g.dart';

@HiveType(typeId: 0)
class Post {
  @HiveField(0)
  User user;
  @HiveField(1)
  final String dateCreated;
  @HiveField(2)
  List<User> likes;
  @HiveField(3)
  List<Comment> comments;
  @HiveField(4)
  final String location;
  @HiveField(5)
  List<String> images;
  @HiveField(6)
  List<String> assetImages;

  Post({
    required this.user,
    required this.dateCreated,
    required this.likes,
    required this.comments,
    required this.location,
    required this.images,
    required this.assetImages,
  });
}

@HiveType(typeId: 1)
class User {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String image;

  const User({
    required this.name,
    required this.image,
  });
}

@HiveType(typeId: 2)
class Comment {
  @HiveField(0)
  String text;
  @HiveField(1)
  final User user;

  Comment({
    required this.text,
    required this.user,
  });
}

@HiveType(typeId: 3)
class PostContainer {
  @HiveField(0)
  List<Post> posts;

  PostContainer({
    required this.posts,
  });
}
