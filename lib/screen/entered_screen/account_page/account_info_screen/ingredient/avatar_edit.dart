import 'package:flutter/material.dart';

class avatar_edit extends StatefulWidget {
  const avatar_edit({super.key});

  @override
  State<avatar_edit> createState() => _avatar_editState();
}

class _avatar_editState extends State<avatar_edit> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: width/2.5,
      width: width,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            bottom: 0,
            left: (width - width/2.5)/2,
            right: (width - width/2.5)/2,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(1000),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(2),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(1000),
                  child: Image.asset('assets/image/product_type_example/ava_example.png', fit: BoxFit.cover,),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

