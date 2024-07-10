import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tinders/app_theme.dart';
import 'package:tinders/application/tinders/widgets/icon_with_text_widget.dart';
import 'package:tinders/application/tinders/widgets/title_with_count_widget.dart';
import 'package:tinders/configure_di.dart';
import 'package:tinders/core/app_store/app_store.dart';
import 'package:tinders/core/utils/functions.dart';
import 'package:tinders/core/values/values.dart';
import 'package:tinders/core/widgets/app_bar_widget.dart';

TextEditingController noteEditingController = TextEditingController();

class TindersDetailsScreen extends StatelessWidget {
  final String text;
  const TindersDetailsScreen({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: colors(context).blackColorwithOpacity,
        onPressed: () {
          noteDialog(context);
        },
        child: SvgPicture.asset(
          getIt<AppStore>().isDarkMode
              ? IconPath.penIconDark
              : IconPath.penIcon,
        ),
      ),
      appBar: AppBarWidget(
        title: SizedBox(
          width: size.width / 1.8,
          child: Text(
            text,
            style: TextStyle(
                fontSize: AppFonts.subTitleFontSize.spMin,
                color: getIt<AppStore>().isDarkMode
                    ? Colors.white
                    : const Color(0xFF202020)),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: GestureDetector(
              child: SvgPicture.asset(
                IconPath.menuIcon,
                colorFilter: ColorFilter.mode(
                    colors(context).titleColor!, BlendMode.srcIn),
              ),
              onTap: () {
                Functions.showModalBottomSheetFun(context);
              },
            ),
          ),
        ],
        backgroundColor: colors(context).backgroundColor,
      ),
      body: Container(
        color: getIt<AppStore>().isDarkMode ? Colors.black : Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: getIt<AppStore>().isDarkMode
                      ? const Color(0xFF141313)
                      : Colors.white,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10, color: Colors.black.withOpacity(0.3))
                  ],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
                    IconWithTextWidget(
                      image: getIt<AppStore>().isDarkMode
                          ? IconPath.infoIconDark
                          : IconPath.infoIcon,
                      text: 'Project Information',
                      withBackground: false,
                      isDrawer: false,
                    ),
                    Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: colors(context).lightGreyColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        height: 130.h,
                        child: const Column(
                          children: [
                            TitleWithTrailingWidget(
                              title: 'Project',
                              trailing: "Changing the attendance system",
                            ),
                            TitleWithTrailingWidget(
                              title: 'Project type',
                              trailing: "Variation order - technical tender",
                            ),
                            TitleWithTrailingWidget(
                              title: 'Requesting party',
                              trailing: "Information Systems",
                            ),
                          ],
                        )),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: const Row(
                        children: [
                          Expanded(
                            child: TitleWithCountWidget(
                              title: 'Insurance value',
                              count: '65000',
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TitleWithCountWidget(
                              title: 'Bid number',
                              count: '22',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: colors(context).lightGreyColor,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      height: 130.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  'Provided companies',
                                  style: TextStyle(
                                      fontSize: AppFonts.minFontSize.spMin,
                                      color: const Color(0xFF505050)),
                                ),
                              ),
                              Expanded(
                                child: Text("3 companies",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize:
                                            AppFonts.subTitleFontSize.spMin)),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Text(
                                        'Secretarial notes',
                                        style: TextStyle(
                                            color: const Color(0xFF505050),
                                            fontSize:
                                                AppFonts.minFontSize.spMin),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text("nothing",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: TextStyle(
                                                fontSize: AppFonts
                                                    .subTitleFontSize.spMin)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: IconWithTextWidget(
                        image: getIt<AppStore>().isDarkMode
                            ? IconPath.attachmentsIconDark
                            : IconPath.attachmentsIcon,
                        text: 'Attachments',
                        withBackground: false,
                        isDrawer: false,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 110.h,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 8,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 10),
                    itemBuilder: (context, index) => Column(
                      children: [
                        Icon(
                          Icons.image,
                          color: colors(context).activeIconBackgroundColor,
                          size: 50.spMin,
                        ),
                        Expanded(
                          child: SizedBox(
                            width: 100.w,
                            child: Text(
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              'attachment name',
                              style: TextStyle(fontSize: AppFonts.minFontSize),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: getIt<AppStore>().isDarkMode
                      ? const Color(0xFF141313)
                      : Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.3),
                    )
                  ],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
                    IconWithTextWidget(
                      image: getIt<AppStore>().isDarkMode
                          ? IconPath.decisionsBlackIconDark
                          : IconPath.decisionsBlackIcon,
                      text: 'Decisions',
                      withBackground: false,
                      isDrawer: false,
                    ),
                    Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: colors(context).lightGreyColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: const Column(
                          children: [
                            TitleWithTrailingWidget(
                              title: 'Topic title',
                              trailing: "Changing the attendance system",
                            ),
                            TitleWithTrailingWidget(
                              title: 'Date created',
                              trailing: "01/03/2024",
                            ),
                            TitleWithTrailingWidget(
                              title: 'Subject of decision',
                              trailing: "Changing the attendance system",
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  noteDialog(BuildContext context) {
    showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
          return Transform(
            transform: Matrix4.translationValues(0.0, curvedValue * -200, 0.0),
            child: Opacity(
                opacity: a1.value,
                child: Dialog(
                  insetAnimationDuration: const Duration(seconds: 3),
                  insetAnimationCurve: Curves.bounceInOut,
                  backgroundColor: getIt<AppStore>().isDarkMode
                      ? Colors.black
                      : const Color(0xFFFFFFFF),
                  child: SizedBox(
                    height: 300,
                    child: Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                      width: 20,
                                    ),
                                itemBuilder: (context, index) => Column(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            width: 2,
                                            color: getIt<AppStore>().isDarkMode
                                                ? Colors.white
                                                : colors(context).kAppColor,
                                          ),
                                        ),
                                        Container(
                                          width: 8,
                                          height: 8,
                                          decoration: BoxDecoration(
                                              color:
                                                  getIt<AppStore>().isDarkMode
                                                      ? Colors.white
                                                      : Colors.black,
                                              shape: BoxShape.circle),
                                        )
                                      ],
                                    ),
                                itemCount: 50),
                          ),
                        ),
                        // Expanded(
                        //   child: Container(
                        //     margin: const EdgeInsets.all(20),
                        //     color: Colors.brown,
                        //   ),
                        // ),
                        Expanded(
                          flex: 9,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 4,
                                child: SizedBox(
                                  height: 250,
                                  child: TextField(
                                    controller: noteEditingController,
                                    keyboardType: TextInputType.multiline,
                                    cursorColor: colors(context).kAppColor,
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5),
                                        focusedBorder:
                                            const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                        ),
                                        focusColor: colors(context).kAppColor,
                                        border: const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                        ),
                                        enabledBorder:
                                            const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color:
                                                        Colors.transparent))),
                                    maxLines: null,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "cancel",
                                        style: TextStyle(
                                          color: colors(context).textColor,
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "ok",
                                        style: TextStyle(
                                          color: colors(context).textColor,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          );
        },
        transitionDuration: const Duration(milliseconds: 400),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) => Container());
  }
}

class TitleWithTrailingWidget extends StatelessWidget {
  final String title;
  final String? trailing;
  const TitleWithTrailingWidget({
    super.key,
    required this.title,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: AppFonts.minFontSize, color: const Color(0xFF505050)),
        )),
        Expanded(
            child: Text(
          trailing ?? "",
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: AppFonts.subTitleFontSize),
        )),
      ],
    );
  }
}

class ListOfCardWidget extends StatelessWidget {
  const ListOfCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => const TitleWithTrailingWidget(
        title: '',
      ),
    );
  }
}
