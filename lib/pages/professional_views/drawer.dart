import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:ricarth_flutter/values/my_colors.dart';
import 'package:url_launcher/url_launcher.dart';

Drawer getHomeDrawer({
  required BuildContext context,
  required CarouselSliderController carouselController,
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
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.navigate_next, color: Colors.white),
            title: Text("Sobre",
                style: TextStyle(fontSize: 17, color: Colors.white)),
            onTap: () {
              carouselController.animateToPage(1);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.navigate_next, color: Colors.white),
            title: Text("Serviço",
                style: TextStyle(fontSize: 17, color: Colors.white)),
            onTap: () {
              carouselController.animateToPage(2);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.navigate_next, color: Colors.white),
            title: Text("Contato",
                style: TextStyle(fontSize: 17, color: Colors.white)),
            onTap: () {
              carouselController.animateToPage(3);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.outbond, color: Colors.white),
            title: Text("Portfólio",
                style: TextStyle(fontSize: 17, color: Colors.white)),
            onTap: () {
              launchUrl(Uri.parse("http://github.com/ricarthlima"));
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.outbond, color: Colors.white),
            title: Text("Leituras",
                style: TextStyle(fontSize: 17, color: Colors.white)),
            onTap: () {
              Navigator.pushNamed(context, "/books");
            },
          ),
        ],
      ),
    ),
  );
}
