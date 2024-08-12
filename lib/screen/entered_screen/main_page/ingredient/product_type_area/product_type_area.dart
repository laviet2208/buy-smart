import 'package:flutter/material.dart';
import 'package:lyshoppingmain/screen/entered_screen/main_screen/main_screen.dart';
import 'package:lyshoppingmain/screen/entered_screen/product_viewall/product_type_viewall.dart';
import '../../../../../data/product/ProductType.dart';
import 'item_product_type.dart';

class product_type_area extends StatelessWidget {
  final List<ProductType> typeList;
  const product_type_area({super.key, required this.typeList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 0),
      child: Container(
        height: 130,
        child: ListView.builder(
          itemCount: typeList.length,
          padding: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(right: 15,),
              child: GestureDetector(
                child: item_product_type(productType: typeList[index]),
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => product_type_viewall(productType: typeList[index], beforeWidget: main_screen())));
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
