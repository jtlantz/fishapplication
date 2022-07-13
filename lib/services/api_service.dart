import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fisher/components/constant.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/weather.dart';
import '../model/fish.dart';
import 'translator.dart';

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

Future getLatLong(String city) async {

  String googleMapsApiKey = "AIzaSyBsW-yDLoPwRD0A9rViUcQ3zoeKD4bQ2MU";
  var url = Uri.parse('https://maps.googleapis.com/maps/api/geocode/json?address=$city&key=$googleMapsApiKey');
  var response = await http.get(url);
  var jsonData = json.decode(response.body);
  var lat = jsonData['results'][0]['geometry']['location']['lat'];
  var lon = jsonData['results'][0]['geometry']['location']['lng'];
  return {'lat': lat, 'lon': lon};
}


Future<Weather> getCurrentWeather(cityInThai) async {
  var translated = await translateEnglish(cityInThai);
  var geolocation = await getLatLong(translated);
  var lat = geolocation['lat'];
  var lon = geolocation['lon'];

  String openWeatherApiKey = "a19222ec79bed7c6b9424d174a282b91";
  var url = Uri.parse("https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&appid=$openWeatherApiKey");

  final response = await http.get(url);

  var desc = await translateThai(jsonDecode(response.body)['current']['weather'][0]['description']);
  if (response.statusCode == 200) {
    return Weather.fromJson(jsonDecode(response.body), desc);
  } else {
    return Weather(lat:0,
        lon:0,
        temp: 0,
        feelsLike: 0,
        low: 0,
        high: 0,
        description: 'ไม่พบข้อมูลการตรวจสภาพอากาศ, กรุณาลองพิมเป็นภาษาอังกฦษ',
        icon: Uri.parse('https://cdn0.iconfinder.com/data/icons/shift-free/32/Error-512.png')
    );
  }
}

//หนองปรือ
// ชลบุรี
// พัทยา
// สมุทรปราการ

Future<void> main() async {
  var x = await getCurrentWeather('ศาลายา');
  print(x.toString());
  // print(getCurrentWeather('หนองปรือ'));
  // print(getCurrentWeather('ชลบุรี'));
  // print(getCurrentWeather('พัทยา'));
  // print(getCurrentWeather('สมุทรปราการ'));
}