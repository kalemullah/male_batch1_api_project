import 'dart:convert';

import 'package:apitesting/gemini/gemini_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GeminiProvider extends ChangeNotifier {
  List<String> message = [];
  GeminiModel geminiModel = GeminiModel();
  void geminiresponse(String prompt) async {
    message.add(prompt);
    print('this is gemini response 11');
    String url =
        "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=AIzaSyB-mhJOrXRKF1Sf26JTDRyko3EKsgZwT2c";

    dynamic headers = {"Content-Type": "application/json"};

    dynamic body = {
      "contents": [
        {
          "parts": [
            {"text": prompt}
          ]
        }
      ]
    };

    await http
        .post(Uri.parse(url), headers: headers, body: jsonEncode(body))
        .then((response) {
      // print('this is reponse of gemini ${response.body}');

      dynamic maxdata = jsonDecode(response.body);
      geminiModel = GeminiModel.fromJson(maxdata);
      notifyListeners();

      print(
          'this is our data ${geminiModel.candidates![0].content!.parts![0].text}');

      message.add(geminiModel.candidates![0].content!.parts![0].text!);
    });
  }
}

class model {
  String? text;
  bool? isuser;
  model({this.text, this.isuser});
}
