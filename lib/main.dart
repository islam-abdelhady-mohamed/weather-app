import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather_models.dart';
import 'package:weather/providers/weather_provider.dart';
import 'home/home_layout.dart';

void main() {
  runApp(ChangeNotifierProvider (
    create: (context) {
      return WeatherProvider();
    },
   child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Provider.of<WeatherProvider>(context).weatherData == null ? Colors.blue:Provider.of<WeatherProvider>(context).weatherData!.getThemeColor(),
      ),
      debugShowCheckedModeBanner: false,
      home: HomeLayout(),
    );
  }
}
