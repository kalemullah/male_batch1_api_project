import 'dart:convert';

import 'package:apitesting/get_post/post_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class PostProvider extends ChangeNotifier {
  List<PostModel> postList = [];
  Future<List<PostModel>> getPostData() async {
    //local apitokan and jwttokan

    var response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
        headers: {"apitokan": "api123", "jwttokan": "jwt123"});

    var maxdata = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (var data in maxdata) {
        postList.add(PostModel.fromJson(data));
      }
      // notifyListeners();
      return postList;
    } else {
      return postList;
    }
  }
}
