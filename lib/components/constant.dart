import 'package:flutter/material.dart';

const kMainColor = Color(0xFF1c82ae);
const kSecondaryColor = Color(0xFF91d1ec);
const kTextColor = Color(0xFF39abdd);
const kIconColor = Color(0xFF12516d);

const kLabelTextStyle = TextStyle(fontSize: 20, fontFamily: 'NotoSansThai');
const kTextStyle = TextStyle(fontSize: 15, fontFamily: 'NotoSansThai');
const kSubTextStyle = TextStyle(fontSize: 10, fontFamily: 'NotoSansThai');
const kFishLabelStyle = TextStyle(fontSize: 30, fontFamily: 'NotoSansThai');

const kLabelInfoStyle = TextStyle(fontSize: 20, fontFamily: 'NotoSansThai', color: Colors.black);
const kTextInfoStyle = TextStyle(fontSize: 15, fontFamily: 'NotoSansThai', color: Colors.white);

const kCardTextStyle = TextStyle(fontSize: 40, fontFamily: 'NotoSansThai', color: Colors.white);

class ApiConstants {
  static const String apiKeyData = 'DJL4MhJJBX4YKj3ELZTvfjVo0siSW5ds';
  static const String apiKeyWeather = '';
}

const Map<String, String> descriptionMapping = {
  "English": "Thai",
  "clear sky" : "ท้องฟ้าแจ่มใส่",
  "few clouds" : "มีเมฆเล็กน้อย",
  "scattered cloud" : "เมฆกระจัดกระจาย",
  "broken clouds" : "เมฆแตก",
  "shower rain" : "ฝนโปรยปราย",
  "rain" : "ฝนตก",
  "thunderstorm" : "พายุฝนฟ้าคะนอง",
  "snow" : "หิมะตก",
  "mist" : "หมอกปกคลุม",
};

const kAllFishImagePath = 'lib/images/all_fish.jpg';