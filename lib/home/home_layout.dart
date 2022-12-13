import 'package:flutter/material.dart';
import '../services/weather_service.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather_models.dart';
import 'package:weather/providers/weather_provider.dart';
import '../search/search.dart';
class HomeLayout extends StatefulWidget {

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {

  void updateUi () {
    setState(() {

    });
  }
  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    weatherData =Provider.of<WeatherProvider>(context , listen: true).weatherData;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Weather App'),
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return SearchPage(
                  updateUi: updateUi,
                );
              }));
              },
          ),
        ],
      ),
      body: weatherData ==null? Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
              Text(
                  'There is no weather 😔',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize:25,
                ),
              ),
              Text(
              'Start Search now 🔍',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ):Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              weatherData!.getThemeColor(),
              weatherData!.getThemeColor()[200]!,
              weatherData!.getThemeColor()[100]!,
              weatherData!.getThemeColor()[50]!,

            ],
            begin:Alignment.topCenter ,
            end: Alignment.bottomCenter,
          ),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 2,),
            Text(Provider.of<WeatherProvider>(context).cityName!,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16,),
            Text('Updated at:  ${weatherData!.date.hour.toString()}:${weatherData!.date.minute.toString()} ',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10,),
            Text('${weatherData!.date.year.toString()}/${weatherData!.date.month.toString()}/${weatherData!.date.day.toString()} ',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //assets/images/1779940.png
                Image.asset(weatherData!.getImage(),height: 70,width:70,),
                //Icon(Icons.),
                Text(weatherData!.temperature.toInt().toString(),
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  children: [
                    Text('MaxTempe : ${weatherData!.maxTemperature.toInt()}',

                    ),
                    Text('minTempe : ${weatherData!.minTemperature.toInt()}',
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Text(
            weatherData?.weatherStateName ?? 'No Data',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const  Spacer(flex: 5,),
          ],
        ),
      ),
    );
  }
}
