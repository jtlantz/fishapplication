// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';


List<Fish> FishModelFromJson(String str) => List<Fish>.from(json.decode(str).map((x) => Fish.fromJson(x)));
String FishModelJson(List<Fish> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Fish {
  Fish({
    required this.id,
    required this.thaiName,
    required this.localName,
    required this.enName,
    required this.scienceName,
    required this.familyName,
    required this.description,
    required this.location,
    required this.imgPath,
  });

  final int id;
  final String thaiName;
  final String localName;
  final String enName;
  final String scienceName;
  final String familyName;
  final String description;
  final String location;
  final String imgPath;

  // create fish from json
  // get data from data.go
  factory Fish.fromJson(Map<String, dynamic> json) => Fish(
    id: json["_id"],
    thaiName: json["ชื่อไทย"]?? "-",
    localName: json["ชื่อท้องถิ่น"]?? "-",
    enName: json["ชื่อสามัญ"]?? "-",
    scienceName: json["ชื่อวิทยาศาสตร์"]?? "-",
    familyName: json["ชื่อวงศ์สัตว์น้ำ"]?? "-",
    description: json["ลักษณะชีววิทยาทั่วไป"],
    location: json["ถิ่นที่อาศัย"],
    imgPath: json["Path เก็บภาพ (เล็ก)"],
  );

  // create a map
  // use to add to db
  Map<String, dynamic> toJson() => {
    "id": id,
    "thaiName": thaiName,
    "localName": localName,
    "enName": enName,
    "scienceName": scienceName,
    "familyName": familyName,
    "description": description,
    "location": location,
    "imgPath": imgPath,
  };


}

