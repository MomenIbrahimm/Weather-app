class ForecastModel {

  List<ListData>? list =[];
  City? city;

  ForecastModel.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      json['list'].forEach((v) {
        list!.add(ListData.fromJson(v));
      });
    }
    city = json['city'] != null ? City.fromJson(json['city']) : null;
  }

}

class ListData {
  dynamic dt;
  Main? main;
  List<Weather>? weather;
  Clouds? clouds;
  Wind? wind;
  String? dtTxt;

  ListData.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    main = json['main'] != null ?  Main.fromJson(json['main']) : null;
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
    clouds =
    json['clouds'] != null ?  Clouds.fromJson(json['clouds']) : null;
    wind = json['wind'] != null ?  Wind.fromJson(json['wind']) : null;
    dtTxt = json['dt_txt'];
  }

}

class Main {
  dynamic temp;
  dynamic tempMin;
  dynamic tempMax;

  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
}
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }
}

class Clouds {
  dynamic all;

  Clouds.fromJson(Map<String, dynamic> json) {
    all = json['all'];
  }
}

class Wind {
  dynamic speed;
  dynamic deg;
  dynamic gust;

  Wind.fromJson(Map<String, dynamic> json) {
    speed = json['speed'];
    deg = json['deg'];
    gust = json['gust'];
  }
}

class City {
  int? id;
  String? name;
  String? country;

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    country = json['country'];
  }

}

