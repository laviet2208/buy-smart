import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lyshoppingmain/data/finaldata.dart';

class item_product_type extends StatelessWidget {
  final int index;
  const item_product_type({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 120,
        width: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(height: 20,),

            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(finaldata.type_img_test_data[index]),
                  ),
                ),
              ),
            ),

            SizedBox(height: 8,),

            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Container(
                height: 15,
                child: AutoSizeText(
                  finaldata.type_name_test_data[index],
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: 'sf',
                    color: Colors.grey,
                    fontSize: 100,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
