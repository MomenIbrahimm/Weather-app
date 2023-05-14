import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/cubit.dart';
import 'package:weather_app/cubit/state.dart';
import 'cubit/bloc_observe.dart';
import 'dio_helper.dart';
import 'home_screen.dart';

void main() {
  WidgetsFlutterBinding();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  Bloc.observer = MyBlocObserver();

  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => WeatherCubit()
        ..getWeatherData(context: context)
        ..getAlexandriaWeatherData(context)
        ..getAswanWeatherData(context)
        ..getMansurahWeatherData(context)
        ..getForecastData(context: context),
      child: BlocConsumer<WeatherCubit, WeatherState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
