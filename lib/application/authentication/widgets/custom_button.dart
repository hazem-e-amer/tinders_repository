import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tinders/app_theme.dart';
import 'package:tinders/core/utils/extensions/int_extensions.dart';
import 'package:tinders/core/values/values.dart';

class CustomButton extends StatelessWidget {
  CustomButton({Key? key, required this.text, required this.onPressed,this.color,this.width}) : super(key: key);
  final String text;
  var onPressed;
 final Color ? color;
 final double? width;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 39,
        width: 162,
        margin: EdgeInsets.symmetric(horizontal: 60),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: colors(context).activeIconBackgroundColor,
        ),

              child: Center(
                child: Text(

                  text,
                  textAlign: TextAlign.center,
                  style:  TextStyle(color:color??  Theme.of(context).cardColor, fontSize: AppFonts.subTitleFontSize,),
                ),
              ),


        ),
    );}}