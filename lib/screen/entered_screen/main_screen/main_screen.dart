import 'package:flutter/material.dart';
import 'package:lyshoppingmain/screen/before_screen/preview_screen/preview_screen.dart';
import 'package:lyshoppingmain/screen/entered_screen/account_page/account_page.dart';

import '../../../data/finaldata.dart';

class main_screen extends StatefulWidget {
  const main_screen({super.key});

  @override
  State<main_screen> createState() => _main_screenState();
}

class _main_screenState extends State<main_screen> {
  Widget getBody(int index) {
    if (index == 0) {
      return preview_screen();
    }
    if (index == 1) {
      return account_page();
    }
    return Container();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: getBody(finaldata.currentPage),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(left: 10, right: 10, bottom: 5),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: NavigationBarTheme(
              data: NavigationBarThemeData(
                indicatorColor: Color.fromARGB(255, 255, 190, 93).withOpacity(0.2),
                labelTextStyle: MaterialStateProperty.all(
                  TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.black,
                    fontFamily: 'muli',
                  ),
                ),
                backgroundColor: Colors.transparent,
                labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
              ),
              child: NavigationBar(
                height: 70,
                selectedIndex: finaldata.currentPage,
                onDestinationSelected: (selectedPage) => setState(() {
                  finaldata.currentPage = selectedPage;
                }),
                destinations: [
                  NavigationDestination(icon: Icon(Icons.home_outlined, color: finaldata.currentPage == 0 ? Colors.black : Colors.black, size: 22,), label: finaldata.mainLang.home,),
                  NavigationDestination(icon: Icon(Icons.account_circle_outlined, color: finaldata.currentPage == 1 ? Colors.black : Colors.black, size: 22,), label: finaldata.mainLang.account,),
                  NavigationDestination(icon: Icon(Icons.search, color: finaldata.currentPage == 2 ? Colors.black : Colors.black, size: 22,), label: finaldata.mainLang.search,),
                  NavigationDestination(icon: Icon(Icons.notifications_none, color: finaldata.currentPage == 3 ? Colors.black : Colors.black, size: 22,), label: finaldata.mainLang.notice,),
                  NavigationDestination(icon: Icon(Icons.discount_outlined), label: finaldata.mainLang.voucher,),
                ],
              ),
            ),
          ),
        ),
      ),
      onWillPop: () async {
        return false;
      },
    );
  }
}
