import 'package:flutter/material.dart';

// colors
const kMainColor = Color(0xFF1c82ae);
const kSecondaryColor = Color(0xFF91d1ec);
const kTextColor = Color(0xFF39abdd);
const kIconColor = Color(0xFF12516d);

// textStyle
const kLabelTextStyle = TextStyle(fontSize: 20, fontFamily: 'NotoSansThai');
const kTextStyle = TextStyle(fontSize: 15, fontFamily: 'NotoSansThai');
const kSubTextStyle = TextStyle(fontSize: 10, fontFamily: 'NotoSansThai');
const kFishLabelStyle = TextStyle(fontSize: 30, fontFamily: 'NotoSansThai');
const kLabelInfoStyle = TextStyle(fontSize: 20, fontFamily: 'NotoSansThai', color: Colors.black);
const kTextInfoStyle = TextStyle(fontSize: 15, fontFamily: 'NotoSansThai', color: Colors.white);
const kCardTextStyle = TextStyle(fontSize: 40, fontFamily: 'NotoSansThai', color: Colors.white);

// Api Constants
class ApiConstants {
  static const String apiKeyData = 'DJL4MhJJBX4YKj3ELZTvfjVo0siSW5ds';
  static const String baseURL = "https://opend.data.go.th/get-ckan/datastore_search?resource_id=";
  static const String endPoint = "e0795ed5-6d00-4d5f-a1cf-782c77257a13&limit=2200";
  static const String apiKeyWeather = '';
}


// fixed Image Path
const kAllFishImagePath = 'lib/images/all_fish.jpg';
const kDOFImagePath = 'lib/images/dof.png';
const kFishIconPath = 'lib/icons/fish.png';

