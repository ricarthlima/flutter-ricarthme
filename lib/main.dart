import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

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
      home: AnimatedSplashScreen(
        nextScreen: MyHomePage(),
        splash: Image.asset("assets/ricarth.png"),
        duration: 10,
        backgroundColor: Colors.blue,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 255, 195, 0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 50),
                    ),
                    Image.asset("assets/construction.gif"),
                    Padding(
                      padding: EdgeInsets.only(bottom: 15),
                    ),
                    Text(
                      "Ainda estamos trabalhando,\nvolte mais tarde.",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.blue,
                child: Text(
                  "Feito por @ricarthlima com #Flutter",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: "NotoSans"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
