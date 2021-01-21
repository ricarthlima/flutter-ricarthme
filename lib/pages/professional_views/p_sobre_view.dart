import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:ricarth_flutter/helpers/responsive_values.dart';
import 'package:ricarth_flutter/values/my_colors.dart';
import 'package:ricarth_flutter/values/text_styles.dart';

class SobreView extends StatefulWidget {
  @override
  _SobreViewState createState() => _SobreViewState();
}

class _SobreViewState extends State<SobreView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      width: getWidth(context),
      height: getHeight(context),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/flutter_me.png",
          ),
          fit: BoxFit.fitHeight,
          alignment: (getWidth(context) > 700)
              ? Alignment.centerRight
              : Alignment.center,
        ),
      ),
      child: Center(
        child: ListView(
          shrinkWrap: true,
          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TypewriterAnimatedTextKit(
              text: [
                "Sobre",
              ],
              textStyle: MyTextStyles().heading2,
              textAlign: TextAlign.start,
              speed: const Duration(milliseconds: 200),
              pause: const Duration(milliseconds: 2500),
            ),
            Text(
              "Ricarth Lima",
              style: TextStyle(
                color: MyColors.brilliantRose,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
            Container(
              color: MyColors.blueDarkAlpha25,
              margin: (getWidth(context) > 1000)
                  ? EdgeInsets.only(right: getWidth(context) * 0.4)
                  : EdgeInsets.only(right: 0),
              child: Text(
                "Olá! Sou estudante de Sistemas de Informação no Centro de Informática da Universidade Federal de Pernambuco " +
                    "(CIn-UFPE). Desde muito jovem me interesso por computadores e coisas que podemos fazer com eles. Fiz cursos " +
                    "profissionalizantes na área ainda na minha infância que, apesar de hoje serem conhecimentos ultrapassados, " +
                    "serviram como minha inspiração para seguir os caminhos que trilhei.",
                style: TextStyle(
                  color: Colors.white,
                ),
                textAlign: TextAlign.justify,
              ),
            )
          ],
        ),
      ),
    );
  }
}
