import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ricarth_flutter/pages/professional_views/appbar.dart';
import 'package:ricarth_flutter/pages/professional_views/drawer.dart';
import 'package:ricarth_flutter/helpers/responsive_values.dart';
import 'package:ricarth_flutter/pages/professional_views/p_contact_view.dart';
import 'package:ricarth_flutter/pages/professional_views/social_medias.dart';
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
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: MyColors.royalBlueDark,
      body: Stack(
        children: [
          CarouselSlider(
            items: <Widget>[
              HomeView(),
              SobreView(),
              //PServicesView(),
              PContactView(),
            ],
            carouselController: buttonCarouselController,
            options: CarouselOptions(
              height: getHeight(context),
              autoPlay: false,
              enableInfiniteScroll: true,
              enlargeCenterPage: true,
              viewportFraction: 1,
              scrollDirection: Axis.horizontal,
            ),
          ),
          getNonAppBar(
            context,
            buttonCarouselController,
            _scaffoldKey,
          ),
          getSocialMedia(context),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyColors.brilliantRose,
        onPressed: () {
          setState(() {
            buttonCarouselController.nextPage();
          });
        },
        child: Icon(Icons.navigate_next),
      ),
      drawer: getHomeDrawer(
        context: context,
        carouselController: buttonCarouselController,
      ),
    );
  }
}
