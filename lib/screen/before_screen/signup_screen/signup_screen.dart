import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../data/finaldata.dart';
import '../signin_screen/ingredient/text_field_login.dart';

class signup_screen extends StatefulWidget {
  const signup_screen({super.key});

  @override
  State<signup_screen> createState() => _signup_screenState();
}

class _signup_screenState extends State<signup_screen> {
  bool loading = false;
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final userController = TextEditingController();
  final passController = TextEditingController();

  bool can_continue() {
    if (userController.text.isNotEmpty && passController.text.isNotEmpty && firstNameController.text.isNotEmpty && lastNameController.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return WillPopScope(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 49, 127, 123),
        body: Container(
          child: ListView(
            children: [
              Container(
                alignment: Alignment.center,
                child: Container(
                  width: width/3 * 1.5,
                  height: width/3 * 1.5,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/image/logo/yellowwhite.png'),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 25, right: 25),
                child: Container(
                  height: 35,
                  alignment: Alignment.centerLeft,
                  child: AutoSizeText(
                    finaldata.mainLang.createaccount,
                    style: TextStyle(
                      fontFamily: 'sf',
                      fontSize: 100,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 25, right: 25),
                child: Container(
                  height: 20,
                  alignment: Alignment.centerLeft,
                  child: AutoSizeText(
                    finaldata.mainLang.createaaccounttoshoppinginbuysmart,
                    style: TextStyle(
                      fontFamily: 'sf',
                      fontSize: 100,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20,),

              Padding(
                padding: EdgeInsets.only(left: 25, right: 25),
                child: text_field_login(controller: firstNameController, hint: finaldata.mainLang.firstName, event: () {setState(() {});}, iconData: Icons.sd_card_alert_outlined,),
              ),

              SizedBox(height: 20,),

              Padding(
                padding: EdgeInsets.only(left: 25, right: 25),
                child: text_field_login(controller: lastNameController, hint: finaldata.mainLang.lastName, event: () {setState(() {});}, iconData: Icons.sd_card_alert_outlined,),
              ),

              SizedBox(height: 20,),

              Padding(
                padding: EdgeInsets.only(left: 25, right: 25),
                child: text_field_login(controller: userController, hint: finaldata.mainLang.Username, event: () {setState(() {});}, iconData: Icons.account_circle_outlined,),
              ),

              SizedBox(height: 20,),

              Padding(
                padding: EdgeInsets.only(left: 25, right: 25),
                child: text_field_login(controller: passController, hint: finaldata.mainLang.Password, event: () {setState(() {});}, iconData: Icons.lock,),
              ),

              SizedBox(height: 20,),

              Padding(
                padding: EdgeInsets.only(left: 25, right: 25),
                child: SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll<Color>(can_continue() ? Color.fromARGB(255, 243, 175, 74) : Colors.grey),
                    ),
                    onPressed: () async {
                      if (can_continue()) {

                      } else {

                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 7, bottom: 7),
                      child: !loading ? Text(
                        finaldata.mainLang.createaccount,
                        style: TextStyle(
                          fontFamily: 'sf',
                          color: Colors.white,
                          fontSize: width/25,
                          fontWeight: FontWeight.normal,
                        ),
                      ) : CircularProgressIndicator(color: Colors.white,),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 30,),

              Container(
                height: 20,
                width: width,
                alignment: Alignment.center,
                child: AutoSizeText(
                  finaldata.mainLang.youhaveaaccount,
                  style: TextStyle(
                    fontFamily: 'sf',
                    fontSize: 100,
                    color: Colors.white,
                  ),
                ),
              ),

              SizedBox(height: 10,),

              GestureDetector(
                child: Container(
                  height: 20,
                  width: width,
                  alignment: Alignment.center,
                  child: AutoSizeText(
                    finaldata.mainLang.Login,
                    style: TextStyle(
                      fontFamily: 'sf',
                      fontSize: 100,
                      color: Color.fromARGB(255, 243, 175, 74),
                    ),
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
