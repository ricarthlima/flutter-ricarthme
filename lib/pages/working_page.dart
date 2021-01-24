import 'package:flutter/material.dart';
import 'package:ricarth_flutter/values/my_colors.dart';

class WorkingPage extends StatefulWidget {
  @override
  _WorkingPageState createState() => _WorkingPageState();
}

class _WorkingPageState extends State<WorkingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 255, 195, 0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 50),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: MyColors.royalBlueDark,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Image.asset(
                "assets/construction.gif",
                width: 300,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15),
            ),
            Text(
              "Ainda estamos trabalhando aqui!\nVolte mais tarde.",
              style: TextStyle(
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
