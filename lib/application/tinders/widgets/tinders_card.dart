import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tinders/app_theme.dart';
import 'package:tinders/configure_di.dart';
import 'package:tinders/core/app_store/app_store.dart';
import 'package:tinders/core/values/values.dart';

DateTime time = DateTime(2024, DateTime.january);

class TindersWidget extends StatefulWidget {
  final String? title;
  final int? count;

  final void Function()? onTap;
  const TindersWidget({
    Key? key,
    this.title,
    this.count,
    this.onTap,
  }) : super(key: key);

  @override
  State<TindersWidget> createState() => _TindersWidgetState();
}

class _TindersWidgetState extends State<TindersWidget>
    with TickerProviderStateMixin {
  late AnimationController tindersCardController;
  late Animation<Offset> _tindersCardAnimation;
  @override
  void initState() {
    tindersCardController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _tindersCardAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.3),
      end: const Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: tindersCardController,
        curve: Curves.easeInOut,
      ),
    );
    tindersCardController.forward();
    super.initState();
  }

  @override
  void dispose() {
    tindersCardController.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
        child: SizedBox(
          height: 105.h,
          child: Stack(
            alignment: const Alignment(1, 1.8),
            children: [
              Container(
                height: 90.h,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: getIt<AppStore>().isDarkMode
                            ? Colors.black
                            : colors(context).blackColor!.withOpacity(0.3),
                        blurRadius: 5,
                        blurStyle: BlurStyle.normal,
                        offset: const Offset(0, 3)),
                  ],
                  color: colors(context).lightGreyColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.sp),
                  ),
                ),
                child: SlideTransition(
                  position: _tindersCardAnimation,
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0.sp),
                              child: Text(
                                widget.title ?? "",
                                style: TextStyle(
                                    fontSize: AppFonts.subTitleFontSize.spMin,
                                    color:
                                        colors(context).tindersCardTextColor),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 40.w),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                  time
                                      .toString()
                                      .substring(0, 10)
                                      .replaceAll('-', '/'),
                                  style: TextStyle(
                                      fontSize: AppFonts.dateFontSize.spMin,
                                      color: colors(context)
                                          .tindersCardTextColor)),
                              Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 5.w),
                                  child: SvgPicture.asset(
                                      'assets/icons/arraw.svg')),
                              Text(
                                time
                                    .toString()
                                    .substring(0, 10)
                                    .replaceAll('-', '/'),
                                style: TextStyle(
                                    fontSize: AppFonts.dateFontSize.spMin,
                                    color:
                                        colors(context).tindersCardTextColor),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 180.w),
                height: 50.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colors(context).activeIconBackgroundColor,
                ),
                child: Center(
                  child: Text(
                    widget.count != null ? '${widget.count}' : "",
                    style: TextStyle(
                        color: getIt<AppStore>().isDarkMode
                            ? const Color(0xFF141313)
                            : Colors.white,
                        fontSize: AppFonts.subTitleFontSize.spMin),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
