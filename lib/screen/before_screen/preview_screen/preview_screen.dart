import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lyshoppingmain/data/finaldata.dart';
import 'package:lyshoppingmain/screen/before_screen/preview_screen/ingredient/item_product_type.dart';
import 'package:lyshoppingmain/screen/before_screen/preview_screen/ingredient/search_box.dart';
import 'package:lyshoppingmain/screen/before_screen/preview_screen/ingredient/slogan_and_cart.dart';

class preview_screen extends StatefulWidget {
  const preview_screen({super.key});

  @override
  State<preview_screen> createState() => _preview_screenState();
}

class _preview_screenState extends State<preview_screen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return WillPopScope(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  width: width,
                  height: width/(829/636),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/image/decor/decor1.png'),
                    ),
                  ),
                ),
              ),

              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  child: ListView(
                    children: [
                      SizedBox(height: 5,),

                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: slogan_and_cart(),
                      ),

                      SizedBox(height: 10,),

                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: search_box(),
                      ),

                      SizedBox(height: 20,),

                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 0),
                        child: Container(
                          height: 170,
                          child: ListView.builder(
                            itemCount: 4,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                child: Padding(
                                  padding: EdgeInsets.only(right: 15),
                                  child: Container(
                                    height: 170,
                                    width: 170 * (5184/2592),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(finaldata.img_test_data[index], fit: BoxFit.cover,),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),

                      SizedBox(height: 10,),

                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 0),
                        child: Container(
                          height: 130,
                          child: ListView.builder(
                            itemCount: finaldata.type_img_test_data.length,
                            padding: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(right: 15,),
                                child: item_product_type(index: index),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),


      ),
      onWillPop: () async {
        return false;
      },
    );
  }
}
