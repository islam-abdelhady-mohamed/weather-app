import 'package:flutter/material.dart';

class WeatherModel {
  DateTime date;
  double temperature;
  double maxTemperature;
  double minTemperature;
  String weatherStateName;
  //String weatherIcons;

  WeatherModel({
      required this.date,
      required this.temperature,
      required this.maxTemperature,
      required this.minTemperature,
      required this.weatherStateName,

      //required this.weatherIcons,
      });

  //this constructor in charge of build data from internet 'API' ==>Named constructor and factory constructor
  factory WeatherModel.fromJson(dynamic data){
    var jsonFileData = data['forecast']['forecastday'][0]['day'];
    //print('this is date from API $jsonFileData');
    return WeatherModel(
      date: DateTime.parse(data['location']['localtime']),
      temperature: jsonFileData['avgtemp_c'],
      maxTemperature: jsonFileData['maxtemp_c'],
      minTemperature: jsonFileData['mintemp_c'],
      weatherStateName: jsonFileData['condition']['text'],
     // weatherIcons: jsonFileData['condition']['icon'],
    );
  }


  String getImage(){
    if(weatherStateName == 'Clear' || weatherStateName == 'Sunny')
      return 'assets/images/suny.jpg';
    else if (weatherStateName == 'Light Cloudy')
      return 'assets/images/sunny.png';
    else if (weatherStateName == 'Snow' || weatherStateName == 'Sleet' ||weatherStateName == 'Hail' )
      return 'assets/images/snow.png';
    else if (weatherStateName == 'Heavy Cloudy' || weatherStateName == 'Partly cloudy')
      return 'assets/images/cloud.png';
    else if (weatherStateName == 'Light Rain')
      return 'assets/images/cloudy.png';
    else if (weatherStateName == 'Cloudy')
      return 'assets/images/cloudy1.png';
    else if (weatherStateName == 'Heavy Rain' ||weatherStateName == 'Showers'||weatherStateName == 'Moderate rain' )
      return 'assets/images/rain.png';
    else if (weatherStateName == 'Thunderstorm' ||weatherStateName == 'Thunder' )
      return 'assets/images/storm.png';
    else if (weatherStateName == 'Patchy rain possible')
      return 'assets/images/possible rain.png';
    else {
      return 'assets/images/no weather1.png';
    }
    }

  MaterialColor getThemeColor(){
    if(weatherStateName == 'Clear' || weatherStateName == 'Sunny')
      return Colors.orange;
    else if (weatherStateName == 'Light Cloudy')
      return Colors.amber;
    else if (weatherStateName == 'Snow' || weatherStateName == 'Sleet' ||weatherStateName == 'Hail' )
      return Colors.blue;
    else if (weatherStateName == 'Heavy Cloudy' || weatherStateName == 'Partly cloudy' || weatherStateName == 'Overcast')
      return Colors.grey;
    else if (weatherStateName == 'Light Rain')
      return Colors.lightBlue;
    else if (weatherStateName == 'Cloudy')
      return Colors.blue;
    else if (weatherStateName == 'Heavy Rain' ||weatherStateName == 'Showers'||weatherStateName == 'Moderate rain' )
      return Colors.blue;
    else if (weatherStateName == 'Thunderstorm' ||weatherStateName == 'Thunder' )
      return Colors.grey;
    else if (weatherStateName == 'Patchy rain possible')
      return Colors.orange;
    else {
      return Colors.orange;
    }
  }
}
