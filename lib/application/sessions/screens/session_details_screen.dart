import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tinders/app_theme.dart';
import 'package:tinders/application/sessions/models/session_model.dart';
import 'package:tinders/application/sessions/widgets/button_widget.dart';
import 'package:tinders/application/sessions/widgets/file_widget.dart';
import 'package:tinders/core/values/values.dart';

import '../../../core/packages/swiper_package/swiper_package.dart';

final List<Widget> files = [
  const FileWidget(
    title: 'Buying new devices',
    attachmentsCount: '2',
    theDate: '12/1/2024',
  ),
  const FileWidget(
    title: 'Buying new devices',
    attachmentsCount: '2',
    theDate: '12/1/2024',
  ),
  const FileWidget(
    title: 'Buying new devices',
    attachmentsCount: '2',
    theDate: '12/1/2024',
  ),
  const FileWidget(
    title: 'Buying new devices',
    attachmentsCount: '2',
    theDate: '12/1/2024',
  ),
  const FileWidget(
    title: 'Buying new devices',
    attachmentsCount: '2',
    theDate: '12/1/2024',
  ),
];

class SessionDetailsScreen extends StatefulWidget {
  final SessionModel sessionModel;

  const SessionDetailsScreen({super.key, required this.sessionModel});

  @override
  State<SessionDetailsScreen> createState() => _SessionDetailsScreenState();
}

class _SessionDetailsScreenState extends State<SessionDetailsScreen> {
  bool autoplay = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
            decoration: BoxDecoration(
              color: colors(context).darkBlueColor,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF000000).withOpacity(0.25),
                  offset: const Offset(0.0, 11.0),
                  blurRadius: 25.0,
                  spreadRadius: 0.0,
                ),
                BoxShadow(
                  color: const Color(0xFF2B3C4E).withOpacity(0.1),
                  offset: const Offset(0.0, 4.0),
                  blurRadius: 4.5,
                  spreadRadius: 1.0,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    widget.sessionModel.sessionName ?? '',
                    style: TextStyle(
                      fontSize: AppFonts.subTitleFontSize.spMin,
                      color: colors(context).backgroundColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: colors(context).lightBlueColor ?? Colors.white,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            widget.sessionModel.number ?? '',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: AppFonts.subTitleFontSize.spMin,
                              color: colors(context).detailsTitleColor,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            widget.sessionModel.meetingDate ?? '',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: AppFonts.subTitleFontSize.spMin,
                              color: colors(context).detailsTitleColor,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            '3',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: AppFonts.subTitleFontSize.spMin,
                              color: colors(context).detailsTitleColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonWidget(onTap: () {}, data: 'Minutes of meeting'),
                SizedBox(
                  width: 10.w,
                ),
                ButtonWidget(onTap: () {}, data: 'Preparatory examination'),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 7,
          child: Container(
            child: Swiper(
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: files[index],
              ),
              itemCount: files.length,
              itemWidth: 327.0,
              itemHeight: 307.0,
              layout: SwiperLayout.STACK,
              scrollDirection: Axis.vertical,
              loop: false,
              autoplay: autoplay,
              autoplayDelay: 180,
              onIndexChanged: (index) {
                if (index == files.length - 1) {
                  setState(() {
                    autoplay = false;
                  });
                }
              },
            ),
          ),
        ),
        const Expanded(child: SizedBox())
      ],
    );
  }
}
