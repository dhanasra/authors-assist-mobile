import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors_const.dart';

class AppStyle {

  static ThemeData getApplicationTheme(){

    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: ColorsConst.text,
        elevation: 0,
        titleTextStyle: GoogleFonts.openSans(
          fontWeight: FontWeight.w700,
          fontSize: 22,
          color: ColorsConst.text
        )
      ),
      scaffoldBackgroundColor: Colors.white,
      primaryColor: ColorsConst.primary,
      colorScheme: const ColorScheme.light(
        primary: ColorsConst.primary,
      ),
      textTheme: TextTheme(
        headlineMedium: GoogleFonts.roboto(
          fontWeight: FontWeight.w900,
          fontSize: 24,
          height: 1.4,
          color: ColorsConst.primary
        ),
        titleLarge: GoogleFonts.roboto(
          fontWeight: FontWeight.w600,
          fontSize: 20,
          color: ColorsConst.text
        ),
        titleMedium: GoogleFonts.roboto(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: ColorsConst.black
        ),
        titleSmall: GoogleFonts.roboto(
          fontWeight: FontWeight.w700,
          fontSize: 20,
          color: ColorsConst.textLight
        ),
        bodyMedium: GoogleFonts.roboto(
          fontWeight: FontWeight.w500,
          fontSize: 18,
          color: ColorsConst.text
        ),
        bodyLarge: GoogleFonts.roboto(
          fontWeight: FontWeight.w500,
          fontSize: 20,
          height: 1.6,
          color: ColorsConst.greyDark
        ),
        bodySmall: GoogleFonts.roboto(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          height: 1.6,
          color: ColorsConst.text4
        ),
        labelSmall: GoogleFonts.roboto(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          letterSpacing: 0.6,
          color: ColorsConst.black
        ),
      ),

      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: ColorsConst.primary,
        foregroundColor: ColorsConst.white,
        extendedTextStyle: GoogleFonts.roboto(
          fontWeight: FontWeight.w500,
          fontSize: 18,
          color: ColorsConst.white
        ),
      ),

      listTileTheme: ListTileThemeData(
        minLeadingWidth: 0,
        titleTextStyle: GoogleFonts.roboto(
          fontWeight: FontWeight.w400,
          fontSize: 18,
          color: ColorsConst.textLight
        ),
        subtitleTextStyle: GoogleFonts.roboto(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: ColorsConst.grey
        ),
      ),

      tabBarTheme: TabBarTheme(
        indicator: BoxDecoration(
          color: ColorsConst.primary,
          borderRadius: BorderRadius.circular(10)
        ),
        labelColor: ColorsConst.white,
        unselectedLabelColor: ColorsConst.text4,
        labelStyle: GoogleFonts.roboto(
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        unselectedLabelStyle: GoogleFonts.roboto(
          fontWeight: FontWeight.w500,
          fontSize: 16,
        )
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: ColorsConst.whiteLight,

        contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),

        hintStyle: GoogleFonts.roboto(
          fontWeight: FontWeight.w400,
          fontSize: 18,
          color: ColorsConst.text1
        ),

        floatingLabelStyle: GoogleFonts.roboto(
          fontWeight: FontWeight.w400,
          color: ColorsConst.greyDark
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: ColorsConst.border, width: 2)
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: ColorsConst.primary, width: 2)
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: ColorsConst.border, width: 2)
        ),

        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: ColorsConst.border, width: 2)
        )

      ),

      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStatePropertyAll(
            GoogleFonts.roboto(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: ColorsConst.primary
            )
          )
        )
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          padding: const MaterialStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 22, vertical: 16),
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
              side: const BorderSide(color: ColorsConst.primary, width: 2)
            ),
          ),
          backgroundColor: const MaterialStatePropertyAll(Colors.white),
          elevation: const MaterialStatePropertyAll(2),
          textStyle: MaterialStatePropertyAll(
            GoogleFonts.roboto(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: ColorsConst.primary
            )
          )
        )
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          padding: const MaterialStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 22, vertical: 20),
          ),
          backgroundColor: const MaterialStatePropertyAll(ColorsConst.primary),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          textStyle: MaterialStatePropertyAll(
            GoogleFonts.roboto(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: Colors.white
            )
          )
        )
      )

    );
  }

}