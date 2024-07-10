import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tinders/core/layout/responsive_widget_builders.dart';

import '../../../app_theme.dart';
import 'circle_with_text_widget.dart';

class ExplanationWidget extends StatelessWidget {
  const ExplanationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidgetBuilder.builder(
      mobile: (context) => Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            color: colors(context).blackColor ?? Colors.white,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: CircleWithTextWidget(
                  color: colors(context).activeIconBackgroundColor,
                  data: 'Session number'),
            ),
            Expanded(
              child: CircleWithTextWidget(
                  color: colors(context).topicsColor, data: 'Number of topics'),
            ),
            Expanded(
              child: Text(
                'The date',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.0,
                  color: colors(context).titleColor,
                ),
              ),
            ),
          ],
        ),
      ),
      tablet: (context) => Container(
        width: MediaQuery.of(context).size.width / 3,
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        padding: EdgeInsets.symmetric(vertical: 15.0.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            color: colors(context).blackColor ?? Colors.white,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: CircleWithTextWidget(
                  color: colors(context).activeIconBackgroundColor,
                  data: 'Session number'),
            ),
            Expanded(
              child: CircleWithTextWidget(
                  color: colors(context).topicsColor, data: 'Number of topics'),
            ),
            Expanded(
              child: Text(
                'The date',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.0,
                  color: colors(context).titleColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
