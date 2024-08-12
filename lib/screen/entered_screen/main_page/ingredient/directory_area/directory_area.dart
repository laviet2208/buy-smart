import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lyshoppingmain/data/product/ProductDirectory.dart';
import 'package:lyshoppingmain/screen/entered_screen/main_page/ingredient/directory_area/item_product/item_product.dart';
import 'package:lyshoppingmain/screen/entered_screen/main_screen/main_screen.dart';
import 'package:lyshoppingmain/screen/entered_screen/product_viewall/product_directory_viewall.dart';

class directory_area extends StatelessWidget {
  final ProductDirectory productDirectory;
  const directory_area({super.key, required this.productDirectory});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(left: 0, right: 0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
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
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 15,),

            Container(
              child: Row(
                children: [
                  SizedBox(width: 15,),

                  Expanded(
                    child: Container(
                      child: Text(
                        productDirectory.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: 'sf',
                          fontSize: width/22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 15,),

                  GestureDetector(
                    child: Container(
                      child: Text(
                        'See all',
                        style: TextStyle(
                          fontFamily: 'sf',
                          fontSize: width/30,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => product_directory_viewall(productDirectory: productDirectory, beforeWidget: main_screen())));
                    },
                  ),

                  SizedBox(width: 10,),
                ],
              ),
            ),

            SizedBox(height: 5,),

            Padding(
              padding: EdgeInsets.only(left: 10, right: 15),
              child: Container(
                height: ((MediaQuery.of(context).size.width - 60)/2) * 1.5 + 8,
                alignment: Alignment.center,
                child: productDirectory.productList.length != 0 ? ListView.builder(
                  itemCount: productDirectory.productList.length,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 5, top: 4, bottom: 4),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: item_product(id: productDirectory.productList[index]),
                    );
                  },
                ) : Text('There is not any products in here!', style: TextStyle(fontSize: 12, color: Colors.grey),),
              ),
            ),

            SizedBox(height: 15,),
          ],
        ),
      ),
    );
  }
}