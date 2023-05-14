import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/state.dart';
import 'package:weather_app/dio_helper.dart';
import 'package:weather_app/model/forecast_model.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/test.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(InitialWeatherState());

  static WeatherCubit get(context) => BlocProvider.of(context);

  Map<String, dynamic> others = {};

  WeatherModel? weatherModel;

  getWeatherData({String? country, context}) async {
    emit(WeatherLoadingState());

    try {
      Response response = await DioHelper.getData(
        url: 'data/2.5/weather',
        query: {
          'q': country ?? 'cairo',
          'appid': 'e6324cd99bd6387f7b0c69bc4ac65a61'
        },
      );
      weatherModel = WeatherModel.fromJson(response.data);
      emit(WeatherSuccessState());
    } on DioError catch (e) {
      if (e.type == DioErrorType.unknown) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                content: Text('${e.message}'),
                backgroundColor: Colors.red[400]));
      } else if (e.type == DioErrorType.connectionTimeout) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  content: Text('${e.message}'),
                  backgroundColor: Colors.red[400],
                ));
      } else if (e.response!.statusCode == 404) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  content: const Text(
                    'The city name not found',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.red[400],
                ));
      }else if(e.type == DioErrorType.connectionError){
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: const Text(
                'connection error',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.red[400],
            ));
      }
      emit(WeatherErrorState());
    }
  }

  List<String> list = [
    'alexandria',
    'aswan',
    'al mansura',
  ];

  WeatherModel? alexandria;

  void getAlexandriaWeatherData(context) async{
    emit(GetAlexLoadingState());

    try{
     Response response = await DioHelper.getData(
        url: 'data/2.5/weather',
        query: {'q': 'alexandria', 'appid': 'e6324cd99bd6387f7b0c69bc4ac65a61'},
      );
     alexandria = WeatherModel.fromJson(response.data);
     emit(GetAlexSuccessState());
    }on DioError catch(e){
      if (e.type == DioErrorType.unknown) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                content: Text('${e.message}'),
                backgroundColor: Colors.red[400]));
      }
      emit(GetAlexErrorState());
    }
  }

  WeatherModel? aswan;

  void getAswanWeatherData(context) async{
    emit(GetAswanLoadingState());

    try{
      Response response = await DioHelper.getData(
        url: 'data/2.5/weather',
        query: {'q': 'aswan', 'appid': 'e6324cd99bd6387f7b0c69bc4ac65a61'},
      );
      aswan = WeatherModel.fromJson(response.data);
      emit(GetAswanSuccessState());
    }on DioError catch(e){
      emit(GetAswanErrorState());
    }
  }

  WeatherModel? mansurah;

  void getMansurahWeatherData(context) async{
    emit(GetMansurahLoadingState());

    try{
      Response response = await DioHelper.getData(
        url: 'data/2.5/weather',
        query: {'q': 'al mansurah', 'appid': 'e6324cd99bd6387f7b0c69bc4ac65a61'},
      );
      aswan = WeatherModel.fromJson(response.data);
      emit(GetMansurahSuccessState());
    }on DioError catch(e){
      emit(GetMansurahErrorState());
    }
  }

  ForecastModel? forecastModel;

  void getForecastData({String? country, context}) async {
    emit(GetForecastLoadingState());

    try {
      Response response = await DioHelper.getData(
        url: 'data/2.5/forecast',
        query: {
          'q': country ?? 'cairo',
          'appid': 'e6324cd99bd6387f7b0c69bc4ac65a61'
        },
      );
      forecastModel = ForecastModel.fromJson(response.data);
      emit(GetForecastSuccessState());
    } on DioError catch (e) {
      if (e.type == DioErrorType.unknown) {
        showDialog(
            context: context,
            builder: (context) => const AlertDialog(
                  content: Text('Check your internet connection'),
                ));
      }
      emit(GetForecastErrorState());
    }
  }
}
