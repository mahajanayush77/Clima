import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const APIKey = '34001e35b7f2fb138b01f29b8c4c683d';
const apiURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> cityWeather(String cityName) async {
    var url = '$apiURL?q=$cityName&appid=$APIKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url: url);
    var wdata = await networkHelper.getData();
    return wdata;
  }

  Future<dynamic> getlocalWeather() async {
    Location l = Location();
    await l.getCurrentLocation();

    NetworkHelper N = NetworkHelper(
        url:
            '$apiURL?lat=${l.latitude}&lon=${l.longitude}&appid=$APIKey&units=metric');
    var weatherdata = await N.getData();

    return weatherdata;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(var temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
