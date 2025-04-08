import 'package:flutter/material.dart';

abstract class AppColor {
  AppColor._();

  static const Color primaryColor = Color.fromARGB(255, 255, 255, 255);
  static const Color profileCardBg = Colors.white;
  static const Color bgColor = Colors.white;
  static const Color profileHeaderColor = Color(0xFFFFE488);
  static const Color brandColor = Color(0xFFF0DEA4);

  static const Color logoutText = Colors.blue;
  static const Color restPasswordText = Colors.blue;

  static const Color regularText = Color(0xFF000000);
  static const Color secondaryText = Colors.black38;

  static const Color inputFieldBg = Color.fromRGBO(240, 240, 240, 1);
  static const Color textfieldTextColor = Colors.black;
  static const Color textFieldBorder = Color.fromARGB(0, 141, 132, 132);

  static const Color buttonBg = Colors.black;
  static const Color buttonBorder = Colors.black;
  static const Color buttonText = Colors.white;

  static Color checkBoxBg(bool isChecked) =>
      isChecked ? Colors.black : Colors.white;
  static const Color activeCheck = Colors.white;

  static const Color testButtonBg = Colors.transparent;

  static const Color progressBar = Colors.white;
}
