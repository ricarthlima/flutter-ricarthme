import 'package:flutter/material.dart';

Size getSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

double getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}
