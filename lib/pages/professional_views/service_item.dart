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
      width: 300,
      padding: EdgeInsets.all(15),
      height: 250,
      decoration: BoxDecoration(
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
          Text(
            widget.title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
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
    );
  }
}
