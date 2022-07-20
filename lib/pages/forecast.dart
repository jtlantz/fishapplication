import 'package:fisher/components/constant.dart';
import 'package:flutter/material.dart';

import '../model/rain.dart';
import '../model/weather.dart';
import '../services/api_service.dart';

class Forecast extends StatefulWidget {
  static const routeName = '/';
  const Forecast({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _ForecastState();
  }
}

class _ForecastState extends State<Forecast> {
  final TextEditingController _searchController = TextEditingController();
  late Future<Weather> _currentWeather;
  late List<Rain>? _rainRecords = [];

  /// init
  @override
  void initState() {
    super.initState();
    _searchController.addListener(
        _onSearchChanged); // _onSearchChanged = function when text is change
    _currentWeather = getCurrentWeather('');

  }

  @override
  void dispose() {
    super.dispose();
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
  }

  _onSearchChanged() {
    setState(() {});
  }

  _searchWeather() async{
    // call weather api
    // call data.go thingy
    // print(_searchController.text);
    _currentWeather = getCurrentWeather(_searchController.text); // weather api
    _rainRecords = await getRainRecords();
    var query = _searchController.text.toLowerCase();
    _rainRecords = _rainRecords!.where((x) =>
    x.province.toLowerCase() == query ||
        x.district.toLowerCase()== query ||
        x.tambon.toLowerCase() == query ||
        x.village.toLowerCase() == query
    ).toList();
    _onSearchChanged();
    FocusManager.instance.primaryFocus?.unfocus(); // close keyboard
  }

  Widget searchPage() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          const Text("ตรวจสอบสภาพอากาศและระดับน้ำ", style: kLabelTextStyle),
          const Divider(height: 10, color: Colors.transparent),
          TextFormField(
            controller: _searchController,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.settings_input_antenna_rounded),
              hintText: "จังหวัด/ตำบล/อำเภอ",
              labelStyle: kLabelInfoStyle,
              border: OutlineInputBorder(),
            ),
          ),
          OutlinedButton(
              onPressed: _searchWeather,
              style: OutlinedButton.styleFrom(
                  textStyle: kLabelInfoStyle,
                  side: const BorderSide(width: 1, color: kMainColor)),
              child: const Text("ค้นหา"))
        ],
      ),
    );
  }

  Widget infoPage(Weather weather) {
    return Column(
      children: [
        const Text("พยากรณ์อากาศ", style: kLabelTextStyle,),
        SizedBox(
            height: 100,
            width: 100,
            child: Image.network(weather.imageDestination)),
        Text("สภาพอากาศ: ${weather.description}", style: kTextStyle),
        Text("อุณหภูมิ: ${weather.temp.toStringAsFixed(1)}°C", style: kTextStyle),
        Text("สูงสุด: ${weather.low.toStringAsFixed(1)}°C   ตำสุด: ${weather.high.toStringAsFixed(1)}°C", style: kTextStyle),
        Text("สัมพัสอากาศ: ${weather.feelsLike.toStringAsFixed(1)}°C", style: kTextStyle,),
        Text("พิกัด: ${weather.lat}, ${weather.lon}", style: kTextStyle),
        const Divider(height: 10, color: Colors.transparent),
        const Text("เตือนภัยระดับน้ำ", style: kLabelTextStyle,),
        const Divider(height: 10, color: Colors.transparent),
        _rainRecords == null || _rainRecords!.isEmpty
            ? const Text("ไม่พบข้อมูลในเครือข่ายเฝ้าระวังแจ้งเตือนธรณีพิบัติภัย", style: kLabelTextStyle)
            : SizedBox(
          height: 200,
              child: ListView.builder(
              itemCount: _rainRecords!.length,
              itemBuilder: (context, index){
                return rainLog(_rainRecords![index]);
              }
        ),
            ),
      ],
    );
  }

  Widget rainLog(Rain rain){
    return Column(
      children: [
        Text("ข้อมูลล่าสุด: ${rain.date}, หมู่บ้าน:${rain.village}", style: kTextStyle,),
        Text("ต.${rain.tambon} อ.${rain.district}", style: kTextStyle,),
        Text("จ.${rain.province}", style: kTextStyle,),
        Text("ฝนสะสม(มิลลิเมตร): 1วัน: ${rain.rain_24}  3วัน: ${rain.rain_3}", style: kTextStyle,),
        Text("ลักษณะอากาศ: ${rain.description}", style: kTextStyle,),
        const Divider(height: 10, color: Colors.black),
      ],
    );
  }

  /// build widget
  /// which call customize card class i created in widgets folder!
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "สภาพอากาศ",
          style: kLabelTextStyle,
        )),
        backgroundColor: kMainColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("ภาพยกรอากาศและแจ้งเตือนธรณีพิบัติภัย", style: kLabelTextStyle),
            const Divider(height: 10, color: Colors.transparent),
            Row(
              children: [
                SizedBox(
                  width: 250,
                  height: 90,
                  child: TextField(
                    controller: _searchController,
                    style: kTextStyle,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: kSecondaryColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                      hintStyle: kTextStyle,
                      hintText: "จังหวัด/ตำบล/อำเภอ",
                      prefixIcon: const Icon(Icons.settings_input_antenna_rounded),
                      prefixIconColor: kMainColor,
                    ),
                  ),
                ),
                const SizedBox(width: 30),
                OutlinedButton(
                    onPressed: _searchWeather,
                    style: OutlinedButton.styleFrom(
                        textStyle: kLabelInfoStyle,
                        side: const BorderSide(width: 1, color: kMainColor)),
                    child: const Text("ค้นหา"))
              ],
            ),
            FutureBuilder<Weather>(
                future: _currentWeather,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return infoPage(snapshot.data!);
                  } else {
                    return const Text("กรุณากรอกข้อมูลเพื่อค้นหา", style: kTextStyle);
                  }
                }),
          ],
        ),
        // floatingActionButton: Padding(
        //   padding: const EdgeInsets.only(bottom: 50.0),
        //   child: FloatingActionButton(
        //     child: const Icon(Icons.add),
        //     onPressed: _deleteDB,
        //   ),
        // ),
      ),
    );
  }
}
