import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tinders/app_theme.dart';
import 'package:tinders/application/authentication/widgets/theme_widget.dart';
import 'package:tinders/core/app_store/app_store.dart';
import 'package:tinders/core/values/values.dart';
import 'package:tinders/main.dart';

import '../../../configure_di.dart';

class BackgroundWidget extends StatelessWidget {
  BackgroundWidget({
    super.key,
    this.isTablet = false,
    required this.child,
    required this.isPortrait,
  });

  final Widget child;
  final bool isPortrait;
  final bool isTablet;

  late String fingerPrintImage;
  late String themeIcon;
  late String langIcon;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomLeft,
              colors: [
                colors(context).firstBackgroundColor!,
                colors(context).secondBackgroundColor!,
              ]),
        ),
        child: isTablet
            ? Row(
                children: [
                  Spacer(),
                  Spacer(),
                  Expanded(
                    flex: 2,
                    child: Container(
                        width: 248.w,
                        height: 248.h,
                        margin: EdgeInsets.only(top: 0.05.h),
                        child: getIt<AppStore>().isDarkMode
                            ? Image.asset(ImagePath.darkMobileLogo)
                            : Image.asset(
                                ImagePath.mobileLogo,
                                fit: BoxFit.fill,
                              )),
                  ),

                  Spacer(),
                  Expanded(
                      flex: 3,
                      child: _buildLoginTabletForm(context)),
                  Spacer(),


                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Expanded(
                    flex: 2,
                    child: Container(
                        width: 124.w,
                       height: 10.h,
                    //    margin: EdgeInsets.only(top: 121.h),
                        child: getIt<AppStore>().isDarkMode
                            ? Image.asset(
                                ImagePath.darkMobileLogo,
                                fit: BoxFit.contain,
                              )
                            : Image.asset(
                                ImagePath.mobileLogo,
                                fit: BoxFit.contain,
                              )),
                  ),
                  Expanded(
                      flex: 3,
                      child: _buildLoginForm(context)),

                ],
              ),
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    setImageAndIconsBasedOnTheme();
    return Column(
      children: [
        Expanded(
            flex: 3,
          child: Container(
                      width: 325.w,
            decoration: BoxDecoration(
                color: colors(context).thirdBackgroundColor,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      color: getIt<AppStore>().isDarkMode
                          ? Color(0xff0000000).withOpacity(0.75)
                          : Color(0xff00000040).withOpacity(0.75),
                      blurRadius: 25,
                      offset: Offset(0, 11),
                      spreadRadius: 0),
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                      width: 195.w,
                                 //     margin: EdgeInsets.only(top: height * 0.06),
                      child: Divider(color: colors(context).dividerColor)),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    language.logIn,
                    style: TextStyle(
                        fontSize: AppFonts.appBarTitleFontSize.spMin,
                        fontWeight: FontWeight.w500,
                        color:colors(context).activeIconBackgroundColor),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                    flex: 6,
                    child: child),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 65.h,
            margin: EdgeInsets.symmetric(horizontal: 34.w, vertical: 5.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ThemeWidget(
                  themeIcon: themeIcon,
                ),
                InkWell(
                  child: Image.asset(langIcon),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildLoginTabletForm(BuildContext context) {
    setImageAndIconsBasedOnTheme();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 10,
          child: Container(
            margin: EdgeInsets.only(
              top: 226.h,
              bottom:100.h
            ),
            height: 403.h,
            width: 377.w,
            decoration: BoxDecoration(
                color: colors(context).thirdBackgroundColor,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      color: Color(0xff00000040).withOpacity(0.75),
                      blurRadius: 25,
                      offset: Offset(0, 11),
                      spreadRadius: 0),
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                      width: 224.w,
                      //margin: EdgeInsets.only(top: 0.04.h),
                      child: Divider(
                        color:  colors(context).dividerColor,
                      )),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Text(
                      language.logIn,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: colors(context).activeIconBackgroundColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                    flex: 6,
                    child: child),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
             crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ThemeWidget(
                themeIcon: themeIcon,
              ),

              InkWell(
                child: Image.asset(langIcon),
              ),

            ],
          ),
        ),

      ],
    );
  }


  setImageAndIconsBasedOnTheme() {
    if (getIt<AppStore>().isDarkMode) {
      fingerPrintImage = ImagePath.darkFingerPrint;
      themeIcon = IconPath.darkThemeIcon;
      langIcon = IconPath.darkLangIcon;
    } else {
      fingerPrintImage = ImagePath.fingerPrint;
      themeIcon = IconPath.themeIcon;
      langIcon = IconPath.langIcon;
    }
  }
}
