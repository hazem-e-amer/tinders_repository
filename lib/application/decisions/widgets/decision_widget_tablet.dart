import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tinders/app_theme.dart';
import 'package:tinders/core/values/values.dart';

class DecisionWidgetTablet extends StatelessWidget {
  const DecisionWidgetTablet(
      {super.key, required this.title, required this.type});
  final String title;
  final String type;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment(0.85.w, 1.4.h),
      children: [
        Container(
          height: 70.h,
          width: 814.w,
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 30.w),
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
                  child: Text(
                title,
                style: TextStyle(fontSize: AppFonts.maxFontSize.spMin),
              )),
              SizedBox(
                width: 50.w,
              ),
              Column(
                children: [
                  Text(
                    'البند',
                    style: TextStyle(fontSize: AppFonts.subTitleFontSize.spMin),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          height: 38.h,
          width: 38.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: colors(context).activeIconBackgroundColor),
          child: Center(
              child: Text(
            type,
            style: TextStyle(fontSize: 14.spMin),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )),
        )
      ],
    );
  }
}
