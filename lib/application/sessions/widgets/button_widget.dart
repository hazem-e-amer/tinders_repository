import 'package:flutter/material.dart';
import 'package:tinders/app_theme.dart';
import 'package:tinders/configure_di.dart';
import 'package:tinders/core/app_store/app_store.dart';

import '../../../core/values/values.dart';

class ButtonWidget extends StatelessWidget {
  final Function()? onTap;
  final String data;

  const ButtonWidget({super.key, this.onTap, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 97.0,
        height: 58.0,
        decoration: BoxDecoration(
          color: getIt<AppStore>().isDarkMode
              ? const Color(0XFFF1F1E6)
              : const Color(0xff1B1B22),
          borderRadius: BorderRadius.circular(23.0),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF000000).withOpacity(0.25),
              offset: const Offset(0.0, 4.0),
              blurRadius: 13.6,
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          data,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: AppFonts.minFontSize,
            color: colors(context).backgroundColor,
          ),
        ),
      ),
    );
  }
}
