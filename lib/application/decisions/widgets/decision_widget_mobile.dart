import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tinders/app_theme.dart';
import 'package:tinders/core/values/values.dart';

class DecisionWidgetMobile extends StatelessWidget {
  const DecisionWidgetMobile(
      {super.key, required this.title, required this.type});
  final String title;
  final String type;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const Alignment(0.9, 1.4),
      children: [
        Container(
          height: 70.h,
          width: 327.h,
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: colors(context).lightGreyColor,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF000000).withOpacity(0.25),
                  offset: const Offset(0.0, 6.0),
                  blurRadius: 10,
                  spreadRadius: 0.0,
                ),
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                  height: 30.h,
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: AppFonts.subTitleFontSize.spMin,
                    ),
                    overflow: TextOverflow.ellipsis,
                  )),
              SizedBox(
                width: 12.w,
              ),
              Column(
                children: [
                  Text(
                    'البند',
                    style: TextStyle(fontSize: AppFonts.minFontSize.spMin),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          height: 40.h,
          width: 40.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: colors(context).activeIconBackgroundColor),
          child: Center(
              child: Text(
            type,
            style: TextStyle(
                fontSize: AppFonts.dateFontSize.spMin,
                color: colors(context).textColor),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )),
        )
      ],
    );
  }
}
