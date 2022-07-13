// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';



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
  });

  int id;
  String thaiName;
  String localName;
  String enName;
  String scienceName;
  String familyName;
  String description;
  String location;


  factory Fish.fromJson(Map<String, dynamic> json) => Fish(
    id: json["รหัสสัตว์น้ำ"],
    thaiName: json["ชื่อไทย"],
    localName: json["ชื่อท้องถิ่น"]?? "-",
    enName: json["ชื่อสามัญ"]?? "-",
    scienceName: json["ชื่อวิทยาศาสตร์"]?? "-",
    familyName: json["ชื่อวงศ์สัตว์น้ำ"]?? "-",
    description: json["ลักษณะชีววิทยาทั่วไป"],
    location: json["ถิ่นที่อาศัย"],
  );


  Map<String, dynamic> toJson() => {
    "_id": id,
    "รหัสสัตว์น้ำ": thaiName,
    "ชื่อไทย": localName,
    "ชื่อท้องถิ่น": enName,
    "ชื่อสามัญ": scienceName,
    "ชื่อวิทยาศาสตร์": familyName,
    "ชื่อวงศ์สัตว์น้ำ": description,
    "ชื่อ/ปีที่เผยแพร่": location,
  };

  List<Fish> FishModelFromJson(String str) => List<Fish>.from(json.decode(str).map((x) => Fish.fromJson(x)));
  String FishModelJson(List<Fish> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}

