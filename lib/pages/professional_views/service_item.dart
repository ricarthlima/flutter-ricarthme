import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:ricarth_flutter/values/my_colors.dart';

class ServiceItem extends StatefulWidget {
  final String image;
  final String title;
  final String text;
  final int color;
  ServiceItem({this.image, this.title, this.text, this.color});
  @override
  _ServiceItemState createState() => _ServiceItemState();
}

class _ServiceItemState extends State<ServiceItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        width: 300,
        padding: EdgeInsets.all(15),
        height: 250,
        decoration: BoxDecoration(
          color: Color.fromARGB(120, 0, 0, 20),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            width: 3,
            color: (widget.color == 0)
                ? MyColors.brilliantRose
                : MyColors.carolinaBlue,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(widget.image),
            Padding(
              padding: EdgeInsets.only(bottom: 18),
            ),
            TypewriterAnimatedTextKit(
              text: [widget.title],
              textStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
              repeatForever: false,
              totalRepeatCount: 1,
              speed: Duration(milliseconds: 50 + Random().nextInt(50)),
            ),
            Text(
              widget.text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
