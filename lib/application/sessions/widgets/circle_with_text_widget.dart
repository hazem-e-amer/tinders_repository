import 'package:flutter/material.dart';
import 'package:tinders/app_theme.dart';

import '../../../core/values/values.dart';

class CircleWithTextWidget extends StatelessWidget {
  final Color? color;
  final String data;

  const CircleWithTextWidget({super.key, this.color, required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            width: 8.0,
            height: 8.0,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            data,
            style: TextStyle(
              fontSize: 12.0,
              color: colors(context).titleColor,
            ),
          ),
        ),
      ],
    );
  }
}
