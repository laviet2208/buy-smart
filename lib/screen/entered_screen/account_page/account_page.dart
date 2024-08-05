import 'package:flutter/material.dart';
import 'package:lyshoppingmain/screen/entered_screen/account_page/account_info_screen/account_info_screen.dart';
import 'package:lyshoppingmain/screen/entered_screen/account_page/ingredient/account_info.dart';
import 'package:lyshoppingmain/screen/entered_screen/account_page/ingredient/account_page_app_bar.dart';
import 'package:lyshoppingmain/screen/entered_screen/account_page/ingredient/bottom_line.dart';
import 'package:lyshoppingmain/screen/entered_screen/account_page/ingredient/feature_button.dart';
import 'package:lyshoppingmain/screen/entered_screen/account_page/ingredient/other_box.dart';

class account_page extends StatefulWidget {
  const account_page({super.key});

  @override
  State<account_page> createState() => _account_pageState();
}

class _account_pageState extends State<account_page> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: height/3,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 190, 93),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0),
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
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: account_page_app_bar(),
                    ),

                    SizedBox(height: 20,),

                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: account_info(),
                    ),

                    SizedBox(height: 30,),

                    Padding(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: other_box(),
                    ),

                    SizedBox(height: 20,),

                    Padding(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: feature_button(color: Colors.black, title: 'Order history', iconData: Icons.calendar_today_outlined),
                    ),

                    bottom_line(),

                    Padding(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: feature_button(color: Colors.black, title: 'Your wallet', iconData: Icons.account_balance_wallet_outlined),
                    ),

                    bottom_line(),

                    Padding(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: GestureDetector(
                        child: feature_button(color: Colors.black, title: "Account's infomation", iconData: Icons.account_circle_outlined),
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => account_info_screen(),),);
                        },
                      ),
                    ),

                    bottom_line(),

                    Padding(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: GestureDetector(
                        child: feature_button(color: Colors.black, title: "Your cart", iconData: Icons.shopping_cart_outlined),
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => account_info_screen(),),);
                        },
                      ),
                    ),

                    bottom_line(),

                    Padding(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: feature_button(color: Colors.red, title: "Sign out", iconData: Icons.logout),
                    ),

                    bottom_line(),

                    Padding(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: feature_button(color: Colors.red, title: "Delete account", iconData: Icons.delete_outline),
                    ),

                    SizedBox(height: 20,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
