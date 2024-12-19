import 'package:flutter/material.dart';
import 'package:ricarth_flutter/values/my_colors.dart';
import 'package:url_launcher/url_launcher.dart';

Widget getSocialMedia(BuildContext context) {
  return Align(
    alignment: Alignment.bottomLeft,
    child: Container(
      margin: EdgeInsets.fromLTRB(15, 0, 0, 15),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: MyColors.white10,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        spacing: 16,
        children: [
          InkWell(
            onTap: () {
              _launchURL("https://github.com/ricarthlima");
            },
            child: Image.asset(
              "icon_github.png",
              width: 24,
            ),
          ),
          InkWell(
            onTap: () {
              _launchURL("https://twitter.com/ricarthlima");
            },
            child: Image.asset(
              "icon_twitter.png",
              width: 24,
            ),
          ),
          InkWell(
            onTap: () {
              _launchURL("https://www.instagram.com/ricarthlima/");
            },
            child: Image.asset(
              "icon_instagram.png",
              width: 24,
            ),
          ),
          InkWell(
            onTap: () {
              _launchURL(
                  "https://www.youtube.com/channel/UCzQIC5Emb1scaYgpJKjktaQ");
            },
            child: Image.asset(
              "icon_youtube.png",
              width: 24,
            ),
          ),
          InkWell(
            onTap: () {
              _launchURL("mailto:ricarth.lima@gmail.com");
            },
            child: Image.asset(
              "icon_email.png",
              width: 24,
            ),
          ),
        ],
      ),
    ),
  );
}

_launchURL(String url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}
