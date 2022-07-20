// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Rain> rainModelFromJson(dynamic json) => List<Rain>.from(json.map((x) =>
    Rain.fromJson(x)
));
String rainModelJson(List<Rain> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Rain {
  Rain({
    required this.date,
    required this.village,
    required this.tambon,
    required this.district,
    required this.province,
    required this.rain_24,
    required this.rain_3,
    required this.description,
  });

  final String date;
  final String village;
  final String tambon;
  final String district;
  final String province;
  final String rain_24;
  final String rain_3;
  final String description;

  // create fish from json
  // get data from data.go
  factory Rain.fromJson(Map<dynamic, dynamic> json) => Rain(
    date: json["DATE"].toString(),
    village: json["VILLAGE"].toString(),
    tambon: json["TAMBON"].toString(),
    district: json["DISTRICT"].toString(),
    province: json["PROVINCE"].toString(),
    rain_24: json["RIAN_24"].toString(),
    rain_3: json["RAIN_3_DAY"].toString(),
    description: json["WEATHER"].toString(),

  );

  // create a map
  // use to add to db
  Map<String, dynamic> toJson() => {
    "date": date,
    "village": village,
    "tambon": tambon,
    "district": district,
    "province": province,
    "rain": rain_24,
    "rain_3": rain_3,
    "description": description,
  };


}

