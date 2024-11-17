import 'package:apitesting/waether/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child: Consumer<WeatherProvider>(
        builder: (context, model, child) => SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'this is weather data',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                Text(
                  'city ${model.Weather.location?.name}',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                Text(
                  'city ${model.Weather.request!.language}',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
