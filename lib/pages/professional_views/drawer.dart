import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:ricarth_flutter/values/my_colors.dart';

Drawer getHomeDrawer({
  @required BuildContext context,
  @required CarouselController carouselController,
}) {
  return Drawer(
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      color: MyColors.royalBlueDark,
      child: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.home, color: Colors.white),
            title: Text("Home",
                style: TextStyle(fontSize: 17, color: Colors.white)),
            onTap: () {
              carouselController.animateToPage(0);
            },
          ),
          ListTile(
            leading: Icon(Icons.navigate_next, color: Colors.white),
            title: Text("Sobre",
                style: TextStyle(fontSize: 17, color: Colors.white)),
            onTap: () {
              carouselController.animateToPage(1);
            },
          ),
          ListTile(
            leading: Icon(Icons.navigate_next, color: Colors.white),
            title: Text("Serviço",
                style: TextStyle(fontSize: 17, color: Colors.white)),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.navigate_next, color: Colors.white),
            title: Text("Portfólio",
                style: TextStyle(fontSize: 17, color: Colors.white)),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.navigate_next, color: Colors.white),
            title: Text("Contato",
                style: TextStyle(fontSize: 17, color: Colors.white)),
            onTap: () {},
          ),
        ],
      ),
    ),
  );
}
