import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = '06798a35d4d010610a198d80174e88c1';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  // late double latitude;
  // late double longitude;
  /*life cycle of Stateful widget
  1. initState - init only once
  2.deactivate - for destroy
  3. buildContext - called whenever the app is build */
  void initState() {
    // will be called once whenever your app is initialised ,
    super.initState();
    // getLocationData();
  }

  // void getCurrentPosition(){
  //   try {
  //     var getLocation = Location();
  //     getLocation.getCurrentLocation();
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  /*async

    When you mark a function with async, it means that this function will run asynchronously.
    It allows you to use the await keyword inside the function.
    The function will return a Future.

await

    The await keyword can only be used inside an async function.
    It pauses the execution of the function until the Future completes and returns a result.
    It makes your code wait for the asynchronous operation to complete before continuing to the next line of code.*/

  void getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(weatherData: weatherData);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    getLocationData();
    return Scaffold(
      body: Center(
        child: SpinKitPouringHourGlassRefined(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
