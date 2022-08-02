import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/constants/kcolors.dart';
import 'package:movies_app/homepage/home_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: KColors.eerieBlack,
        scaffoldBackgroundColor: Colors.transparent,
        textTheme: TextTheme(
          bodyText1: GoogleFonts.archivo(
            fontSize: 18,
            color: KColors.white,
            fontWeight: FontWeight.w300,
          ),
          bodyText2: GoogleFonts.archivo(
            fontSize: 22,
            color: KColors.white,
            fontWeight: FontWeight.w200,
          ),
          headline1: GoogleFonts.archivo(
            fontSize: 18,
            color: KColors.white,
            fontWeight: FontWeight.w500,
          ),
          headline2: GoogleFonts.archivo(
            fontSize: 22,
            color: KColors.white.withOpacity(0.8),
            fontWeight: FontWeight.w400,
          ),
          headline3: GoogleFonts.archivo(
            fontSize: 40,
            color: KColors.white,
            fontWeight: FontWeight.w100,
          ),
          headline4: GoogleFonts.archivo(
            fontSize: 30,
            color: KColors.white,
            fontWeight: FontWeight.w500,
          ),
          subtitle1: GoogleFonts.archivo(
            fontSize: 16,
            color: KColors.white.withOpacity(0.5),
            fontWeight: FontWeight.w400,
          ),
          subtitle2: GoogleFonts.archivo(
            fontSize: 16,
            color: KColors.white.withOpacity(0.9),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}
