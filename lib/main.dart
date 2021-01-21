import 'package:flutter/material.dart';
import 'package:ricarth_flutter/pages/professional_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ricarth.me',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "NotoSans"),
      // home: AnimatedSplashScreen(
      //   nextScreen: ProfessionalPage(),
      //   splash: Image.asset("assets/ricarth.png"),
      //   backgroundColor: Colors.blue,
      // ),
      home: ProfessionalPage(),
    );
  }
}
