import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors_const.dart';
import '../presentation/common/theme/theme_bloc.dart';

class AppStyle {

  static ThemeData getApplicationTheme(String mode){

    Color white = ColorsConst.white;
    Color whiteLight = ColorsConst.whiteLight;
    Color text = ColorsConst.text;
    Color text1 = ColorsConst.text1;
    Color shadow = ColorsConst.border;
    Color grey1 = ColorsConst.text1;
    Color primary = ColorsConst.primary;
    Color inputBorder = ColorsConst.border;

    if(mode==ThemeVarient.dark.name){
      white = ColorsConst.text;
      text = ColorsConst.white;
      text1 = ColorsConst.whiteDark;
      inputBorder = ColorsConst.text4;
      whiteLight = ColorsConst.black;
      shadow = ColorsConst.text3;
      primary = ColorsConst.primaryshade;
    }

    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: white,
        foregroundColor: text,
        elevation: 0,
        titleTextStyle: GoogleFonts.openSans(
          fontWeight: FontWeight.w700,
          fontSize: 22,
          color: ColorsConst.text
        )
      ),
      dividerColor: shadow,
      iconTheme: IconThemeData(
        color: text
      ),
      scaffoldBackgroundColor: white,
      primaryColor: primary,
      colorScheme: ColorScheme.light(
        primary: primary,
        secondary: primary,
        tertiary: text1
      ),
      textTheme: TextTheme(
        headlineMedium: GoogleFonts.roboto(
          fontWeight: FontWeight.w900,
          fontSize: 24,
          height: 1.4,
          color: primary
        ),
        titleLarge: GoogleFonts.roboto(
          fontWeight: FontWeight.w600,
          fontSize: 20,
          color: text
        ),
        titleMedium: GoogleFonts.roboto(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: text
        ),
        titleSmall: GoogleFonts.roboto(
          fontWeight: FontWeight.w700,
          fontSize: 20,
          color: ColorsConst.textLight
        ),
        bodyMedium: GoogleFonts.roboto(
          fontWeight: FontWeight.w500,
          fontSize: 18,
          color: text
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
        labelLarge: GoogleFonts.roboto(
          fontWeight: FontWeight.w500,
          color: text
        ),
        labelSmall: GoogleFonts.roboto(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          letterSpacing: 0.6,
          color: text
        ),
      ),

      dialogTheme: DialogTheme(
        backgroundColor: white
      ),

      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: white
      ),

      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primary,
        foregroundColor: ColorsConst.white,
        extendedTextStyle: GoogleFonts.roboto(
          fontWeight: FontWeight.w500,
          fontSize: 18,
          color: ColorsConst.white
        ),
      ),

      listTileTheme: ListTileThemeData(
        minLeadingWidth: 0,
        iconColor: grey1,
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
          color: primary,
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
        fillColor: whiteLight,

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
          borderSide: BorderSide(color: inputBorder, width: 2)
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: primary, width: 2)
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: inputBorder, width: 2)
        ),

        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: inputBorder, width: 2)
        )

      ),

      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStatePropertyAll(
            GoogleFonts.roboto(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: primary
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
              side: BorderSide(color: primary, width: 2)
            ),
          ),
          backgroundColor: MaterialStatePropertyAll(white),
          elevation: const MaterialStatePropertyAll(2),
          textStyle: MaterialStatePropertyAll(
            GoogleFonts.roboto(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: primary
            )
          )
        )
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          padding: const MaterialStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 22, vertical: 20),
          ),
          backgroundColor: MaterialStatePropertyAll(primary),
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