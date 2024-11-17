import 'dart:convert';

import 'package:apitesting/waether/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherProvider extends ChangeNotifier {
  WeatherProvider() {
    getData();
  }
  weather Weather = weather();

  getData() async {


    ///current location of user
    ///peshawar
    var response = await http.get(
      Uri.parse(
          'https://api.weatherstack.com/current?access_key=4f013b0a684465430defde60a2e07c18&query=peshawar'),
    );
    print('this is testing ${response.body}');
    var maxdata = jsonDecode(response.body.toString());
    // print('maxdata $maxdata');
    if (response.statusCode == 200) {
      Weather = weather.fromJson(maxdata);

      notifyListeners();
    }
  }
}
