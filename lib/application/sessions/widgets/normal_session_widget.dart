import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tinders/core/layout/responsive_widget_builders.dart';

import '../../../app_theme.dart';

class SessionWidget extends StatelessWidget {
  final Color? color;
  final String sessionTitle;
  final String sessionNumber;
  final String numberOfTopics;
  final String theDate;

  const SessionWidget(
      {super.key,
      this.color,
      required this.sessionTitle,
      required this.sessionNumber,
      required this.numberOfTopics,
      required this.theDate});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidgetBuilder.builder(
      mobile: (context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF000000).withOpacity(0.25),
              offset: const Offset(0.0, 11.0),
              blurRadius: 25.0,
              spreadRadius: 0.0,
            ),
            BoxShadow(
              color: const Color(0xFF2B3C4E).withOpacity(0.1),
              offset: const Offset(0.0, 4.0),
              blurRadius: 4.5,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              sessionTitle,
              style: TextStyle(
                fontSize: 16.0,
                color: colors(context).activeIconBackgroundColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        width: 48.0,
                        height: 48.0,
                        decoration: BoxDecoration(
                          color: colors(context).activeIconBackgroundColor,
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          sessionNumber,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24.0,
                            color: colors(context).backgroundColor,
                          ),
                        ),
                      ),
                      Container(
                        width: 48.0,
                        height: 48.0,
                        margin: const EdgeInsets.only(left: 42.0),
                        decoration: BoxDecoration(
                          color: colors(context).topicsColor,
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          numberOfTopics,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24.0,
                            color: colors(context).backgroundColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: colors(context).lightBlueColor ?? Colors.white,
                      ),
                    ),
                    child: Text(
                      theDate,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: colors(context).titleColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      tablet: (context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF000000).withOpacity(0.25),
              offset: const Offset(0.0, 11.0),
              blurRadius: 25.0,
              spreadRadius: 0.0,
            ),
            BoxShadow(
              color: const Color(0xFF2B3C4E).withOpacity(0.1),
              offset: const Offset(0.0, 4.0),
              blurRadius: 4.5,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              sessionTitle,
              style: TextStyle(
                fontSize: 16.0,
                color: colors(context).activeIconBackgroundColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  children: [
                    Container(
                      width: 48.0,
                      height: 48.0,
                      decoration: BoxDecoration(
                        color: colors(context).activeIconBackgroundColor,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        sessionNumber,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24.0,
                          color: colors(context).backgroundColor,
                        ),
                      ),
                    ),
                    Container(
                      width: 48.0,
                      height: 48.0,
                      margin: const EdgeInsets.only(left: 58.0),
                      decoration: BoxDecoration(
                        color: colors(context).topicsColor,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        numberOfTopics,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24.0,
                          color: colors(context).backgroundColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10.0.w,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 10.0.h, horizontal: 10.0.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: colors(context).lightBlueColor ?? Colors.white,
                    ),
                  ),
                  child: Text(
                    theDate,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: colors(context).titleColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
