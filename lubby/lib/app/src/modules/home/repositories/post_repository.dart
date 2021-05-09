import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PostRepository {
  Dio dio = new Dio();

  _getPosts() {
    return dio.get("url");
  }
}
