import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import '../../../../../../data/otherdata/Tool.dart';
import '../../../../../../data/product/Product.dart';
import 'add_to_cart_button.dart';

class item_product extends StatefulWidget {
  final String id;
  const item_product({super.key, required this.id});

  @override
  State<item_product> createState() => _item_productState();
}

class _item_productState extends State<item_product> {
  String url = '';
  Product product = Product(id: '', name: 'This is demo product of the app, the demo product can be not click by user', productType: '', showStatus: 0, createTime: getCurrentTime(), description: '', directoryList: [], cost: 1000, costBeforeSale: 1100, inventory: 0, saleLimit: getCurrentTime(), subdescription: '', viName: '');

  void _getImageURL() async {
    final ref = FirebaseStorage.instance.ref().child('product').child(widget.id).child(widget.id + '_0.png');
    url = await ref.getDownloadURL();
    setState(() {

    });
  }

  void getData() async {
    final reference = FirebaseDatabase.instance.ref();
    DatabaseEvent snapshot = await reference.child("productList").child(widget.id).once();
    final dynamic data = snapshot.snapshot.value;
    product = Product.fromJson(data);
    _getImageURL();
    setState(() {

    });
    // final reference = FirebaseDatabase.instance.ref();
    // reference.child("productList").child(widget.id).onValue.listen((event) {
    //   final dynamic orders = event.snapshot.value;
    //   product = Product.fromJson(orders);
    //   _getImageURL();
    //   setState(() {
    //
    //   });
    // });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    _getImageURL();
  }

  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width - 60)/2;
    double height = width * 1.5;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 5,
            left: 5,
            right: 5,
            child: Container(
              width: width - 10,
              height: width - 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: url == '' ? Image.asset('assets/image/logo/mainlogo.png', fit: BoxFit.cover,) : Image.network(url, fit: BoxFit.fitWidth,),
              ),
            ),
          ),

          // Positioned(
          //   top: 10,
          //   left: 10,
          //   child: Container(
          //     width: 35,
          //     height: 35,
          //     decoration: BoxDecoration(
          //       color: Colors.grey.withOpacity(0.6),
          //       borderRadius: BorderRadius.circular(1000),
          //     ),
          //     child: Center(
          //       child: Icon(
          //         Icons.favorite_border,
          //         color: Colors.black,
          //         size: 20,
          //       ),
          //     ),
          //   ),
          // ),

          Positioned(
            top: 8 + width - 10,
            left: 5,
            right: 5,
            bottom: 0,
            child: ListView(
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Container(
                  width: width - 10,
                  child: Text(
                    product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: width/12,
                      fontFamily: 'sf',
                      color: Color.fromARGB(255, 106, 106, 106),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: 3,),

                Padding(
                  padding: EdgeInsets.only(left: 0, right: 50),
                  child: Text(
                    getStringNumber(product.cost) + '.USDT',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: width/12,
                      fontFamily: 'sf',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: 3,),

                Padding(
                  padding: EdgeInsets.only(left: 0, right: 50),
                  child: RichText(
                    text: product.costBeforeSale > product.cost ? TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: getStringNumber(product.costBeforeSale) + '. USDT',
                          style: TextStyle(
                            fontSize: width / 16,
                            fontFamily: 'muli',
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.lineThrough, // Thêm gạch chéo
                            decorationColor: Colors.grey, // Màu gạch chéo
                            decorationThickness: 2,
                          ),
                        ),

                        TextSpan(
                          text: ' . ' + calculateDiscountPercentage(product.costBeforeSale, product.cost).toString() + '% off',
                          style: TextStyle(
                            fontSize: width/16,
                            fontFamily: 'muli',
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ) : TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Maximum savings',
                          style: TextStyle(
                            fontSize: width/16,
                            fontFamily: 'muli',
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ),

          Positioned(
            bottom: 0,
            right: 0,
            child: add_to_cart_button(product: product,),
          ),
        ],
      ),
    );
  }
}

