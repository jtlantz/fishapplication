import 'dart:async';
import '../model/fish.dart';
import 'db.dart';

// class connected to database
// all function related to queries will be put here
class QueryController {

  DatabaseHelper connection = DatabaseHelper();

  // A method that retrieves all the dogs from the dogs table.
  Future<List<Fish>> allFish() async {
    // Get a reference to the database.
    final db = await connection.database;
    var fishes = await db.query('FISH', orderBy: 'id ASC');
    List<Fish> fishList = fishes.isNotEmpty
        ? fishes.map((c) => Fish.fromJson(c)).toList() : [];
    return fishList;
  }

  void addAll(List<Fish> list) async {
    final db = await connection.database;
    for (Fish fish in list){
      db.insert("FISH", fish.toJson());
      print(fish.toString());
    }
  }

  void add(Fish fish) async{
    final db = await connection.database;
    db.insert("FISH", fish.toJson());
  }

}