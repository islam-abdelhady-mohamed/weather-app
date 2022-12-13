import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather_models.dart';

class WeatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '414d1281ed6748249c1144903220412';
  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weatherData;
    try {
      Uri url = Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');
      http.Response response = await http.get(url);
      //must make jsonDecode for data that come from apis ==> (response.body)
      Map<String, dynamic> data = jsonDecode(response.body);

       weatherData = WeatherModel.fromJson(data);
    }catch (error){
      print(error);
    }
    return weatherData;
  }
}
