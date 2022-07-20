import 'package:fisher/components/constant.dart';
import 'package:fisher/pages/all_fish.dart';
import 'package:fisher/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/fish.dart';
import '../widgets/fish_dialog.dart';

class Home extends StatefulWidget {
  static const routeName = '/';
  const Home({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {

  late Fish todayFish;
  final now = DateTime.now();


  @override
  void initState(){
    todayFish = Fish(id: 0, thaiName: "", localName: "test", enName: "test",
        scienceName: "test", familyName: "test", description: "test",
        location: "test", imgPath: "yooo"); // initialize todayFish (cuz sometimes loading slow)
    load();
    super.initState();
  }

  Future<void> load() async {
    todayFish = await getTodayFish();
    setState((){
      todayFish = todayFish;
    });
  }


  showTodayDialog() async{
    showDialog(
        context: context,
        builder: (BuildContext context) =>
            fishInfoDialog(context, todayFish));
  }
  
  fishPage(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => const ListFishPage()));
  }

  Widget buildImageCard(String title, Icon icon, String label, String imgPath, function) { // local image
    return GestureDetector(
      child: Column(
        children: [
          Row(
            children: [
              Text(title, style: kLabelTextStyle),
              icon,
            ],
          ),
          const Divider(height: 10, color: Colors.transparent),
          Card(
            clipBehavior: Clip.antiAlias,
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
            color: kSecondaryColor,
              child: Stack(
                children: [
                  Ink.image(image: const AssetImage(kAllFishImagePath),colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.75), BlendMode.dstATop), height: 200,fit:BoxFit.fill), //TODO FIX PATH HERE
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(label, style: kCardTextStyle)
                  ),
                ],
              ),
          ),
        ],
      ),
      onTap: () {
        function();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("หน้าแรก", style: kLabelTextStyle)),
        backgroundColor: kMainColor,
      ),
      backgroundColor: kSecondaryColor,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(height: 10, color: Colors.transparent),
            buildImageCard("ปลาประจำวัน (${DateFormat('yMd').format(now)})", const Icon(Icons.new_releases, color: kIconColor) , todayFish.thaiName, kAllFishImagePath, showTodayDialog),
            const Divider(height: 20, color: Colors.transparent),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    buildImageCard("ปลาทั้งหมด", const Icon(Icons.clear_all_outlined, color: kIconColor),
                        "ฐานข้อมูล",kAllFishImagePath, fishPage),
                    const Divider(height: 20, color: Colors.transparent),
                  ],

                ),
              ),
            ),

          ],
        ),
      ),
    // for testing purpose
    );
  }
}
