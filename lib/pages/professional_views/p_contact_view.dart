import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:ricarth_flutter/helpers/responsive_values.dart';
import 'package:ricarth_flutter/values/my_colors.dart';
import 'package:ricarth_flutter/values/text_styles.dart';

class PContactView extends StatefulWidget {
  @override
  _PContactViewState createState() => _PContactViewState();
}

class _PContactViewState extends State<PContactView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: (getWidth(context) > 700) ? 50 : 20,
        vertical: 75,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/contact_bg.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TypewriterAnimatedTextKit(
              text: [
                "Contato",
              ],
              textStyle: MyTextStyles().heading2,
              textAlign: TextAlign.start,
              speed: const Duration(milliseconds: 200),
              pause: const Duration(milliseconds: 2500),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15),
            ),
            Text(
              "Precisa de mim? Então entra em contato, estou quase sempre online!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15),
            ),
            Text(
              "Instagram - @ricarthlima",
              style: MyTextStyles().commonText,
              textAlign: TextAlign.center,
            ),
            Text(
              "Twitter - @ricarthlima",
              style: MyTextStyles().commonText,
              textAlign: TextAlign.center,
            ),
            Text(
              "YouTube - Dotcode",
              style: MyTextStyles().commonText,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 7),
            ),
            Text(
              "ricarth.lima@gmail.com",
              style: TextStyle(
                fontSize: 16,
                color: MyColors.brilliantRose,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
