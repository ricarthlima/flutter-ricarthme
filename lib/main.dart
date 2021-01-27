import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:ricarth_flutter/pages/personal_views/mybooks_view.dart';
import 'package:ricarth_flutter/pages/professional_page.dart';
import 'package:ricarth_flutter/values/my_colors.dart';

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
      //   splash: Image.asset(
      //     "assets/ricarth.png",
      //     width: 100,
      //   ),
      //   backgroundColor: MyColors.royalBlueDark,
      // ),
      initialRoute: "/",
      routes: {
        "/": (context) => AnimatedSplashScreen(
              nextScreen: ProfessionalPage(),
              splash: Image.asset(
                "assets/ricarth.png",
                width: 100,
              ),
              backgroundColor: MyColors.royalBlueDark,
            ),
        "/books": (context) => MyBooksPage()
      },
    );
  }
}
