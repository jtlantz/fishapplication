
import 'package:fisher/components/constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:translator/translator.dart';

/**
 * The steps are as follows
 * 1. User inputs name of city in thai
 * 2. We translate the city name to english
 * 3. We get the lat/long of the city from
 */

Future translateEnglish(input) async {
  var translator = GoogleTranslator();
  var result = await translator.translate(input, from: 'th', to: 'en');
  return result.text;
}

Future translateThai(input) async {
  var translator = GoogleTranslator();
  var result = await translator.translate(input, from: 'en', to: 'th');
  return result.text;

}