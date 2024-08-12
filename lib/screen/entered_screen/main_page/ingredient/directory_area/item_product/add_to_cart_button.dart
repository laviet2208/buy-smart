import 'package:flutter/material.dart';

class add_to_cart_button extends StatelessWidget {
  const add_to_cart_button({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 60;
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        color: Color.fromARGB(255, 22, 143, 136),
      ),
      child: Center(
        child: Icon(
          Icons.add_shopping_cart_outlined,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}
