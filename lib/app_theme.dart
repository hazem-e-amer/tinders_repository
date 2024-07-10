import 'package:flutter/material.dart';

AppColors colors(context) => Theme.of(context).extension<AppColors>()!;

ThemeData getAppTheme(BuildContext context, bool isDarkTheme) {
  // isDarkTheme = getIt<AppStore>().isDarkMode;
  return ThemeData(
    textTheme: TextTheme(
      displayMedium: TextStyle(
          color:
              isDarkTheme ? const Color(0xFFFFFFFF) : const Color(0xFF000000)),
      displaySmall: TextStyle(
          color:
              isDarkTheme ? const Color(0xFFFFFFFF) : const Color(0xFF000000)),
      displayLarge: TextStyle(
          color:
              isDarkTheme ? const Color(0xFFFFFFFF) : const Color(0xFF000000)),
      bodySmall: TextStyle(
          color:
              isDarkTheme ? const Color(0xFFFFFFFF) : const Color(0xFF000000)),
      bodyMedium: TextStyle(
          color:
              isDarkTheme ? const Color(0xFFFFFFFF) : const Color(0xFF000000)),
      bodyLarge: TextStyle(
          color:
              isDarkTheme ? const Color(0xFFFFFFFF) : const Color(0xFF000000)),
      titleMedium: TextStyle(
          color:
              isDarkTheme ? const Color(0xFFFFFFFF) : const Color(0xFF000000)),
      titleLarge: TextStyle(
          color:
              isDarkTheme ? const Color(0xFFFFFFFF) : const Color(0xFF000000)),
      headlineSmall: TextStyle(
          color:
              isDarkTheme ? const Color(0xFFFFFFFF) : const Color(0xFF000000)),
    ),
    extensions: <ThemeExtension<AppColors>>[
      AppColors(
          kAppColor:
              isDarkTheme ? const Color(0xff2B3C4E) : const Color(0xff2B3C4E),
          backgroundColor: isDarkTheme ? Colors.black : const Color(0xFFFFFFFF),
          circleColor: isDarkTheme ? const Color(0XFFD9D9D9) : const Color(0xFF1B1B22),
          firstBackgroundColor: isDarkTheme ? Color(0XFF1B1B22) : const Color(0xFFFFFFFF),
          secondBackgroundColor: isDarkTheme ? Color(0XFF0A0908) : const Color(0xFFD5D8DC),
          thirdBackgroundColor:isDarkTheme ? const Color(0xFF1B1B22) : const Color(0xFFF1F1E6),
          titleColor:
              isDarkTheme ? const Color(0xFFD2D2D2) : const Color(0xFF202020),
          bottomNavigationBarBackgroundColor:
              isDarkTheme ? const Color(0xFF0A0908) : const Color(0xFFBACBE2),
          activeIconBackgroundColor:
              isDarkTheme ? const Color(0xFF58728D) : const Color(0xFF2B3C4E),
          tindersCardTextColor:
              isDarkTheme ? const Color(0xFFFFFFFF) : const Color(0xFF2B3C4E),
          blackColor: isDarkTheme ? Colors.white : const Color(0xFF000000),
          blackColorwithOpacity:
              isDarkTheme ? Colors.white : const Color(0xFF1B1B22),
          greyColor: isDarkTheme ? Colors.white : const Color(0xFFD9D9D9),
          topicsColor:
              isDarkTheme ? const Color(0xFFC38400) : const Color(0xFFC38400),
          lightBlueColor: isDarkTheme ? Colors.white : const Color(0xFF98B6DA),
          lightGreyColor:
              isDarkTheme ? const Color(0xFF1B1B22) : const Color(0xFFF1F1E6),
          darkBlueColor:
              isDarkTheme ? const Color(0xFF243241) : const Color(0xFF374E60),
          detailsTitleColor:
              isDarkTheme ? const Color(0xFF202020) : const Color(0xFFD2D2D2),
          buttonBackgroundColor:
              isDarkTheme ? const Color(0xFF58728D) : const Color(0xFF1B1B22),
          dividerColor:
              isDarkTheme ? const Color(0xFF9A9A9A) : const Color(0xFF9A9A9A),
          textFieldColor:
              isDarkTheme ? const Color(0xFF0A0908) :  Colors.white,
          modalBottomSheetDividerColor:
              isDarkTheme ? const Color(0xFF9A9A9A) : const Color(0xFF6B6B6B),
          modalBottomSheetContainerColor:
              isDarkTheme ? const Color(0xff1B1B22) : const Color(0xFFF9F9F9),
          textColor:
              isDarkTheme ? const Color(0xFFFFFFFF) : const Color(0xFF000000),
          darkTextColor:
              isDarkTheme ? const Color(0xFF000000) : const Color(0xFFFFFFFF),
          borderColor:
  isDarkTheme ? const Color(0xFF58728D) : const Color(0xFF9A9A9A)),

    ],
  );
}

class AppColors extends ThemeExtension<AppColors> {
  final Color? kAppColor;
  final Color? backgroundColor;
  final Color? thirdBackgroundColor;
  final Color? titleColor;
  final Color? bottomNavigationBarBackgroundColor;
  final Color? activeIconBackgroundColor;
  final Color? tindersCardTextColor;
  final Color? blackColor;
  final Color? blackColorwithOpacity;
  final Color? greyColor;
  final Color? topicsColor;
  final Color? lightBlueColor;
  final Color? lightGreyColor;
  final Color? darkBlueColor;
  final Color? detailsTitleColor;
  final Color? buttonBackgroundColor;
  final Color? dividerColor;
  final Color? modalBottomSheetDividerColor;
  final Color? modalBottomSheetContainerColor;
  final Color? textColor;
  final Color? darkTextColor;
  final Color? textFieldColor;
final Color? borderColor;
final Color? firstBackgroundColor;
final Color? secondBackgroundColor;
final Color? circleColor;
  const AppColors(  {
    required this.kAppColor,
    required this.backgroundColor,
    required this.titleColor,
    required this.bottomNavigationBarBackgroundColor,
    required this.activeIconBackgroundColor,
    required this.tindersCardTextColor,
    required this.blackColor,
    required this.blackColorwithOpacity,
    required this.greyColor,
    required this.topicsColor,
    required this.lightBlueColor,
    required this.lightGreyColor,
    required this.darkBlueColor,
    required this.detailsTitleColor,
    required this.buttonBackgroundColor,
    required this.dividerColor,
    required this.modalBottomSheetDividerColor,
    required this.modalBottomSheetContainerColor,
    required this.textColor,
    required this.darkTextColor,
    required this.thirdBackgroundColor, 
    required this.textFieldColor,
    required this.borderColor,
    required this.firstBackgroundColor,
    required this.secondBackgroundColor,
    required this.circleColor
  });

  @override
  AppColors copyWith({
    Color? kAppColor,
    Color? backgroundColor,
    Color? titleColor,
    Color? bottomNavigationBarBackgroundColo,
    Color? activeIconBackgroundColor,
    Color? blackColor,
    Color? blackColorwithOpacity,
    Color? greyColor,
    Color? tindersCardTextColor,
    Color? topicsColor,
    Color? lightBlueColor,
    Color? lightGreyColor,
    Color? darkBlueColor,
    Color? detailsTitleColor,
    Color? buttonBackgroundColor,
    Color? dividerColor,
    Color? modalBottomSheetDividerColor,
    Color? modalBottomSheetContainerColor,
    Color? textColor,
    Color? darkTextColor,
  }) {
    return AppColors(
      kAppColor: kAppColor ?? this.kAppColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      titleColor: titleColor ?? this.titleColor,
      bottomNavigationBarBackgroundColor: bottomNavigationBarBackgroundColor ??
          bottomNavigationBarBackgroundColor,
      activeIconBackgroundColor:
          activeIconBackgroundColor ?? this.activeIconBackgroundColor,
      tindersCardTextColor: tindersCardTextColor ?? this.tindersCardTextColor,
      blackColor: blackColor ?? this.blackColor,
      blackColorwithOpacity:
          blackColorwithOpacity ?? this.blackColorwithOpacity,
      greyColor: greyColor ?? this.greyColor,
      topicsColor: topicsColor ?? this.topicsColor,
      lightBlueColor: lightBlueColor ?? this.lightBlueColor,
      lightGreyColor: lightGreyColor ?? this.lightGreyColor,
      darkBlueColor: darkBlueColor ?? this.darkBlueColor,
      detailsTitleColor: detailsTitleColor ?? this.detailsTitleColor,
      buttonBackgroundColor:
          buttonBackgroundColor ?? this.buttonBackgroundColor,
      dividerColor: dividerColor ?? this.dividerColor,
      modalBottomSheetDividerColor:
          modalBottomSheetDividerColor ?? this.modalBottomSheetDividerColor,
      modalBottomSheetContainerColor:
          modalBottomSheetContainerColor ?? this.modalBottomSheetContainerColor,
      textColor: textColor ?? this.textColor,
      darkTextColor: darkTextColor ?? this.darkTextColor, thirdBackgroundColor: thirdBackgroundColor, textFieldColor: this.textFieldColor, borderColor: this.borderColor, firstBackgroundColor: this.firstBackgroundColor,
      secondBackgroundColor: this.secondBackgroundColor, circleColor: this.circleColor
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      kAppColor: Color.lerp(kAppColor, other.kAppColor, t),
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      titleColor: Color.lerp(titleColor, other.titleColor, t),
      bottomNavigationBarBackgroundColor: Color.lerp(
          bottomNavigationBarBackgroundColor,
          other.bottomNavigationBarBackgroundColor,
          t),
      activeIconBackgroundColor: Color.lerp(
          activeIconBackgroundColor, other.activeIconBackgroundColor, t),
      tindersCardTextColor:
          Color.lerp(tindersCardTextColor, other.tindersCardTextColor, t),
      blackColor: Color.lerp(blackColor, other.blackColor, t),
      blackColorwithOpacity:
          Color.lerp(blackColorwithOpacity, other.blackColorwithOpacity, t),
      greyColor: Color.lerp(greyColor, other.greyColor, t),
      topicsColor: Color.lerp(topicsColor, other.topicsColor, t),
      lightBlueColor: Color.lerp(lightBlueColor, other.lightBlueColor, t),
      lightGreyColor: Color.lerp(lightGreyColor, other.lightGreyColor, t),
      darkBlueColor: Color.lerp(darkBlueColor, other.darkBlueColor, t),
      detailsTitleColor:
          Color.lerp(detailsTitleColor, other.detailsTitleColor, t),
      buttonBackgroundColor:
          Color.lerp(buttonBackgroundColor, other.buttonBackgroundColor, t),
      dividerColor: Color.lerp(dividerColor, other.dividerColor, t),
      modalBottomSheetDividerColor: Color.lerp(
          modalBottomSheetDividerColor, other.modalBottomSheetDividerColor, t),
      modalBottomSheetContainerColor: Color.lerp(modalBottomSheetContainerColor,
          other.modalBottomSheetContainerColor, t),
      textColor: Color.lerp(textColor, other.textColor, t),
      darkTextColor: Color.lerp(darkTextColor, other.darkTextColor, t),
      thirdBackgroundColor: Color.lerp(thirdBackgroundColor, other.thirdBackgroundColor, t),
      textFieldColor: Color.lerp(textFieldColor, other.textFieldColor, t),
      borderColor:Color.lerp(borderColor, other.borderColor, t),
      firstBackgroundColor: Color.lerp(firstBackgroundColor, other.firstBackgroundColor, t),
      secondBackgroundColor: Color.lerp(secondBackgroundColor, other.secondBackgroundColor, t), circleColor:  Color.lerp(circleColor, other.circleColor, t),
    );
  }
}
