import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather_models.dart';
import 'package:weather/providers/weather_provider.dart';
import '../services/weather_service.dart';
//Global variable
// WeatherModel? weatherData;
class SearchPage extends StatelessWidget {
  String? cityName;
  SearchPage({this.updateUi});
  VoidCallback? updateUi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            onChanged: (data){
              cityName= data;
            },
            onSubmitted: (data)async{
              cityName= data;
              WeatherService service =WeatherService();
              WeatherModel? weather= await  service.getWeather(cityName: cityName!);
              Provider.of<WeatherProvider>(context ,listen: false).weatherData = weather;
              Provider.of<WeatherProvider>(context ,listen: false).cityName = cityName;
              Navigator.pop(context);
              //print(weather);
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 30,horizontal: 16),
              label: Text('Search'),
              hintText: 'Enter a City',
              border: OutlineInputBorder(),
              suffixIcon: GestureDetector(
                onTap: ()async{
                  WeatherService service =WeatherService();
                  WeatherModel? weather= await  service.getWeather(cityName: cityName!);
                  Provider.of<WeatherProvider>(context ,listen: false).weatherData = weather;
                  Provider.of<WeatherProvider>(context ,listen: false).cityName = cityName;
                  Navigator.pop(context);
                },
                  child: Icon(Icons.search)
              ),
            ),
          ),
        ),
      ),
    );
  }
}
