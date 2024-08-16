import 'package:flutter/material.dart';
import 'package:lyshoppingmain/data/product/ProductDirectory.dart';

import '../main_page/ingredient/directory_area/item_product/item_product.dart';
import '../product_view_screen/product_view_screen.dart';
import 'ingredient/product_type_viewall_appbar.dart';

class product_directory_viewall extends StatefulWidget {
  final ProductDirectory productDirectory;
  final Widget beforeWidget;
  const product_directory_viewall({super.key, required this.productDirectory, required this.beforeWidget});

  @override
  State<product_directory_viewall> createState() => _product_directory_viewallState();
}

class _product_directory_viewallState extends State<product_directory_viewall> {
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
                    title: product_type_viewall_appbar(title: widget.productDirectory.name, beforeWidget: widget.beforeWidget, currentWidget: widget,),
                  ),
                  backgroundColor: Colors.transparent,
                  body: Container(
                    child: RefreshIndicator(
                      onRefresh: _refresh,
                      child: Container(
                        child: widget.productDirectory.productList.length != 0 ? ListView(
                          children: [
                            SizedBox(height: 10,),

                            widget.productDirectory.productList.length != 0 ? Container(
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
                                  itemCount: widget.productDirectory.productList.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      child: item_product(id: widget.productDirectory.productList[index]),
                                      onTap: () {
                                        Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => product_view_screen(id: widget.productDirectory.productList[index], beforeWidget: widget)));
                                      },
                                    );
                                  },
                                ),
                              ),
                            ) : Container(height: height - 10, alignment: Alignment.center, child: Text('There is not any products in here!', style: TextStyle(fontSize: 12, color: Colors.black),),),

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
