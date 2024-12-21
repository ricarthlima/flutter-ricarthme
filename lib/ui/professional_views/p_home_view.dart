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
          horizontal: (getWidth(context) < 630) ? 20 : 75,
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
          spacing: 8,
          children: [
            Text(
              "RICARTH LIMA",
              style: MyTextStyles().heading1,
            ),
            Text(
              "Instrutor de software,",
              style: MyTextStyles().subHeadingPink,
            ),
            Text(
              "criador de conteúdo,",
              style: MyTextStyles().subHeadingPink,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "e programador em ",
                  style: MyTextStyles().subHeadingPink,
                ),
                TypewriterAnimatedTextKit(
                  text: [
                    "Flutter.",
                    "Unity.",
                    "Python.",
                    "Rails.",
                    "Java.",
                    "Full-Stack.",
                  ],
                  textStyle: MyTextStyles().subHeadingPink,
                  textAlign: TextAlign.start,
                  speed: const Duration(milliseconds: 75),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
