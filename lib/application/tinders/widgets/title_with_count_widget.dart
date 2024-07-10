import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tinders/app_theme.dart';
import 'package:tinders/core/values/values.dart';

class TitleWithCountWidget extends StatelessWidget {
  final String? title;
  final String? count;
  final bool isTablet;
  const TitleWithCountWidget({
    super.key,
    this.isTablet = false,
    required this.title,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        color: colors(context).darkBlueColor,
      ),
      height: isTablet ? 90.h : 100.h,
      width: isTablet ? 81.w : null,
      child: Column(children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title ?? "",
                  style: TextStyle(
                    color: const Color(0xFFD2D2D2),
                    fontSize: AppFonts.minFontSize.spMin,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    count ?? "",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: AppFonts.maxFontSize.spMin,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
