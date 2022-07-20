import 'package:fisher/components/constant.dart';
import 'package:flutter/material.dart';

import '../model/fish.dart';

class FishInformationCard extends StatelessWidget {
  final Fish fish;

  const FishInformationCard(
      {Key? key,
        required this.fish})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Text('${fish.id}')),
      title: Text(fish.thaiName,style: kLabelTextStyle),
      subtitle: Text("ชื่อท้องถิ่น: ${fish.localName}", style: kTextStyle),
      onTap: (){
        showDialog(
            context: context,
            builder: (BuildContext context) =>
        fishInfoDialog(context, fish));
      },
    );
  }

}

/// create Fish info dialog
/// we put outside class because
/// we can use it in other places as well
Widget fishInfoDialog(BuildContext context, Fish fish) {
  return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: Colors.white,
      child: _childDialog(context, fish)
  );
}

Widget customTextSpan(String category, String data){
  return RichText(
    text: TextSpan(
      children: <TextSpan>[
        TextSpan(text: category, style: kLabelInfoStyle),
        TextSpan(text: ' $data', style: kTextInfoStyle),
      ],
    ),
  );
}

/// custom content of the dialog
_childDialog(BuildContext context, Fish fish) {
  return Container(
    height: 500,
    decoration: BoxDecoration(
        color: kMainColor,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(12)),
    child: ListView(
      children: <Widget>[
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12))),
          child: Image.network(fish.imgPath, fit: BoxFit.fill), //TODO FIX PATH
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 12.0, left: 8.0, right: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customTextSpan('ชื่อไทย:', fish.thaiName),
              customTextSpan('ชื่อท้องถื่น:', fish.localName),
              customTextSpan('ชื่้อสามัญ:', fish.enName),
              customTextSpan('ชื่อวิทยาศาสตร์:', fish.scienceName),
              customTextSpan('ลักษณะ:', fish.description),
              customTextSpan('ถิ่นอาศัย:', fish.location)
            ],
          ),
        ),
      ],
    ),
  );
}


