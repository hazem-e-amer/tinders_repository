import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tinders/app_theme.dart';
import 'package:tinders/application/tinders/screens/tablet_tinder_details_screen.dart';
import 'package:tinders/application/tinders/screens/tinders_details_screen.dart';
import 'package:tinders/application/tinders/widgets/tinders_card.dart';

import '../../../core/layout/responsive_widget_builders.dart';
import '../widgets/tablet_tinder_card.dart';

class TindersTab extends StatefulWidget {
  const TindersTab({super.key});

  @override
  State<TindersTab> createState() => _TindersTabState();
}

class _TindersTabState extends State<TindersTab> with TickerProviderStateMixin {
  late AnimationController appBarHomeController;
  late Animation<double> _appBarHomeAnimation;
  @override
  void initState() {
    appBarHomeController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _appBarHomeAnimation = Tween<double>(begin: 5, end: 0.0).animate(
      CurvedAnimation(
        parent: appBarHomeController,
        curve: Curves.fastLinearToSlowEaseIn,
      ),
    );
    appBarHomeController.forward();
    super.initState();
  }

  @override
  void dispose() {
    appBarHomeController.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidgetBuilder.builder(
      mobile: mobile(),
      tablet: tablet(),
    );
  }

  Widget Function(BuildContext)? mobile() {
    Widget buildMobile(BuildContext context) {
      appBarHomeController.forward();

      return OrientationLayoutBuilder(
        portrait: portraitMobile(),
        landscape: portraitMobile(),
      );
    }

    return buildMobile;
  }

  Widget Function(BuildContext) portraitMobile() {
    Widget buildMobile(BuildContext context) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 40,
              child: TextField(
                decoration: InputDecoration(
                  focusColor: Colors.black,
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(color: Colors.black, width: 2)),
                  contentPadding: const EdgeInsets.all(5),
                  hintText: 'search',
                  isCollapsed: true,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  alignLabelWithHint: false,
                  prefixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: colors(context).textColor,
                    ),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/icons/filter_icon.svg',
                      color: colors(context).textColor,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                cursorColor: Colors.black,
                style: TextStyle(color: colors(context).textColor),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return AnimatedBuilder(
                  animation: _appBarHomeAnimation,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(
                          _appBarHomeAnimation.value *
                              MediaQuery.of(context).size.width,
                          0),
                      child: TindersWidget(
                        title: 'مناقصة صيانة اجهزة الكمبيوتر',
                        count: 55,
                        onTap: () =>
                            Navigator.of(context, rootNavigator: true).push(
                          MaterialPageRoute(
                            builder: (context) => const TindersDetailsScreen(
                                text: 'مناقصة صيانة اجهزة الكمبيوتر'),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              itemCount: 6,
            ),
          )
        ],
      );
    }

    return buildMobile;
  }

  //TODO BUILD TABLET
  Widget Function(BuildContext) tablet() {
    Widget buildTablet(BuildContext context) {
      return Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => AnimatedBuilder(
                animation: _appBarHomeAnimation,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(
                        _appBarHomeAnimation.value *
                            MediaQuery.of(context).size.width,
                        0),
                    child: TabletTinderWidget(
                        title: 'مناقصة صيانة اجهزة الكمبيوتر',
                        count: 55,
                        onTap: () =>
                            Navigator.of(context, rootNavigator: true).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const TabletTinderDetailsScreen(
                                        text: 'مناقصة صيانة اجهزة الكمبيوتر'),
                              ),
                            )

                        //  Navigator.push(

                        //   context,

                        // ),
                        ),
                  );
                },
              ),
              itemCount: 6,
            ),
          )
        ],
      );
    }

    return buildTablet;
  }
}
