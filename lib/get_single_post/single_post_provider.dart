import 'dart:convert';
import 'package:apitesting/get_single_post/single_post_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SinglePostProvider extends ChangeNotifier {
  SinglePostProvider() {
    getSinglePostData(1);
  }
  SinglePostModel singlePostModel = SinglePostModel();
  getSinglePostData(int id) async {
    var response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/$id'),
    );
    print('this is testing ${response.body}');
    var maxdata = jsonDecode(response.body.toString());
    // print('maxdata $maxdata');
    if (response.statusCode == 200) {
      singlePostModel = SinglePostModel.fromJson(maxdata);
      notifyListeners();
    }
  }
}
