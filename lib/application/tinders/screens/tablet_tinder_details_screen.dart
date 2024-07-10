import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tinders/app_theme.dart';
import 'package:tinders/application/tinders/widgets/icon_with_text_widget.dart';
import 'package:tinders/application/tinders/widgets/title_with_count_widget.dart';
import 'package:tinders/core/utils/functions.dart';
import 'package:tinders/core/values/values.dart';
import 'package:tinders/core/widgets/app_bar_widget.dart';

TextEditingController noteEditingController = TextEditingController();

class TabletTinderDetailsScreen extends StatelessWidget {
  final String text;

  const TabletTinderDetailsScreen({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: colors(context).blackColorwithOpacity,
        onPressed: () {
          noteDialog(context);
        },
        child: SvgPicture.asset('assets/icons/pen_icon.svg'),
      ),
      appBar: AppBarWidget(
        title: SizedBox(
          width: size.width / 1.8,
          child: Text(text,
              style: TextStyle(fontSize: AppFonts.subTitleFontSize.spMin)),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: GestureDetector(
              child: SvgPicture.asset(
                'assets/icons/menu_icon.svg',
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
      body: Column(
        children: [
          ///FIRST SECTION
          Expanded(
            flex: 2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.3))
                      ],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(40),
                      ),
                    ),
                    child: Column(
                      children: [
                        const Expanded(
                          child: IconWithTextWidget(
                            image: 'assets/icons/info_icon.svg',
                            text: 'Project Information',
                            withBackground: false,
                            isDrawer: false,
                          ),
                        ),
                        Expanded(
                          child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: colors(context).backgroundColor,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                              child: const Column(
                                children: [
                                  TitleWithTrailingWidget(
                                    isTablet: true,
                                    title: 'Project',
                                    trailing: "Changing the attendance system",
                                  ),
                                  TitleWithTrailingWidget(
                                    isTablet: true,
                                    title: 'Project type',
                                    trailing:
                                        "Variation order - technical tender",
                                  ),
                                  TitleWithTrailingWidget(
                                    isTablet: true,
                                    title: 'Requesting party',
                                    trailing: "Information Systems",
                                  ),
                                ],
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: const Row(
                            children: [
                              Expanded(
                                child: TitleWithCountWidget(
                                  isTablet: true,
                                  title: 'Insurance value',
                                  count: '65000',
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: TitleWithCountWidget(
                                  isTablet: true,
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
                            color: colors(context).backgroundColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          height: 150.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Provided companies',
                                      style: TextStyle(
                                          fontSize: AppFonts.minFontSize.spMin),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text("3 companies",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: AppFonts
                                                .subTitleFontSize.spMin)),
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
                                                        .subTitleFontSize
                                                        .spMin)),
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
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: IconWithTextWidget(
                            image: 'assets/icons/attachments_icon.svg',
                            isDrawer: false,
                            text: 'Attachments',
                            withBackground: false,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: GridView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: 30,
                          itemBuilder: (context, index) => Column(
                            children: [
                              Icon(
                                Icons.image,
                                color:
                                    colors(context).activeIconBackgroundColor!,
                                size: 50.spMin,
                              ),
                              Expanded(
                                child: SizedBox(
                                  width: 100.w,
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    'attachment name',
                                    style: TextStyle(
                                        fontSize: AppFonts.minFontSize),
                                  ),
                                ),
                              )
                            ],
                          ),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 3 / 2,
                            crossAxisCount: 3,
                            crossAxisSpacing: 1,
                            mainAxisSpacing: 5,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),

          ///SECOND SECTION
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                        const IconWithTextWidget(
                          image: 'assets/icons/decisions_black_icon.svg',
                          text: 'Decisions',
                          withBackground: false,
                          isDrawer: false,
                        ),
                        Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: colors(context).backgroundColor,
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
                ),
                const Spacer(),
                const Spacer(),
                const Spacer(),
              ],
            ),
          ),
        ],
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
                  backgroundColor: Colors.amber,
                  child: SizedBox(
                    height: 300,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 6,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 4,
                                child: SizedBox(
                                  height: 250,
                                  child: TextField(
                                    controller: noteEditingController,
                                    keyboardType: TextInputType.multiline,
                                    cursorColor: Colors.red,
                                    decoration: InputDecoration(
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: colors(context).kAppColor!),
                                      ),
                                      focusColor: colors(context).kAppColor,
                                      border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: colors(context).kAppColor!),
                                      ),
                                    ),
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
                                          color: colors(context).kAppColor,
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "ok",
                                        style: TextStyle(
                                          color: colors(context).kAppColor,
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
  final bool isTablet;

  const TitleWithTrailingWidget(
      {super.key, required this.title, this.trailing, this.isTablet = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: isTablet
                  ? AppFonts.subTitleFontSize.spMin
                  : AppFonts.minFontSize.spMin),
        )),
        Expanded(
            child: Text(
          trailing ?? "",
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: AppFonts.subTitleFontSize.spMin),
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
