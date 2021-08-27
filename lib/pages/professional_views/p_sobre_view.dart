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
      padding: EdgeInsets.symmetric(
        horizontal: (getWidth(context) > 700) ? 50 : 20,
        vertical: 75,
      ),
      width: getWidth(context),
      height: getHeight(context),
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //     image: AssetImage(
      //       "assets/flutter_me.png",
      //     ),
      //     fit: BoxFit.fitHeight,
      //     alignment: (getWidth(context) > 700)
      //         ? Alignment.centerRight
      //         : Alignment.center,
      //   ),
      // ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/services.png"),
          repeat: ImageRepeat.repeat,
        ),
      ),
      child: Center(
        child: ListView(
          shrinkWrap: true,
          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(left: 10),
              child: TypewriterAnimatedTextKit(
                text: [
                  "Sobre",
                ],
                textStyle: MyTextStyles().heading2,
                textAlign: TextAlign.start,
                speed: const Duration(milliseconds: 200),
                pause: const Duration(milliseconds: 2500),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                color: MyColors.blueDarkAlpha25,
                margin: (getWidth(context) > 1000)
                    ? EdgeInsets.only(right: getWidth(context) * 0.4)
                    : EdgeInsets.only(right: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ricarth Lima",
                      style: TextStyle(
                        color: MyColors.brilliantRose,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "Olá! " +
                          "Sou programador há mais de 10 anos já tendo atuado com várias tecnologias.\n" +
                          "\n" +
                          "Foi no Ensino Médio do Colégio de Aplicação - UFPE que desenvolvi junto com " +
                          "minha equipe meu primeiro sistema que seria usado na prática, o LactoRun (20" +
                          "13~) que consiste em uma ferramenta digital para obtenção da Máxima Fase Est" +
                          "ável de Lactato por meios não invasivos. Nesse projeto já usei Programação V" +
                          "isual (MIT App Inventor), Java para Windows, Android com Java e Ruby com Rai" +
                          "ls.\n" +
                          "\n" +
                          "Em 2017 ingressei no curso de Sistemas de Informação na Universidade Federal" +
                          " de Pernambuco onde descobri que além da vontade de desenvolver eu gostava t" +
                          "ambém de ensinar. Além de muitas monitorias, aulas particulares e participaç" +
                          "ões em feiras, o principal “output” dessa vontade é o canal no YouTube (Dotc" +
                          "ode) que onde lanço vídeos educativos de computação semanalmente, junto com " +
                          "meu amigo e sócio @warleysoares. \n" +
                          "\n" +
                          "Na primeira metade do ano de 2019 me aventurei no meu primeiro emprego como " +
                          "estagiário de Desenvolvimento Web Full Stack na Serttel. Foi uma experiência" +
                          " incrível de aprendizado. Tive que aprender novas tecnologias como Angular 7" +
                          " (HTML, CSS, Bootstrap, Typescript) para o front, e Spring Boot (Java, JPA, " +
                          "Hibernate) para o back. \n" +
                          "\n" +
                          "Em 2020 me dediquei à tecnologia na qual esse site é construído e que eu sou" +
                          " apaixonado: o Flutter. \n",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
