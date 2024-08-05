import 'package:flutter/material.dart';
import 'package:lyshoppingmain/data/finaldata.dart';
import 'package:lyshoppingmain/screen/entered_screen/account_page/account_info_screen/ingredient/account_info_app_bar.dart';
import 'package:lyshoppingmain/screen/entered_screen/account_page/account_info_screen/ingredient/avatar_edit.dart';
import 'package:lyshoppingmain/screen/entered_screen/account_page/account_info_screen/ingredient/edit_text_in_account.dart';

import '../../main_screen/main_screen.dart';
import '../ingredient/account_page_app_bar.dart';

class account_info_screen extends StatefulWidget {
  const account_info_screen({super.key});

  @override
  State<account_info_screen> createState() => _account_info_screenState();
}

class _account_info_screenState extends State<account_info_screen> {
  TextEditingController firstname_controller = TextEditingController();
  TextEditingController lastname_controller = TextEditingController();
  TextEditingController yourmail_controller = TextEditingController();
  TextEditingController phonenum_controller = TextEditingController();
  TextEditingController address_controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstname_controller.text = finaldata.account.firstName;
    lastname_controller.text = finaldata.account.lastName;
    yourmail_controller.text = finaldata.account.username;
    phonenum_controller.text = finaldata.account.phoneNum;
    address_controller.text = finaldata.account.address;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return WillPopScope(
      child: Scaffold(
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
                        child: account_info_app_bar(),
                      ),

                      SizedBox(height: 80,),

                      avatar_edit(),

                      SizedBox(height: 20,),

                      Padding(
                        padding: EdgeInsets.only(left: 25, right: 25),
                        child: edit_text_in_account(textEditingController: firstname_controller, event: () {}, title: 'First name', hint: 'First name'),
                      ),

                      SizedBox(height: 20,),

                      Padding(
                        padding: EdgeInsets.only(left: 25, right: 25),
                        child: edit_text_in_account(textEditingController: lastname_controller, event: () {}, title: 'Last name', hint: 'Last name'),
                      ),

                      SizedBox(height: 20,),

                      Padding(
                        padding: EdgeInsets.only(left: 25, right: 25),
                        child: edit_text_in_account(textEditingController: yourmail_controller, event: () {}, title: 'Your email', hint: 'Your email'),
                      ),

                      SizedBox(height: 20,),

                      Padding(
                        padding: EdgeInsets.only(left: 25, right: 25),
                        child: edit_text_in_account(textEditingController: phonenum_controller, event: () {}, title: 'Phone number', hint: 'Phone number'),
                      ),

                      SizedBox(height: 20,),

                      Padding(
                        padding: EdgeInsets.only(left: 25, right: 25),
                        child: edit_text_in_account(textEditingController: address_controller, event: () {}, title: 'Your address', hint: 'Your address'),
                      ),

                      SizedBox(height: 80,),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
      onWillPop: () async {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => main_screen(),),);
        return true;},
    );
  }
}
