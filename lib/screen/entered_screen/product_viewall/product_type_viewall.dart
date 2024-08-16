import 'package:flutter/material.dart';
import 'package:lyshoppingmain/data/product/ProductType.dart';
import 'package:lyshoppingmain/screen/entered_screen/main_page/ingredient/directory_area/item_product/item_product.dart';

import '../product_view_screen/product_view_screen.dart';
import 'ingredient/product_type_viewall_appbar.dart';

class product_type_viewall extends StatefulWidget {
  final ProductType productType;
  final Widget beforeWidget;
  const product_type_viewall({super.key, required this.productType, required this.beforeWidget});

  @override
  State<product_type_viewall> createState() => _product_type_viewallState();
}

class _product_type_viewallState extends State<product_type_viewall> {
  Future<void> _refresh() async {

  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return WillPopScope(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 240, 241, 242),
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
                child: Scaffold(
                  appBar: AppBar(
                    surfaceTintColor: Colors.transparent,
                    backgroundColor: Colors.transparent,
                    title: product_type_viewall_appbar(title: widget.productType.name, beforeWidget: widget.beforeWidget, currentWidget: widget,),
                  ),
                  backgroundColor: Colors.transparent,
                  body: Container(
                    child: RefreshIndicator(
                      onRefresh: _refresh,
                      child: Container(
                        alignment: Alignment.center,
                        child: widget.productType.productList.length != 0 ? ListView(
                          children: [
                            SizedBox(height: 10,),

                            Container(
                              child: Padding(
                                padding: EdgeInsets.only(left: 15, right: 15),
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, // số phần tử trên mỗi hàng
                                    mainAxisSpacing: 20, // khoảng cách giữa các hàng
                                    crossAxisSpacing: 15, // khoảng cách giữa các cột
                                    childAspectRatio: 2/3,
                                  ),
                                  itemCount: widget.productType.productList.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      child: item_product(id: widget.productType.productList[index], productList: widget.productType.productList, event: () {setState(() {});},),
                                      onTap: () {
                                        Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => product_view_screen(id: widget.productType.productList[index], beforeWidget: widget)));
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),

                            SizedBox(height: 30,),
                          ],
                        ) : Text('There is not any products in here!', style: TextStyle(fontSize: 12, color: Colors.black),),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onWillPop: () async {
        Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => widget.beforeWidget));
        return true;
      },
    );
  }
}
