import 'package:fisher/components/constant.dart';
import 'package:flutter/material.dart';

import '../model/fish.dart';
import '../services/api_service.dart';
import '../widgets/fish_dialog.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _SearchState();
  }
}

class _SearchState extends State<Search> {

  final TextEditingController _searchController = TextEditingController();
  late Stream<List<Fish>> _allResults;

  /// init
  @override
  void initState(){
    super.initState();
    _searchController.addListener(_onSearchChanged); // _onSearchChanged = function when text is change
    _allResults = getFishList();
  }

  // @override
  // void dispose() {
  //   _searchController.removeListener(_onSearchChanged);
  //   _searchController.dispose();
  //   super.dispose();
  // }

  _onSearchChanged() {
    setState((){
    });
  }

  Widget fishListTile(Fish fish){
    return FishInformationCard(fish: fish);
  }

  Widget _showHelpDialog(){
    return Text("yoyo");
  }  // TODO

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("ค้นหา", style: kLabelTextStyle)),
        backgroundColor: kMainColor,
        actions: [
          IconButton(onPressed: _showHelpDialog, icon: const Icon(Icons.help))
        ],
      ),
      body: Column(
        children: [
          const Divider(height: 10, color: Colors.transparent),
          TextField(
            controller: _searchController,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search)
            ),
          ),
          const Text("(ค้นหาโดยใส่ลักษณะ/ชื่อ/ข้อมูลเกี่ยวกับปลา)", style: kTextStyle),
          const Divider(height: 10, color: Colors.transparent),
          Expanded(
            child: StreamBuilder(
              stream: getFishList(),
              builder: (context, AsyncSnapshot<List<Fish>> snapshot) {
                if (snapshot.hasData){
                  final fishes = snapshot.data;
                  final filtered = fishes!.where((x) => x.thaiName.toLowerCase().contains(_searchController.text.toLowerCase()));
                  return ListView(
                    children: filtered.map(fishListTile).toList(),
                  );
                }else{
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          )

        ],
      ),
    );
  }
}
