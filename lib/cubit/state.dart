import 'package:weather_app/model/error_model.dart';

abstract class WeatherState{}

class InitialWeatherState extends WeatherState{}

class WeatherLoadingState extends WeatherState{}

class WeatherSuccessState extends WeatherState{
  final ErrorModel? error;

  WeatherSuccessState({this.error});
}

class WeatherErrorState extends WeatherState{
  // final  error;
  //
  // WeatherErrorState(this.error);
}

class GetAlexLoadingState extends WeatherState{}

class GetAlexSuccessState extends WeatherState{}

class GetAlexErrorState extends WeatherState{}

class GetAswanLoadingState extends WeatherState{}

class GetAswanSuccessState extends WeatherState{}

class GetAswanErrorState extends WeatherState{}

class GetMansurahLoadingState extends WeatherState{}

class GetMansurahSuccessState extends WeatherState{}

class GetMansurahErrorState extends WeatherState{}

class GetForecastLoadingState extends WeatherState{}

class GetForecastSuccessState extends WeatherState{}

class GetForecastErrorState extends WeatherState{
  // final error;
  //
  // GetForecastErrorState(this.error);
}
