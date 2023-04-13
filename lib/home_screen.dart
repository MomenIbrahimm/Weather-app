import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/cubit/cubit.dart';
import 'package:weather_app/cubit/state.dart';
import 'components.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  var searchController = TextEditingController();
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  var format = DateFormat.yMMMMEEEEd();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: BuildCondition(
            condition: WeatherCubit.get(context).weatherModel != null &&
                WeatherCubit.get(context).alexandria != null &&
                WeatherCubit.get(context).mansurah != null &&
                WeatherCubit.get(context).aswan != null &&
                WeatherCubit.get(context).forecastModel != null,
            builder: (context) => SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 320.0,
                    child: Stack(alignment: Alignment.bottomCenter, children: [
                      Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 250.0,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(35.0),
                                    bottomLeft: Radius.circular(35.0)),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://i.pinimg.com/564x/ec/3e/e5/ec3ee532236019ae567e748acee69f69.jpg'),
                                    fit: BoxFit.cover)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 50.0),
                              child: TextFormField(
                                controller: searchController,
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  labelText: 'Search',
                                  suffixIcon: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.search)),
                                  labelStyle: const TextStyle(color: white),
                                  suffixIconColor: white,
                                  filled: true,
                                  fillColor: Colors.white10,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: BorderSide.none),
                                ),
                                onFieldSubmitted: (value) {
                                  WeatherCubit.get(context).getWeatherData(
                                      country: searchController.text);
                                  WeatherCubit.get(context).getForecastData(country: searchController.text);
                                },
                                keyboardType: TextInputType.text,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Container(
                            height: 180.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.blue,
                                      blurRadius: 15,
                                      offset: Offset(0, 3))
                                ],
                                borderRadius: BorderRadius.circular(20.0),
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        'https://i.pinimg.com/564x/ec/3e/e5/ec3ee532236019ae567e748acee69f69.jpg'),
                                    fit: BoxFit.cover)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                      child: defaultText(
                                          text:
                                              '${WeatherCubit.get(context).weatherModel!.name}',
                                          size: 20.5,
                                          weight: FontWeight.bold)),
                                  const SizedBox(
                                    height: 2.5,
                                  ),
                                  Center(
                                      child: defaultText(
                                          text: format.format(DateTime.now()),
                                          color: Colors.white70,size: 10.0)),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: Row(
                                      children: [
                                        defaultText(
                                            text:
                                                '${WeatherCubit.get(context).weatherModel!.dataList[0].main}',
                                            size: 16.0),
                                        const Spacer(),
                                        CircleAvatar(
                                          radius: 20,
                                          backgroundColor: Colors.white70,
                                          child: Image(
                                            image: NetworkImage(
                                                'http://openweathermap.org/img/w/${WeatherCubit.get(context).weatherModel!.dataList[0].icon}.png'),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: Row(
                                      children: [
                                        defaultText(
                                            text:
                                                '${(WeatherCubit.get(context).weatherModel!.mainData!.temp - 273.15).round()} °C',
                                            size: 30.0),
                                        const Spacer(),
                                        defaultText(
                                            text:
                                                '${WeatherCubit.get(context).weatherModel!.wind!.speed} m/s',
                                            color: Colors.white70,size: 12.0),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  defaultText(
                                    text:
                                        'min ${(WeatherCubit.get(context).weatherModel!.mainData!.tempMin - 273.15).round()} °C / max ${(WeatherCubit.get(context).weatherModel!.mainData!.tempMax - 273.15).round()} °C',size: 12.0
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ]),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                    child: Text('OTHER CITY'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SizedBox(
                      height: 160.0,
                      child: Row(
                        children: [
                          buildOtherCityItem(
                            name:
                                '${WeatherCubit.get(context).alexandria!.name}',
                            temp:
                                '${(WeatherCubit.get(context).alexandria!.mainData!.temp - 273.15).round()} °C',
                            description:
                                '${WeatherCubit.get(context).alexandria!.dataList[0].description}',
                            image:
                                'http://openweathermap.org/img/w/${WeatherCubit.get(context).weatherModel!.dataList[0].icon}.png',
                          ),
                          buildOtherCityItem(
                            name: '${WeatherCubit.get(context).aswan!.name}',
                            temp:
                                '${(WeatherCubit.get(context).aswan!.mainData!.temp - 273.15).round()} °C',
                            description:
                                '${WeatherCubit.get(context).aswan!.dataList[0].description}',
                            image:
                                'http://openweathermap.org/img/w/${WeatherCubit.get(context).weatherModel!.dataList[0].icon}.png',
                          ),
                          buildOtherCityItem(
                            name: '${WeatherCubit.get(context).mansurah!.name}',
                            temp:
                                '${(WeatherCubit.get(context).mansurah!.mainData!.temp - 273.15).round()} °C',
                            description:
                                '${WeatherCubit.get(context).mansurah!.dataList[0].description}',
                            image:
                                'http://openweathermap.org/img/w/${WeatherCubit.get(context).weatherModel!.dataList[0].icon}.png',
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
                    child: Text('FORECAST NEXT 5 DAYS'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SizedBox(
                      height: 200,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return buildForecastCityItem(
                              temp:
                                  '${(WeatherCubit.get(context).weatherModel!.mainData!.temp - 273.15).round()} °C',
                              description:
                                  '${WeatherCubit.get(context).forecastModel!.list![index].weather![0].description}',
                              image: 'http://openweathermap.org/img/w/${WeatherCubit.get(context).forecastModel!.list![index].weather![0].icon}.png',
                              date:DateFormat("E/dd/MM").format(DateTime.parse('${WeatherCubit.get(context).forecastModel!.list![index].dtTxt}')),
                            );
                          },
                          separatorBuilder: (context, index) =>
                              const VerticalDivider(),
                          itemCount: 5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            fallback: (context) =>
                const Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}

// temp - 273.toString .round
