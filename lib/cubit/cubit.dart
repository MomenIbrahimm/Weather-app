import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/state.dart';
import 'package:weather_app/dio_helper.dart';
import 'package:weather_app/forecast_model.dart';
import 'package:weather_app/weather_model.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(InitialWeatherState());

  static WeatherCubit get(context) => BlocProvider.of(context);

  Map<String, dynamic> others = {};

  WeatherModel? weatherModel;

  void getWeatherData({String? country}) {
    emit(WeatherLoadingState());

    DioHelper.getData(
      url: 'data/2.5/weather',
      query: {
        'q': country ?? 'cairo',
        'appid': 'e6324cd99bd6387f7b0c69bc4ac65a61'
      },
    ).then((value) {
      weatherModel = WeatherModel.fromJson(value.data);
      emit(WeatherSuccessState());
    }).catchError((error) {
      emit(WeatherErrorState());
      print(error.toString());
    });
  }

  List<String> list = [
    'alexandria',
    'aswan',
    'al mansura',
  ];

  WeatherModel? alexandria;

  void getAlexandriaWeatherData() {
    emit(GetAlexLoadingState());

    DioHelper.getData(
      url: 'data/2.5/weather',
      query: {'q': 'alexandria', 'appid': 'e6324cd99bd6387f7b0c69bc4ac65a61'},
    ).then((value) {
      alexandria = WeatherModel.fromJson(value.data);
      emit(GetAlexSuccessState());
    }).catchError((error) {
      emit(GetAlexErrorState());
      print(error.toString());
    });
  }

  WeatherModel? aswan;

  void getAswanWeatherData({String? country}) {
    emit(GetAswanLoadingState());

    DioHelper.getData(
      url: 'data/2.5/weather',
      query: {'q': 'aswan', 'appid': 'e6324cd99bd6387f7b0c69bc4ac65a61'},
    ).then((value) {
      aswan = WeatherModel.fromJson(value.data);
      emit(GetAswanSuccessState());
    }).catchError((error) {
      emit(GetAswanErrorState());
      print(error.toString());
    });
  }

  WeatherModel? mansurah;

  void getMansurahWeatherData({String? country}) {
    emit(GetMansurahLoadingState());

    DioHelper.getData(
      url: 'data/2.5/weather',
      query: {'q': 'al mansurah', 'appid': 'e6324cd99bd6387f7b0c69bc4ac65a61'},
    ).then((value) {
      mansurah = WeatherModel.fromJson(value.data);
      emit(GetMansurahSuccessState());
    }).catchError((error) {
      emit(GetAswanErrorState());
      print(error.toString());
    });
  }

  ForecastModel? forecastModel;

  void getForecastData({String? country}) {
    emit(GetForecastLoadingState());

    DioHelper.getData(
      url: 'data/2.5/forecast',
      query: {
        'q': country ?? 'cairo',
        'appid': 'e6324cd99bd6387f7b0c69bc4ac65a61'
      },
    ).then((value) {
      forecastModel = ForecastModel.fromJson(value.data);
      print(forecastModel!.list!.length);
      print(forecastModel!.city!.id);
      emit(GetForecastSuccessState());
    }).catchError((error) {
      emit(GetForecastErrorState());
      print(error.toString());
    });
  }
}
