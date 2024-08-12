import 'package:flutter/material.dart';
import 'package:lyshoppingmain/screen/entered_screen/main_page/ingredient/ads_area/item_ads.dart';
import '../../../../../data/AdsData/AdsData.dart';

class ads_area extends StatelessWidget {
  final List<AdsData> adsList;
  final List<String> imgList;
  const ads_area({super.key, required this.adsList, required this.imgList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 0),
      child: Container(
        height: 170,
        child: ListView.builder(
          itemCount: adsList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(right: 15),
              child: item_ads(adsData: adsList[index], url: imgList[index],),
            );
          },
        ),
      ),
    );
  }
}
