import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:lyshoppingmain/data/product/ProductType.dart';

class item_product_type extends StatefulWidget {
  final ProductType productType;
  const item_product_type({super.key, required this.productType});

  @override
  State<item_product_type> createState() => _item_product_typeState();
}

class _item_product_typeState extends State<item_product_type> {
  String url = '';
  void _getImageURL() async {
    final ref = FirebaseStorage.instance.ref().child('productType').child(widget.productType.id + '.png');
    url = await ref.getDownloadURL();
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getImageURL();
  }

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
                    image: NetworkImage(url),
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
                  widget.productType.name,
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

