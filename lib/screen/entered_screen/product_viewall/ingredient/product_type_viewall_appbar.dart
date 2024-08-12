import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class product_type_viewall_appbar extends StatelessWidget {
  final String title;
  final Widget beforeWidget;
  const product_type_viewall_appbar({super.key, required this.title, required this.beforeWidget});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      child: Row(
        children: [
          GestureDetector(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
                size: 20,
              ),
            ),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => beforeWidget));
            },
          ),

          SizedBox(width: 15,),

          Container(
            width: (width - 40)/2,
            child: Text(
              title,
              maxLines: 1,
              style: TextStyle(
                fontFamily: 'sf',
                fontSize: width/18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Expanded(child: Container()),

          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white.withOpacity(0.3),
            ),
            child: Padding(
              padding: EdgeInsets.all(0),
              child: Container(
                alignment: Alignment.center,
                child: Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.black,
                  size: 20,
                ),
              ),
            ),
          ),

          SizedBox(width: 15,),

          Container(
            width: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset('assets/image/product_type_example/ava_example.png', fit: BoxFit.fitWidth,),
            ),
          ),
        ],
      ),
    );
  }
}
