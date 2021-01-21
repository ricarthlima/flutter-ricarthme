import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ricarth_flutter/helpers/responsive_values.dart';
import 'package:ricarth_flutter/values/my_colors.dart';
import 'package:ricarth_flutter/values/text_styles.dart';

class ProfessionalPage extends StatefulWidget {
  @override
  _ProfessionalPageState createState() => _ProfessionalPageState();
}

class _ProfessionalPageState extends State<ProfessionalPage> {
  int controller = 0;
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.royalBlueDark,
      body: CarouselSlider(
        items: <Widget>[HomeView(), SobreView()],
        carouselController: buttonCarouselController,
        options: CarouselOptions(
          height: getHeight(context),
          autoPlay: false,
          enableInfiniteScroll: false,
          enlargeCenterPage: true,
          viewportFraction: 1,
        ),
      ),
      //,
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyColors.brilliantRose,
        onPressed: () {
          setState(() {
            buttonCarouselController.nextPage();
          });
        },
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}

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
          vertical: 50,
          horizontal: 75,
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
                  text: ["Full Stack Dev", "Kotlin", "Python", "Rails", "Java"],
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
          alignment: Alignment.centerRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
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
            ),
            textAlign: TextAlign.left,
          ),
          Container(
            width: (getWidth(context) > 1000)
                ? getWidth(context) * 0.6
                : getWidth(context) * 0.9,
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
    );
  }
}
