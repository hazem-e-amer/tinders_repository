import 'package:flutter/material.dart';
import 'package:tinders/app_theme.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final List<BottomNavigationBarItem> items;
  final Function(int)? onTap;
  final int currentIndex;

  const BottomNavigationBarWidget(
      {Key? key, required this.items, this.onTap, required this.currentIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.0),
        color: colors(context).bottomNavigationBarBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000).withOpacity(0.25),
            offset: const Offset(0.0, -4.0),
            blurRadius: 7.0,
          ),
          BoxShadow(
            color: const Color(0xFF2B3C4E).withOpacity(0.25),
            offset: const Offset(0.0, 4.0),
            blurRadius: 7.0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40.0),
        child: Theme(
          data: ThemeData(
            canvasColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            items: items,
            onTap: onTap,
            currentIndex: currentIndex,
            type: BottomNavigationBarType.shifting,
            elevation: 0.0,
            selectedFontSize: 0.0,
            unselectedFontSize: 0.0,
          ),
        ),
      ),
    );
  }
}
