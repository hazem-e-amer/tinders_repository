import 'package:flutter/widgets.dart';
import 'package:tinders/core/packages/swiper_package/swiper_controller.dart';
import 'package:tinders/core/packages/swiper_package/swiper_package._indecator.dart';
import 'package:tinders/core/packages/swiper_package/swiper_package.dart';

/// plugin to display swiper components
///
abstract class SwiperPlugin {
  const SwiperPlugin();

  Widget build(BuildContext context, SwiperPluginConfig config);
}

class SwiperPluginConfig {
  const SwiperPluginConfig({
    required this.scrollDirection,
    required this.controller,
    required this.activeIndex,
    required this.itemCount,
    this.axisDirection,
    this.indicatorLayout,
    this.outer,
    this.pageController,
    this.layout,
    this.loop = false,
  });

  final Axis scrollDirection;
  final AxisDirection? axisDirection;
  final SwiperController controller;
  final int activeIndex;
  final int itemCount;
  final PageIndicatorLayout? indicatorLayout;
  final bool loop;
  final bool? outer;
  final PageController? pageController;
  final SwiperLayout? layout;
}

class SwiperPluginView extends StatelessWidget {
  const SwiperPluginView({
    Key? key,
    required this.plugin,
    required this.config,
  }) : super(key: key);

  final SwiperPlugin plugin;
  final SwiperPluginConfig config;

  @override
  Widget build(BuildContext context) {
    return plugin.build(context, config);
  }
}
