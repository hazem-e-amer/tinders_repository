import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tinders/app_theme.dart';
import 'package:tinders/core/values/values.dart';

DateTime time = DateTime(2024, DateTime.january);

class TabletTinderWidget extends StatelessWidget {
  final String? title;
  final int? count;

  final void Function()? onTap;
  const TabletTinderWidget({
    Key? key,
    this.title,
    this.count,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 150.w, vertical: 10.h),
        child: SizedBox(
          height: 83.h,
          child: Container(
            height: 90.h,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: colors(context).blackColor!.withOpacity(0.3),
                      blurRadius: 5,
                      blurStyle: BlurStyle.normal,
                      offset: const Offset(0, 3)),
                ],
                color: colors(context).lightGreyColor,
                borderRadius: BorderRadius.all(Radius.circular(20.sp))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  title ?? "",
                  style: TextStyle(
                      fontSize: AppFonts.maxFontSize.spMin,
                      color: colors(context).activeIconBackgroundColor),
                ),
                Container(
                  margin: EdgeInsets.only(left: 180.w),
                  height: 57.h,
                  width: 57.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colors(context).activeIconBackgroundColor,
                  ),
                  child: Center(
                    child: Text(
                      count != null ? '$count' : "",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: AppFonts.titleFontSize.spMin),
                    ),
                  ),
                ),
                Row(
                  //  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    Text(time.toString().substring(0, 10).replaceAll('-', '/'),
                        style: TextStyle(
                            fontSize: AppFonts.subTitleFontSize.spMin,
                            color: colors(context).activeIconBackgroundColor)),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: SvgPicture.asset('assets/icons/arraw.svg')),
                    Text(
                      time.toString().substring(0, 10).replaceAll('-', '/'),
                      style: TextStyle(
                          fontSize: AppFonts.dateFontSize.spMin,
                          color: colors(context).activeIconBackgroundColor),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
