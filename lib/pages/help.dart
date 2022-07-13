import 'package:fisher/components/constant.dart';
import 'package:flutter/material.dart';

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
      body: Column(
        children: [
          Text("เกี่ยวกับเรา", style: kLabelTextStyle),
          Divider(height: 10, color: Colors.transparent),
          Text("กหฟกฟหกรฟหกรหฟกฟกฟกหฟกฟหกฟหกหฟกฟหกฟหกฟหกหฟก", style: kTextStyle),
          Divider(height: 10, color: Colors.transparent),
          Text("การใช้งาน", style: kLabelTextStyle),
          Divider(height: 10, color: Colors.transparent),
          Text("อ้างอิงและฐานข้อมูล", style: kLabelTextStyle),
          Text("กรมประมง กระทรวงเกษตรและสหกรณ์", style: kLabelTextStyle),
          Text("0-2562-0600 ถึง 15")
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
