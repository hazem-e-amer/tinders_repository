import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tinders/app_theme.dart';
import 'package:tinders/configure_di.dart';
import 'package:tinders/core/app_store/app_store.dart';
import 'package:tinders/core/values/values.dart';

class FileWidget extends StatelessWidget {
  final String title;
  final String attachmentsCount;
  final String theDate;

  const FileWidget(
      {super.key,
      required this.title,
      required this.attachmentsCount,
      required this.theDate});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50.0.w, vertical: 60.h),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(getIt<AppStore>().isDarkMode
              ? 'assets/images/dark_file.png'
              : 'assets/images/file.png'),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: AppFonts.titleFontSize.spMin,
                  color: colors(context).textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Divider(
            thickness: 1.0,
            color: colors(context).dividerColor,
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    'Attachments:',
                    style: TextStyle(
                      fontSize: AppFonts.subTitleFontSize.spMin,
                      color: colors(context).textColor,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    attachmentsCount,
                    style: TextStyle(
                      fontSize: AppFonts.titleFontSize.spMin,
                      color: colors(context).textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1.0,
            color: colors(context).dividerColor,
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    'The date:',
                    style: TextStyle(
                      fontSize: AppFonts.subTitleFontSize.spMin,
                      color: colors(context).textColor,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    theDate,
                    style: TextStyle(
                      fontSize: AppFonts.subTitleFontSize.spMin,
                      color: colors(context).textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
