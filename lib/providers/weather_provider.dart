import 'package:flutter/foundation.dart';
import 'package:weather/models/weather_models.dart';

class WeatherProvider extends ChangeNotifier{
  WeatherModel ? _weatherData;

 String ?cityName;
  set weatherData (WeatherModel? weather){
    _weatherData = weather ;
    notifyListeners();
  }
  WeatherModel? get weatherData => _weatherData;
}