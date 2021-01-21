import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ricarth_flutter/helpers/responsive_values.dart';
import 'package:ricarth_flutter/values/my_colors.dart';

import 'professional_views/p_home_view.dart';
import 'professional_views/p_sobre_view.dart';

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
