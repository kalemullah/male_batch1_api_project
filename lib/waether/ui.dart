import 'package:apitesting/waether/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child: Consumer<WeatherProvider>(
        builder: (context, model, child) => Scaffold(
          body: Column(
            children: [
              Text('Weather'),
            ],
          ),
        ),
      ),
    );
  }
}
