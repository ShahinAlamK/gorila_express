
import 'package:flutter/material.dart';
import 'package:gorila_express/style/fonts.dart';
import 'package:gorila_express/style/size_config.dart';

class ThemeStyle{

  ThemeData get lightTheme=>_lightTheme;
  ThemeData get darkTheme=>_darkTheme;

  final _lightTheme =ThemeData.light().copyWith(
      brightness: Brightness.light,
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
      iconTheme:IconThemeData(
        color:Colors.blueGrey.shade900,
      ),
      titleTextStyle:AppStyle.large.copyWith(fontSize: AppSize.horizontal!*5,color:Colors.blueGrey.shade800),
    ),

      switchTheme:SwitchThemeData(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      thumbColor: MaterialStateProperty.all(Colors.white),
      trackColor: MaterialStateProperty.all(Colors.green),

    ),

      textTheme:TextTheme(
      bodySmall:AppStyle.small.copyWith(fontSize:getW(20),color:Colors.blueGrey.shade800),
      bodyMedium:AppStyle.medium.copyWith(fontSize: getW(25),color:Colors.blueGrey.shade800),
      bodyLarge:AppStyle.large.copyWith(fontSize: getW(30),color:Colors.blueGrey.shade800),
    ),

      listTileTheme: ListTileThemeData(
        iconColor:Colors.blueGrey.shade900,
        titleTextStyle:AppStyle.medium.copyWith(fontSize: AppSize.horizontal!*4,color:Colors.blueGrey.shade800),
      ),

      iconTheme:IconThemeData(
        color:Colors.blueGrey.shade900,
      ),

      colorScheme: ColorScheme.dark(
          brightness: Brightness.light,
          secondary:Colors.grey.shade100
      ),

    cardTheme: CardTheme(
      color: Colors.grey.shade200,
      shadowColor: Colors.blueGrey.shade200,
      elevation: 0,
    ),

    drawerTheme: DrawerThemeData(
      backgroundColor: Colors.grey.shade100,
      elevation: 2,
      width: AppSize.width!/1.5,
    ),

    dialogTheme: DialogTheme(
      backgroundColor:Colors.grey.shade100,
      elevation: 5,
    )

  );

  final _darkTheme =ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.blueGrey.shade900,

      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blueGrey.shade900,
        elevation: 0,
        scrolledUnderElevation: 0,
        iconTheme:IconThemeData(
          color:Colors.grey.shade100,
        ),
        titleTextStyle:AppStyle.large.copyWith(fontSize: AppSize.horizontal!*5,color:Colors.grey.shade50),
      ),

    textTheme:TextTheme(
      bodySmall:AppStyle.small.copyWith(fontSize:getW(20),color:Colors.grey.shade50),
      bodyMedium:AppStyle.medium.copyWith(fontSize:getW(25),color:Colors.grey.shade50),
      bodyLarge:AppStyle.large.copyWith(fontSize: getW(30),color:Colors.grey.shade50),
    ),

      listTileTheme: ListTileThemeData(
        iconColor:Colors.grey.shade100,
        titleTextStyle:AppStyle.medium.copyWith(fontSize: AppSize.horizontal!*4,color:Colors.grey.shade50),
      ),

    iconTheme:IconThemeData(
      color:Colors.grey.shade100,
    ),

    colorScheme: ColorScheme.dark(
      brightness: Brightness.dark,
      secondary:Colors.blueGrey.shade800
    ),

    drawerTheme: DrawerThemeData(
      backgroundColor:Colors.blueGrey.shade900,
      elevation: 2,
      width: AppSize.width!/1.6,
    ),

      dialogTheme: DialogTheme(
        backgroundColor:Colors.blueGrey.shade900,
        elevation: 5,
      )
  );
}