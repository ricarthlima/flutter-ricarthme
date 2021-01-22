import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ricarth_flutter/helpers/responsive_values.dart';
import 'package:ricarth_flutter/values/my_colors.dart';
import 'package:ricarth_flutter/values/text_styles.dart';

Widget getDefaultAppBar(BuildContext context) {
  return AppBar(
    leading: Text("Amor"),
    backgroundColor: MyColors.blueDarkAlpha25,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
  );
}

Widget getNonAppBar(
  BuildContext context,
  CarouselController carouselController,
  GlobalKey<ScaffoldState> scaffoldKey,
) {
  return Container(
    color: MyColors.white10,
    height: 50,
    width: getWidth(context),
    alignment: Alignment.centerLeft,
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: (getWidth(context) > 700)
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlatButton(
                onPressed: () {
                  carouselController.animateToPage(0);
                },
                child: Text(
                  "Home",
                  style: MyTextStyles().appBarButton,
                ),
              ),
              FlatButton(
                onPressed: () {
                  carouselController.animateToPage(1);
                },
                child: Text(
                  "Sobre",
                  style: MyTextStyles().appBarButton,
                ),
              ),
              FlatButton(
                onPressed: () {},
                child: Text(
                  "Serviços",
                  style: MyTextStyles().appBarButton,
                ),
              ),
              FlatButton(
                onPressed: () {},
                child: Text(
                  "Portfólio",
                  style: MyTextStyles().appBarButton,
                ),
              ),
              FlatButton(
                onPressed: () {},
                child: Text(
                  "Contato",
                  style: MyTextStyles().appBarButton,
                ),
              ),
            ],
          )
        : GestureDetector(
            onTap: () {
              scaffoldKey.currentState.openDrawer();
            },
            child: Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
  );
}
