

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tinders/core/utils/extensions/int_extensions.dart';

import '../../../app_theme.dart';



class CustomTextField extends StatelessWidget {
  CustomTextField({Key? key,this.width,this.onChanged,this.readOnly,this.color,this.minLines,this.initialValue, required this.keyboardType, required this.prefixIcon,  required this.hintText,  this.suffixIcon, required this.validator, required this.controller, required this.obscureText}) : super(key: key);
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? initialValue;
  FormFieldValidator<String>? validator;
  final ValueSetter<String>? onChanged;
  final String hintText;
  final bool obscureText;
  final int ? minLines;
  final Color? color;
  final double? width;
  final bool? readOnly;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: width??274,
      height: 45,
      child: TextFormField(
     // autofocus: true,
        onChanged:onChanged ,
        maxLines: minLines??1,
        readOnly: readOnly??false,
initialValue: initialValue,
        minLines:minLines ,
        obscureText:obscureText ,
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        //textAlign: TextAlign.center,
      //  textAlignVertical: TextAlignVertical.bottom,
        keyboardAppearance: Brightness.dark,
        // textDirection: TextDirection.rtl,
        decoration: InputDecoration(
        suffixIcon: suffixIcon,

          prefixIcon: prefixIcon,
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 12),
          filled: true,
          fillColor: color??colors(context).textFieldColor,
          contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
            BorderSide( color: colors(context).borderColor!),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color:colors(context).borderColor!, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
      ),
    );}}