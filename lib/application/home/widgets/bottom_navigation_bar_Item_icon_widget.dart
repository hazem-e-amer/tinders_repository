import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../app_theme.dart';
import '../../../configure_di.dart';
import '../../../core/app_store/app_store.dart';

class BottomNavigationBarItemIconWidget extends StatelessWidget {
  final bool isTablet;
  final String assetName;
  final String data;

  const BottomNavigationBarItemIconWidget(
      {super.key,
      required this.isTablet,
      required this.assetName,
      required this.data});

  @override
  Widget build(BuildContext context) {
    return isTablet
        ? Container(
            width: 167.0,
            height: 58.0,
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(0.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: SvgPicture.asset(
                    assetName,
                    colorFilter: ColorFilter.mode(
                        getIt<AppStore>().isDarkMode
                            ? const Color(0xFF243241)
                            : const Color(0xFF374E60),
                        BlendMode.srcIn),
                    fit: BoxFit.none,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    data,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: colors(context).darkBlueColor,
                    ),
                  ),
                ),
              ],
            ),
          )
        : SvgPicture.asset(assetName);
  }
}
