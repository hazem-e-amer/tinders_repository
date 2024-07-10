import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tinders/app_theme.dart';
import 'package:tinders/routes/pages_name.dart';

import '../../../configure_di.dart';
import '../../../core/app_store/app_store.dart';
import '../../../core/values/values.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
   Timer(const Duration(seconds: 3), () {
     Navigator.pushNamedAndRemoveUntil(context, AppRouteName.loginScreen, (route) => false);
   });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
       backgroundColor: colors(context).backgroundColor,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                    height: 220.h,
                    child: getIt<AppStore>().isDarkMode ? Image.asset(
                      ImagePath.darkMobileLogo, fit: BoxFit.fill,) : Image.asset(
                      ImagePath.mobileLogo, fit: BoxFit.fill,)),
              ),
              const SizedBox(
                height: 25,
              ),


            ],
          ),
        ));
  }
}
