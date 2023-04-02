import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lighttheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.white,
      canvasColor: creamcolor,
      buttonColor: darkblueish,
      accentColor: darkblueish,
      appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          textTheme: Theme.of(context).textTheme));
  static ThemeData darktheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.black,
        canvasColor: darcreamcolor,
        buttonColor: lightblueish,
        appBarTheme: AppBarTheme(
            color: Colors.black,
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.white),
            textTheme: Theme.of(context).textTheme.copyWith(
                headline6: context.textTheme.headline6
                    ?.copyWith(color: Colors.black))),
      );
  static Color creamcolor = Color(0xfff5f5f5);
  static Color darcreamcolor = Vx.gray900;
  static Color darkblueish = Color(0xff403b58);
  static Color lightblueish = Vx.purple400;
}
