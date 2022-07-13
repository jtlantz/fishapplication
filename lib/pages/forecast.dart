import 'package:fisher/components/constant.dart';
import 'package:flutter/material.dart';

class Forecast extends StatefulWidget {
  static const routeName = '/';
  const Forecast({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _ForecastState();
  }
}

class _ForecastState extends State<Forecast> {

  /// init
  @override
  void initState() {
    super.initState();
  }

  /// build widget
  /// which call customize card class i created in widgets folder!
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("สภาพอากาศ", style: kLabelTextStyle,)),
        backgroundColor: kMainColor,
      ),
      body: Column(
        children: [
          Divider(height: 10, color: Colors.transparent),
          Text("ผลลัพธ์", style: kLabelTextStyle),
          Divider(height: 10, color: Colors.transparent),
          Text("ระดับน้ำ", style: kLabelTextStyle),
          Text("(โดยเครือข่ายเฝ้าระวังแจ้งเตือนธรณีพิบัติภัย)", style: kTextStyle,),
        ],
      ),
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.only(bottom: 50.0),
      //   child: FloatingActionButton(
      //     child: const Icon(Icons.add),
      //     onPressed: _deleteDB,
      //   ),
      // ),
    );
  }
}
