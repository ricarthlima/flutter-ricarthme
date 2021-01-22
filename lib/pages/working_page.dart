import 'package:flutter/material.dart';
import 'package:ricarth_flutter/pages/professional_views/appbar.dart';

class WorkingPage extends StatefulWidget {
  @override
  _WorkingPageState createState() => _WorkingPageState();
}

class _WorkingPageState extends State<WorkingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getDefaultAppBar(this.context),
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
