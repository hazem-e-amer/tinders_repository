

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tinders/app_theme.dart';
import 'package:tinders/application/decisions/screens/tablet_normal_decision_screen.dart';
import 'package:tinders/core/values/values.dart';
import 'package:tinders/main.dart';

import '../../../core/layout/responsive_widget_builders.dart';
import '../../sessions/screens/normal_sessions_tab.dart';
import 'decision_screen.dart';

List<String> listTabBarDecisionItemName = [
  language.decision,
  language.preparatoryDisclousre,
  language.meetingMinuts,
];

class DecisionsTab extends StatefulWidget {
  const DecisionsTab({super.key});

  @override
  State<DecisionsTab> createState() => _DecisionsTabState();
}

class _DecisionsTabState extends State<DecisionsTab> {
  int _selectedItemPosition = 0;
  int _selectedTab = 3;
  bool visible = true;
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidgetBuilder.builder(
      mobile: mobile(),
      tablet: tablet(),
    );
  }

  Widget Function(BuildContext)? mobile() {
    Widget buildMobile(BuildContext context) {
      return OrientationLayoutBuilder(
        portrait: portraitMobile(),
        landscape: landscapeMobile(),
      );
    }

    return buildMobile;
  }

  //TODO BUILD PORTRAIT MOBILE
  Widget Function(BuildContext) portraitMobile() {
    Widget buildMobile(BuildContext context) {
      return
        Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                  (index) => InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          controller.animateToPage(index,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.linear);
                          _selectedItemPosition = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 3, vertical: 3),
                        padding: const EdgeInsets.all(5),
                        height: _selectedItemPosition == index ? 85.h : 60.h,
                        width: _selectedItemPosition == index ? 85.w : 60.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: _selectedItemPosition == index
                                ? colors(context).activeIconBackgroundColor
                                : colors(context).circleColor),
                        child: Center(
                            child: Text(
                          listTabBarDecisionItemName[index],
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: _selectedItemPosition == index
                                  ? AppFonts.subTitleFontSize.sp
                                  : AppFonts.minFontSize.sp,
                              color: _selectedItemPosition == index
                                  ? colors(context).textColor
                                  : colors(context).darkTextColor),
                        )),
                      )),
                )),
            Expanded(
              child: PhysicalModel(

                elevation: 0,
                  color: colors(context).backgroundColor!,
                //  clipBehavior: Clip.antiAlias,
                  child: AnimatedContainer(
                    color: colors(context).backgroundColor!,
                    duration: const Duration(seconds: 1),
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: controller,
                      children: const <Widget>[
                        NormalSessionsTab(),
                        NormalSessionsTab(),
                        DecisionScreen()
                      ],
                    ),
                  )),
            ),
          ],
        );
    }

    return buildMobile;
  }

  //TODO BUILD landscape MOBILE
  Widget Function(BuildContext) landscapeMobile() {
    Widget buildMobile(BuildContext context) {
      return
        Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                  (index) => InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          controller.animateToPage(index,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.linear);
                          _selectedItemPosition = index;
                        });
                      },
                      child: Container(
                        margin:  EdgeInsets.symmetric(
                            horizontal: 3.w, vertical: 3.h),
                        padding: const EdgeInsets.all(5),
                        height: _selectedItemPosition == index ? 85.h : 60.h,
                        width: _selectedItemPosition == index ? 85.w : 60.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: _selectedItemPosition == index
                                ? colors(context).activeIconBackgroundColor
                                : colors(context).circleColor),
                        child: Center(
                            child: Text(
                          listTabBarDecisionItemName[index],
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: _selectedItemPosition == index
                                  ? AppFonts.subTitleFontSize.spMin
                                  : AppFonts.minFontSize.spMin,
                              color: _selectedItemPosition == index
                                  ? colors(context).textColor
                                  : colors(context).darkTextColor),
                        )),
                      )),
                )),
            Expanded(
              child: PhysicalModel(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40)),
                  clipBehavior: Clip.antiAlias,
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: controller,
                      children: const <Widget>[
                        NormalSessionsTab(),
                        NormalSessionsTab(),
                        DecisionScreen()
                      ],
                    ),
                  )),
            ),
          ],
        );
    }

    return buildMobile;
  }

  //TODO BUILD TABLET
  Widget Function(BuildContext) tablet() {
    Widget buildTablet(BuildContext context) {
      return
         Padding(
          padding: EdgeInsets.symmetric(horizontal: 150.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(
                        3,
                        (index) => InkWell(
                            splashColor: Colors.transparent,
                            onTap: () {
                              index == 0 ? visible = true : visible = false;
                              // Navigator.of(context, rootNavigator: true).pushNamed( AppRouteName.tabletDecisionScreen,);

                              setState(() {
                                controller.animateToPage(index,
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.linear);
                                _selectedItemPosition = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 3, vertical: 3),
                              padding: const EdgeInsets.all(5),
                              height:
                                  _selectedItemPosition == index ? 120.h : 80.h,
                              width:
                                  _selectedItemPosition == index ? 120.w : 80.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: _selectedItemPosition == index
                                      ? colors(context)
                                          .activeIconBackgroundColor
                                      : colors(context).circleColor),
                              child: Center(
                                  child: Text(
                                listTabBarDecisionItemName[index],
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: _selectedItemPosition == index
                                        ? AppFonts.maxFontSize.spMin
                                        : AppFonts.titleFontSize.spMin,
                                    color: _selectedItemPosition == index
                                        ? colors(context).textColor
                                        : colors(context).darkTextColor),
                              )),
                            )),
                      )),
                  Visibility(
                    visible: visible,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                controller.animateToPage(3,
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.linear);
                                _selectedTab = 3;
                              });
                            },
                            child: Container(
                              width: 213.w,
                              padding: EdgeInsets.symmetric(
                                  vertical: 12.h, horizontal: 16.w),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: _selectedTab == 3
                                        ? colors(context).topicsColor!
                                        : colors(context).dividerColor!,
                                    width: 4.0.w, // thickness of the underline
                                  ),
                                ),
                              ),
                              child: Text(
                                language.secret,
                                style: TextStyle(
                                  color: _selectedTab == 3
                                      ? colors(context).topicsColor
                                      : Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: AppFonts.subTitleFontSize.spMin,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                controller.animateToPage(4,
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.linear);
                                _selectedTab = 4;
                              });
                            },
                            child: Container(
                              width: 213.w,
                              padding: EdgeInsets.symmetric(
                                  vertical: 12.h, horizontal: 16.w),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: _selectedTab == 4
                                        ? colors(context).topicsColor!
                                        : colors(context).dividerColor!,
                                    width: 4.0.w, // thickness of the underline
                                  ),
                                ),
                              ),
                              child: Text(
                                language.normal,
                                style: TextStyle(
                                  color: _selectedTab == 4
                                      ? colors(context).topicsColor
                                      : Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: AppFonts.subTitleFontSize.spMin,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: SafeArea(
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: controller,
                      children: const <Widget>[
                        TabletNormalDecisionScreen(),
                        TabletNormalDecisionScreen(),
                        TabletNormalDecisionScreen(),
                        TabletNormalDecisionScreen(),
                        TabletNormalDecisionScreen(),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );

    }

    return buildTablet;
  }

  

}
