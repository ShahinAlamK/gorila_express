import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier{

  GlobalKey<ScaffoldState> key=GlobalKey<ScaffoldState>();

  void endDrawerOpen(){
    key.currentState!.openDrawer();
  }

}