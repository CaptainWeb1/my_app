
import 'package:flutter/material.dart';

class Post {
  final String userName;
  final Icon picture;
  final bool isOnline;
  final int likes;
  final String postText;
  final int views;

  Post({this.userName,
      this.picture,
      this.isOnline,
      this.likes,
      this.postText,
      this.views});
}