class WeatherModel {
  List<WeatherData> dataList = [];
  MainDataModel? mainData;
  String? name;
  WindDataModel? wind;

  WeatherModel.fromJson(Map<String,dynamic> json){
    name = json['name'];
    wind = json['wind']!=null? WindDataModel.fromJson(json['wind']):null;
    mainData = json['main'] != null? MainDataModel.fromJson(json['main']):null;
    json['weather'].forEach((v){
      dataList.add(WeatherData.fromJson(v));
    });
  }
}

class WeatherData {
  int? id;
  String? main;
  String? description;
  String? icon;

  WeatherData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }
}

class MainDataModel {
  dynamic temp;
  dynamic tempMin;
  dynamic tempMax;

  MainDataModel.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
  }
}

class WindDataModel{
  double? speed;

  WindDataModel.fromJson(Map<String,dynamic> json)
  {
    speed = json['speed'];
  }
}
