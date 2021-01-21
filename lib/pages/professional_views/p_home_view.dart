import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:ricarth_flutter/helpers/responsive_values.dart';
import 'package:ricarth_flutter/values/text_styles.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: (getWidth(context) < 500) ? 25 : 75,
        ),
        width: getWidth(context),
        height: getHeight(context),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/coding_bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "RICARTH LIMA",
              style: MyTextStyles().heading1,
            ),
            Text(
              "Desenvolvedor de Aplicativos",
              style: MyTextStyles().subHeadingPink,
            ),
            Text(
              "Programador Flutter",
              style: MyTextStyles().subHeadingPink,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "e ",
                  style: MyTextStyles().subHeadingPink,
                ),
                TypewriterAnimatedTextKit(
                  text: ["Kotlin", "Python", "Rails", "Java", "Full Stack"],
                  textStyle: MyTextStyles().subHeadingPink,
                  textAlign: TextAlign.start,
                  speed: const Duration(milliseconds: 75),
                ),
                Text(
                  ".",
                  style: MyTextStyles().subHeadingPink,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
