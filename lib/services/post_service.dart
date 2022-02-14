import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';

import 'package:blog/models/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class PostService with ChangeNotifier{
  
  Future<List<Post>> fetchPosts() async{
    final response = await http.get(Uri.parse('http://192.168.0.31:8000/api/posts/'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Token 4d2e49b1f658abadc95bd4f292a1a2e8616de344'
    });
    if(response.statusCode == 200){
      List jsonResponse = json.decode(response.body)['results'];
      return jsonResponse.map((posts) => Post.fromJson(posts)).toList();
    }else if(response.statusCode >= 400){
      notifyListeners();
      throw const HttpException("Cannot load posts");
    }else{
      notifyListeners();
      throw Exception("Error fetching data");
    }
  }
}