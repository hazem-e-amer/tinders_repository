import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tinders/app_theme.dart';
import 'package:tinders/application/home/blocs/language_bloc/language_bloc.dart';
import 'package:tinders/application/home/screens/home_screen.dart';
import 'package:tinders/application/tinders/widgets/icon_with_text_widget.dart';
import 'package:tinders/configure_di.dart';
import 'package:tinders/core/app_store/app_store.dart';
import 'package:tinders/core/data/local_data/shared_pref.dart';
import 'package:tinders/core/logic/global_bloc.dart';
import 'package:tinders/core/values/constant.dart';

import '../values/values.dart';

class Functions {
  static void printWarning(String text) {
    if (kDebugMode) {
      print('\x1B[33m$text\x1B[0m');
    }
  }

  static void printError(String text) {
    if (kDebugMode) {
      print('\x1B[31m$text\x1B[0m');
    }
  }

  static void printNormal(String text) {
    if (kDebugMode) {
      print('\x1B[36m$text\x1B[0m');
    }
  }

  static void printDone(String text) {
    if (kDebugMode) {
      print('\x1B[32m$text\x1B[0m');
    }
  }

  static Size textSize({
    required String text,
    required TextStyle? style,
    int maxLines = 1,
    double maxWidth = double.infinity,
  }) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: maxLines,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: maxWidth);
    return textPainter.size;
  }

  static showLoaderDialog(BuildContext context) {
    showDialog(
        barrierColor: Colors.transparent,
        context: context,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: const Dialog(
              surfaceTintColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              child:
                  Center(child: CircularProgressIndicator(color: Colors.red)),
            ),
          );
        });
  }

  static void showModalBottomSheetFun(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 2,
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
        decoration: BoxDecoration(
          color: colors(context).backgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF000000).withOpacity(0.25),
              offset: const Offset(0.0, -25.0),
              blurRadius: 86.6,
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              width: 84.w,
              height: 3.h,
              decoration: BoxDecoration(
                color: colors(context).modalBottomSheetDividerColor,
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  SvgPicture.asset(
                    getIt<AppStore>().isDarkMode
                        ? 'assets/icons/profile_dark_icon.svg'
                        : 'assets/icons/profile_icon.svg',
                  ),
                  SizedBox(width: 3.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            'data',
                            style: TextStyle(
                              fontSize: AppFonts.titleFontSize.spMin,
                              color: colors(context).activeIconBackgroundColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'data',
                            style: TextStyle(
                              fontSize: AppFonts.subTitleFontSize.spMin,
                              color: colors(context).titleColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
                margin: EdgeInsets.symmetric(vertical: 5.h),
                decoration: BoxDecoration(
                  color: colors(context).modalBottomSheetContainerColor,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: IconWithTextWidget(
                          image: getIt<AppStore>().isDarkMode
                              ? IconPath.mainIconDark
                              : IconPath.mainIcon,
                          text: 'Main',
                          withBackground: true,
                          isDrawer: true),
                    ),
                    Expanded(
                      child: IconWithTextWidget(
                          image: getIt<AppStore>().isDarkMode
                              ? IconPath.sessionsEndedDark
                              : IconPath.sessionsEnded,
                          text: 'Sessions ended',
                          withBackground: true,
                          isDrawer: true),
                    ),
                    Expanded(
                      child: IconWithTextWidget(
                          image: getIt<AppStore>().isDarkMode
                              ? IconPath.tindersIconDark
                              : IconPath.tindersIcon,
                          text: 'Tinders',
                          withBackground: true,
                          isDrawer: true),
                    ),
                    Expanded(
                      child: IconWithTextWidget(
                          image: getIt<AppStore>().isDarkMode
                              ? IconPath.departmentsIconDark
                              : IconPath.departmentsIcon,
                          text: 'Departments',
                          withBackground: true,
                          isDrawer: true),
                    ),
                  ],
                ),
              ),
            ),
            BlocConsumer<GlobalBloc, GlobalState>(
              listener: (context, state) {
                getIt<AppStore>().isDarkMode = !getIt<AppStore>().isDarkMode;
              },
              builder: (context, state) {
                return Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () {
                      BlocProvider.of<GlobalBloc>(context)
                          .add(ThemeChanged(getIt<AppStore>().isDarkMode));
                      setValue(THEME_MODE_INDEX,
                          getIt<AppStore>().isDarkMode ? 1 : 0);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 800),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0.h, horizontal: 15.0.w),
                      margin: const EdgeInsets.symmetric(vertical: 5.0),
                      decoration: BoxDecoration(
                        color: getIt<AppStore>().isDarkMode
                            ? Colors.white
                            : Colors.black,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                                getIt<AppStore>().isDarkMode
                                    ? 'Light theme'
                                    : 'Dark theme',
                                style: getIt<AppStore>().isDarkMode
                                    ? TextStyle(
                                        fontSize:
                                            AppFonts.subTitleFontSize.spMin,
                                        color: const Color(0xFF000000),
                                      )
                                    : TextStyle(
                                        fontSize:
                                            AppFonts.subTitleFontSize.spMin,
                                        color: const Color(0xFFFFFFFF),
                                      )),
                          ),
                          Expanded(
                            flex: 2,
                            child: SvgPicture.asset(
                              getIt<AppStore>().isDarkMode
                                  ? IconPath.lightThemeIconBottomSheet
                                  : IconPath.darkThemeIconBottomSheet,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
                margin: EdgeInsets.symmetric(vertical: 5.h),
                decoration: BoxDecoration(
                  color: colors(context).lightGreyColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Language',
                        style: TextStyle(
                          fontSize: AppFonts.subTitleFontSize.spMin,
                          color: colors(context).titleColor,
                        ),
                      ),
                    ),
                    BlocBuilder<LanguageBloc, LanguageState>(
                      builder: (context, state) {
                        String value;
                        if (state is LanguageInitialState) {
                          value = state.language;
                        } else if (state is LanguageLoadedState) {
                          value = state.language;
                        } else {
                          value = '';
                        }
                        return Expanded(
                          flex: 2,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              value: value,
                              iconDisabledColor: colors(context).titleColor,
                              iconEnabledColor: colors(context).titleColor,
                              isDense: true,
                              isExpanded: true,
                              alignment: Alignment.center,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              items: languages
                                  .map(
                                    (e) => DropdownMenuItem(
                                      alignment: Alignment.center,
                                      value: e,
                                      child: Text(
                                        e,
                                        style: TextStyle(
                                          fontSize:
                                              AppFonts.subTitleFontSize.spMin,
                                          color: colors(context).titleColor,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (newValue) {
                                BlocProvider.of<LanguageBloc>(context).add(
                                    LanguageChangeEvent(language: newValue!));
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Version 1.0.0',
                      style: TextStyle(
                        fontSize: AppFonts.subTitleFontSize.spMin,
                        color: colors(context).titleColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Transform.scale(
                    scaleX: -1.0,
                    child: SvgPicture.asset(
                      getIt<AppStore>().isDarkMode
                          ? IconPath.logoutIconDark
                          : IconPath.logoutIconDark,
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: AppFonts.subTitleFontSize.spMin,
                      color: colors(context).titleColor,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40.0)),
      ),
    );
  }
}
