import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tinders/configure_di.dart';
import 'package:tinders/core/app_store/app_store.dart';

class ActiveIconWidget extends StatelessWidget {
  final String assetName;

  const ActiveIconWidget({super.key, required this.assetName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55.0,
      height: 55.0,
      decoration: BoxDecoration(
        color: getIt<AppStore>().isDarkMode
            ? const Color(0xFF58728D)
            : const Color(0xFF2B3C4E),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: SvgPicture.asset(
        assetName,
        colorFilter: ColorFilter.mode(
            getIt<AppStore>().isDarkMode
                ? Colors.black
                : const Color(0xFFFFFFFF),
            BlendMode.srcIn),
        fit: BoxFit.none,
      ),
    );
  }
}
