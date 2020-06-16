import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primary = Color(0XFF2C54D8);

const Color accent = Color(0xFF51fa8f);

const Color bgColor = Color(0xFF201F1F);

const Color darkGrey = Color(0xff292525);

const Color red = Color(0xFFD82C68);

const Color white = Colors.white;

const Color black = Colors.black;

const Color grey = Colors.grey;

themeData(context) => ThemeData(
      textTheme: GoogleFonts.latoTextTheme(
        Theme.of(context).textTheme,
      ),
      primarySwatch: Colors.blue,
      primaryColor: bgColor,
      brightness: Brightness.dark,
      backgroundColor: bgColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
