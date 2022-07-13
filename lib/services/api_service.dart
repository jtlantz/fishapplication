import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fisher/components/constant.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/weather.dart';
import '../model/fish.dart';
// https://stackoverflow.com/questions/53299447/flutter-http-headers
Map<String, String> requestHeaders = {
  'api-key': ApiConstants.apiKeyData,
};

Stream<List<Fish>> getFishList(){
  var data = FirebaseFirestore.instance
      .collection('fishes')
      .orderBy('_id')
      .snapshots()
      .map((snapshot) =>
      snapshot.docs.map((doc) => Fish.fromJson(doc.data())).toList());
  return data;
}

Future<Fish> getTodayFish() async {
  var data = FirebaseFirestore.instance
      .collection('fishes')
      .where('_id',
      isEqualTo: 5) //TODO: this is currently fixed, can random/put in firebase
      .snapshots()
      .map((snapshot) =>
      snapshot.docs.map((doc) => Fish.fromJson(doc.data())).toList());
  var res = await data.first;
  return res.first;
}


Future getCurrentWeather() async {
  String city = "Bangkok";
  String apiKey = "asdasdasd";
  var url = Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric");

  final response = await http.get(url);

  if (response.statusCode == 200) {
    return Weather.fromJson(jsonDecode(response.body));
  } else{
    return Weather(temp: -999,feelsLike: -999, low: -999, high: -999, description: 'ไม่พบข้อมูลการตรวจสภาพอากาศ, กรุณาลองพิมเป็นภาษาอังกฦษ');
  }
}