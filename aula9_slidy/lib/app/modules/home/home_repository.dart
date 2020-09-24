import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';

class HomeRepository extends Disposable {
  final Dio client;

  HomeRepository({@required this.client});
  Future fetchPost() async {
    final response = await client.get('/posts/1');
    return response.data;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
