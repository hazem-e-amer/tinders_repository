import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tinders/app_theme.dart';
import 'package:tinders/main.dart';

import 'normal_decision_screen.dart';

class DecisionScreen extends StatefulWidget {
  const DecisionScreen({super.key});

  @override
  _DecisionScreenState createState() => _DecisionScreenState();
}

class _DecisionScreenState extends State<DecisionScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
     Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 60.w),
              child: TabBar(
                controller: _tabController,
                indicatorColor: colors(context).topicsColor,
                dividerHeight: 1,
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: colors(context).dividerColor,
                labelColor: colors(context).topicsColor,
                unselectedLabelColor: colors(context).titleColor,
                tabs: [
                  // first tab [you can add an icon using the icon property]
                  Tab(
                    text: language.normal,
                  ),

                  // second tab [you can add an icon using the icon property]
                  Tab(
                    text: language.secret,
                  ),
                ],
              ),
            ),
            // tab bar view here
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  // first tab bar view widget
                  NormalDecisionScreen(),

                  // second tab bar view widget
                  NormalDecisionScreen(),
                ],
              ),
            ),
          ],
        ),
      );
  }
}
