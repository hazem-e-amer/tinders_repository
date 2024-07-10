import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tinders/app_theme.dart';
import 'package:tinders/application/decisions/screens/decisions_tab.dart';
import 'package:tinders/application/home/widgets/bottom_navigation_bar_Item_active_icon_widget.dart';
import 'package:tinders/application/home/widgets/bottom_navigation_bar_Item_icon_widget.dart';
import 'package:tinders/application/sessions/screens/normal_sessions_tab.dart';
import 'package:tinders/application/tinders/screens/tinders_tab.dart';
import 'package:tinders/core/layout/responsive_widget_builders.dart';
import 'package:tinders/core/widgets/app_bar_widget.dart';
import 'package:tinders/core/widgets/bottom_navigation_bar_widget.dart';
import 'package:tinders/core/widgets/navigator_widget.dart';

import '../../../core/utils/functions.dart';
import '../../sessions/screens/secret_sessions_tab.dart';

const List<String> tabsTitles = [
  'Normal sessions',
  'Secret sessions',
  'Tinders',
  'Decisions'
];

// const List<Widget> tabs = [
//   NormalSessionsTab(),
//   SecretSessionsTab(),
//   TindersTab(),
//   DecisionsTab()
// ];

const List<String> languages = [
  'English',
  'العربية',
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  // final Map navigatorKeys = {
  //   tabs[0]: GlobalKey<NavigatorState>(),
  //   tabs[1]: GlobalKey<NavigatorState>(),
  //   tabs[2]: GlobalKey<NavigatorState>(),
  //   tabs[3]: GlobalKey<NavigatorState>()
  // };
  final Map navigatorKeys = {
    0: GlobalKey<NavigatorState>(),
    1: GlobalKey<NavigatorState>(),
    2: GlobalKey<NavigatorState>(),
    3: GlobalKey<NavigatorState>()
  };
  int currentIndex = 0;

  // Widget currentTab = tabs[0];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        var bool = await navigatorKeys[currentIndex]!.currentState!.maybePop();
        if (bool == false) {
          if (currentIndex == 0) {
            // exit(0);
          } else {
            setState(() {
              currentIndex = 0;
              // currentTab = tabs[0];
            });
          }
        }
      },
      child: ResponsiveWidgetBuilder.builder(
        mobile: (context) => Scaffold(
          key: scaffoldKey,
          extendBody: true,
          backgroundColor: colors(context).backgroundColor,
          appBar: AppBarWidget(
            leading: GestureDetector(
              child: Icon(
                Icons.arrow_back,
                color: colors(context).titleColor,
              ),
              onTap: () async {
                var bool =
                    await navigatorKeys[currentIndex]!.currentState!.maybePop();
                if (bool == false) {
                  if (currentIndex == 0) {
                    exit(0);
                  } else {
                    setState(() {
                      currentIndex = 0;
                      // currentTab = tabs[0];
                    });
                  }
                }
              },
            ),
            title: Text(
              tabsTitles[currentIndex],
              style: TextStyle(
                color: colors(context).titleColor,
                fontSize: 14,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: GestureDetector(
                  child: SvgPicture.asset(
                    'assets/icons/menu_icon.svg',
                    colorFilter: ColorFilter.mode(
                        colors(context).titleColor ?? Colors.white,
                        BlendMode.srcIn),
                  ),
                  onTap: () {
                    Functions.showModalBottomSheetFun(context);
                  },
                ),
              ),
            ],
            backgroundColor: colors(context).backgroundColor,
          ),
          bottomNavigationBar: BottomNavigationBarWidget(
            items: const [
              BottomNavigationBarItem(
                  icon: BottomNavigationBarItemIconWidget(
                    isTablet: false,
                    assetName: 'assets/icons/normal_sessions_icon.svg',
                    data: 'Normal sessions',
                  ),
                  activeIcon: BottomNavigationBarItemActiveIconWidget(
                    isTablet: false,
                    assetName: 'assets/icons/normal_sessions_icon.svg',
                    data: 'Normal sessions',
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: BottomNavigationBarItemIconWidget(
                    isTablet: false,
                    assetName: 'assets/icons/secret_sessions_icon.svg',
                    data: 'Secret sessions',
                  ),
                  activeIcon: BottomNavigationBarItemActiveIconWidget(
                    isTablet: false,
                    assetName: 'assets/icons/secret_sessions_icon.svg',
                    data: 'Secret sessions',
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: BottomNavigationBarItemIconWidget(
                    isTablet: false,
                    assetName: 'assets/icons/tinders_icon.svg',
                    data: 'Tinders',
                  ),
                  activeIcon: BottomNavigationBarItemActiveIconWidget(
                    isTablet: false,
                    assetName: 'assets/icons/tinders_icon.svg',
                    data: 'Tinders',
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: BottomNavigationBarItemIconWidget(
                    isTablet: false,
                    assetName: 'assets/icons/decisions_icon.svg',
                    data: 'Decisions',
                  ),
                  activeIcon: BottomNavigationBarItemActiveIconWidget(
                    isTablet: false,
                    assetName: 'assets/icons/decisions_icon.svg',
                    data: 'Decisions',
                  ),
                  label: ''),
            ],
            onTap: (index) {
              setState(() {
                currentIndex = index;
                // currentTab = tabs[index];
              });
            },
            currentIndex: currentIndex,
          ),
          body: NavigatorWidget(
            navigatorKey: navigatorKeys[currentIndex],
            widget: buildBody(currentIndex),
          ),
        ),
        tablet: (context) => Scaffold(
          key: scaffoldKey,
          extendBody: true,
          backgroundColor: colors(context).backgroundColor,
          appBar: AppBarWidget(
            leading: GestureDetector(
              child: Icon(
                Icons.arrow_back,
                color: colors(context).titleColor,
              ),
              onTap: () async {
                var bool =
                    await navigatorKeys[currentIndex]!.currentState!.maybePop();
                if (bool == false) {
                  if (currentIndex == 0) {
                    exit(0);
                  } else {
                    setState(() {
                      currentIndex = 0;
                      // currentTab = tabs[0];
                    });
                  }
                }
              },
            ),
            title: Text(
              tabsTitles[currentIndex],
              style: TextStyle(
                color: colors(context).titleColor,
                fontSize: 14,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: GestureDetector(
                  child: SvgPicture.asset(
                    'assets/icons/menu_icon.svg',
                    colorFilter: ColorFilter.mode(
                        colors(context).titleColor ?? Colors.white,
                        BlendMode.srcIn),
                  ),
                  onTap: () {
                    Functions.showModalBottomSheetFun(context);
                  },
                ),
              ),
            ],
            backgroundColor: colors(context).backgroundColor,
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
            child: BottomNavigationBarWidget(
              items: const [
                BottomNavigationBarItem(
                    icon: BottomNavigationBarItemIconWidget(
                      isTablet: true,
                      assetName: 'assets/icons/normal_sessions_icon.svg',
                      data: 'Normal sessions',
                    ),
                    activeIcon: BottomNavigationBarItemActiveIconWidget(
                      isTablet: true,
                      assetName: 'assets/icons/normal_sessions_icon.svg',
                      data: 'Normal sessions',
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: BottomNavigationBarItemIconWidget(
                      isTablet: true,
                      assetName: 'assets/icons/secret_sessions_icon.svg',
                      data: 'Secret sessions',
                    ),
                    activeIcon: BottomNavigationBarItemActiveIconWidget(
                      isTablet: true,
                      assetName: 'assets/icons/secret_sessions_icon.svg',
                      data: 'Secret sessions',
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: BottomNavigationBarItemIconWidget(
                      isTablet: true,
                      assetName: 'assets/icons/tinders_icon.svg',
                      data: 'Tinders',
                    ),
                    activeIcon: BottomNavigationBarItemActiveIconWidget(
                      isTablet: true,
                      assetName: 'assets/icons/tinders_icon.svg',
                      data: 'Tinders',
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: BottomNavigationBarItemIconWidget(
                      isTablet: true,
                      assetName: 'assets/icons/decisions_icon.svg',
                      data: 'Decisions',
                    ),
                    activeIcon: BottomNavigationBarItemActiveIconWidget(
                      isTablet: true,
                      assetName: 'assets/icons/decisions_icon.svg',
                      data: 'Decisions',
                    ),
                    label: ''),
              ],
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                  // currentTab = tabs[index];
                });
              },
              currentIndex: currentIndex,
            ),
          ),
          body: NavigatorWidget(
            navigatorKey: navigatorKeys[currentIndex],
            widget: buildBody(currentIndex),
          ),
        ),
        // body: Stack(
        //   children: List.generate(
        //     tabs.length,
        //     (index) => buildOffstageNavigator(tabs[index]),
        //   ),
        // ),
      ),
    );
  }

  // Widget buildOffstageNavigator(Widget widget) {
  //   return Offstage(
  //     offstage: currentTab != widget,
  //     child: NavigatorWidget(
  //       navigatorKey: navigatorKeys[widget],
  //       widget: widget,
  //     ),
  //   );
  // }

  Widget buildBody(int index) {
    if (index == 0) {
      return const NormalSessionsTab();
    } else if (index == 1) {
      return const SecretSessionsTab();
    } else if (index == 2) {
      return const TindersTab();
    } else {
      return const DecisionsTab();
    }
  }
}
