import 'package:flutter/material.dart';
import 'package:truster_app/const/color_constants.dart';

const TextStyle headerTextStyle = TextStyle(color: white, fontSize: 42);
const TextStyle header2TextStyle = TextStyle( fontSize: 22,fontWeight: FontWeight.bold);
const TextStyle header3TextStyle = TextStyle( fontSize: 18,fontWeight: FontWeight.bold);
const TextStyle primaryHeader2TextStyle = TextStyle(color: primary, fontSize: 22,fontWeight: FontWeight.bold);
const TextStyle primaryHeader3TextStyle = TextStyle(color: primary, fontSize: 18,fontWeight: FontWeight.bold);
const TextStyle smallTextStyle = TextStyle(color: white, fontSize: 18);
const TextStyle detailsTextStyle = TextStyle( fontSize: 18);
const TextStyle appBarTextStyle = TextStyle(color: primary);
const TextStyle errorRedTextStyle = TextStyle(color: errorRed);
const TextStyle textLabelTextStyle = TextStyle(color: grey,fontSize: 14);
const TextStyle textButtonTextStyle = TextStyle(color: blue, fontSize: 14);
ButtonStyle buttonStyleSecondary = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(white),
    foregroundColor: MaterialStateProperty.all(primary),
    minimumSize: MaterialStateProperty.all(const Size(double.maxFinite, 45)));
ButtonStyle buttonStyleOutlined = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(primary),
    foregroundColor: MaterialStateProperty.all(white),
    side: MaterialStateProperty.all(const BorderSide(color: white)),
    minimumSize: MaterialStateProperty.all(const Size(double.maxFinite, 45)));
ButtonStyle buttonStyleOutlinedWhite = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(white),
    foregroundColor: MaterialStateProperty.all(grey),
    side: MaterialStateProperty.all(const BorderSide(color: grey)),
    minimumSize: MaterialStateProperty.all(const Size(double.maxFinite, 45)));
ButtonStyle buttonStylePrimary = ButtonStyle(minimumSize: MaterialStateProperty.all(const Size(double.maxFinite, 45)));
