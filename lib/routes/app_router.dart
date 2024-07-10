
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tinders/application/authentication/screens/login_page.dart';
import 'package:tinders/application/home/screens/home_screen.dart';
import 'package:tinders/application/authentication/screens/splash_screen.dart';
import 'package:tinders/routes/pages_name.dart';

import '../core/values/exeptions.dart';

class AppRoute{

 static Route<dynamic> generateRoute(RouteSettings settings){
    switch (settings.name){
      case AppRouteName.splashScreen:
        return MaterialPageRoute(builder: (_) =>  const SplashScreen());
      case AppRouteName.homeScreen:
        return MaterialPageRoute(builder: (_) =>  const HomeScreen());
      case AppRouteName.loginScreen:
        return MaterialPageRoute(builder: (_) =>   LogInPage());
      default:
        throw const RouteException('Route not found!');
    }
  }
}