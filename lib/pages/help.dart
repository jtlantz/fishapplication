import 'package:fisher/components/constant.dart';
import 'package:fisher/database/db_controller.dart';
import 'package:flutter/material.dart';

import '../model/fish.dart';
import '../model/rain.dart';
import '../services/api_service.dart';



class Help extends StatefulWidget {
  const Help({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _HelpState();
  }
}

class _HelpState extends State<Help> {

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
        title: const Center(child: Text("ช่วยเหลือ", style: kLabelTextStyle,)),
        backgroundColor: kMainColor,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children:const [
              Text("เกี่ยวกับเรา", style: kLabelTextStyle),
              Text("แอพพลิเคชั่นนี้เป็นแอพสำหรับเช็คฐานข้อมูลปลาจากรมประมง", style: kTextStyle,),
              Text("และสามารถเช็คสภาพอากาศและระดับน้ำและธรณีพิบัติภัย", style: kTextStyle,),
              Text("โดยอิ้งข้อมูลมาจากเครือข่ายเฝ้าระวังแจ้งเตือนธรณีพิบัติภัย", style: kTextStyle,),
              Divider(height: 10, color: Colors.transparent),
              Image(image: AssetImage(kDOFImagePath),height: 150,width: 150),
              Divider(height: 10, color: Colors.transparent),
              Text("วิธีการใช้งาน", style: kLabelTextStyle),
              Divider(height: 10, color: Colors.transparent),
              Text("1. ท่านสามารถป้อนข้อมูลที่เกี่ยวกับปลาที่ท่านอยากทราบ", style: kTextStyle,),
              Text("แล้วแอพพลิเคชั่นจะสามารถค้นหาข้อมูลที่มีอยู่ในฐานข้อมูลให้", style: kTextStyle,),
              Text("2. ท่านสามารถป้อนชื่อสถานที่เพื่อเช็คสภาพอากาศ", style: kTextStyle,),
              Text("และข้อมูลเกี่ยวกับธรณีพิบัติภัยในสถานที่ใกล้เคียงได้", style: kTextStyle,),
              Divider(height: 10, color: Colors.transparent),
              Text("อ้างอิงฐานข้อมูลและ API", style: kLabelTextStyle),
              Text("1. ปริมาณน้ำฝนจากเครือข่ายเฝ้าระวังแจ้งเตือนธรณีพิบัติภัย", style: kTextStyle,),
              Text("2. ข้อมูลสัตว์น้ำของไทย กรมประมง", style: kTextStyle,),
              Text("3. OpenWeather", style: kTextStyle,),
              Text("กรมประมง กระทรวงเกษตรและสหกรณ์", style: kLabelTextStyle),
              Text("ติดต่อ 0-2562-0600 ถึง 15", style: kTextStyle,),
              Text("เครือข่ายเฝ้าระวังแจ้งเตือนธรณีพิบัติภัย", style: kLabelTextStyle),
            ],
          ),
        ),
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

  Future<void> _deleteDB() async {
    // Stream<List<Fish>> allFish = getFishList();
    // await for(var fishList in allFish){ // this worked
    //   for (Fish fish in fishList){
    //     print(fish.toJson());
    //   }
    // }
    // var x = getRainRecords();

    }
}
