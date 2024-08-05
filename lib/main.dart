import 'package:flutter/material.dart';
import 'package:lyshoppingmain/screen/before_screen/loading_screen.dart';

import 'screen/entered_screen/account_page/account_info_screen/account_info_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   // options: FirebaseOptions(
  //   //       apiKey: "AIzaSyD-09bxgKHW4FKs3xfZ2QijmEYIhTkHtz8",
  //   //       authDomain: "masuship-5b377.firebaseapp.com",
  //   //       databaseURL: "https://masuship-5b377-default-rtdb.firebaseio.com",
  //   //       projectId: "masuship-5b377",
  //   //       storageBucket: "masuship-5b377.appspot.com",
  //   //       messagingSenderId: "788990781107",
  //   //       appId: "1:788990781107:web:95d970ed04837970df72c6",
  //   //       measurementId: "G-7ZRQF8P3MS"
  //   //   ),
  // );
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // String? language = prefs.getString('language');
  // if (language != null) {
  //   if (language == 'ENG') {
  //     finaldata.mainlanguage = finaldata.en;
  //   } else {
  //     finaldata.mainlanguage = finaldata.vi;
  //   }
  // }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buy Smart',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const loading_screen(),
    );
  }
}
