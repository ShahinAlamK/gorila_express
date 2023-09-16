import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gorila_express/controller/Home_Controller.dart';
import 'package:gorila_express/controller/Theme_controller.dart';
import 'package:gorila_express/screen/Home.dart';
import 'package:gorila_express/style/size_config.dart';
import 'package:gorila_express/style/theme.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness:Brightness.light,
    statusBarIconBrightness:Brightness.dark
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppSize().init(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>HomeController()),
        ChangeNotifierProvider(create: (_)=>ThemeController()),
      ],
      child: Consumer<ThemeController>(
        builder: (_,theme,child){
          return MaterialApp(
              theme: ThemeStyle().lightTheme,
              darkTheme: ThemeStyle().darkTheme,
              themeMode:theme.isDark?ThemeMode.dark:ThemeMode.light,
              debugShowCheckedModeBanner: false,
              home: HomeScreen()
          );
        },
      ),
    );
  }
}

