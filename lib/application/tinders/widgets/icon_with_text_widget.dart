import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tinders/configure_di.dart';
import 'package:tinders/core/app_store/app_store.dart';
import 'package:tinders/core/values/values.dart';

class IconWithTextWidget extends StatelessWidget {
  final String image;
  final String text;
  final bool withBackground;
  final bool isDrawer;
  const IconWithTextWidget(
      {super.key,
      required this.image,
      required this.text,
      required this.withBackground,
      required this.isDrawer});

  @override
  Widget build(BuildContext context) {
    return isDrawer
        ? Row(
            children: [
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  color: getIt<AppStore>().isDarkMode
                      ? Colors.black
                      : const Color(0x0ff9d9d9),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 0.1,
                      color: Colors.black.withOpacity(0.18),
                      blurRadius: 10,
                    )
                  ],
                ),
                child: SvgPicture.asset(
                  image,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                width: 3,
              ),
              Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: AppFonts.subTitleFontSize,
                  color: getIt<AppStore>().isDarkMode
                      ? const Color(0xFF58728D)
                      : const Color(0xff2B3C4E),
                ),
              )
            ],
          )
        : Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  color: getIt<AppStore>().isDarkMode
                      ? const Color(0xFF1B1B22)
                      : null,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      offset: const Offset(0, 0),
                      spreadRadius: 0.1,
                      blurRadius: 25,
                    )
                  ],
                ),
                child: SvgPicture.asset(
                  image,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                width: 3,
              ),
              Expanded(
                flex: 9,
                child: Text(
                  text,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: AppFonts.subTitleFontSize,
                      color: getIt<AppStore>().isDarkMode
                          ? const Color(0xFF58728D)
                          : const Color(0xff2B3C4E)),
                ),
              )
            ],
          );
  }
}
