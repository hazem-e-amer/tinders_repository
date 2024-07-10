import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tinders/core/layout/responsive_widget_builders.dart';
import 'package:tinders/core/values/values.dart';
import 'package:tinders/main.dart';
import 'package:tinders/routes/pages_name.dart';

import '../../../configure_di.dart';
import '../../../core/app_store/app_store.dart';
import '../repositories/auth_with_finger.dart';
import '../widgets/background_widget.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_field.dart';

class LogInPage extends StatelessWidget {
  LogInPage({super.key});

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late String passwordIcon;
  late String visibilityIconIcon;
  late String userIcon;
  late String fingerPrintIcon;

  @override
  Widget build(BuildContext context) {
    setImageAndIconsBasedOnTheme();
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
      return BackgroundWidget(
        isPortrait: true,
        child: Form(
            child: Column(
          children: [
            Expanded(
                flex: 3,
                child: CustomTextField(
                  keyboardType: TextInputType.text,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12),
                    child: SvgPicture.asset(
                      userIcon,
                      fit: BoxFit.contain,
                    ),
                  ),
                  hintText: language.username,
                  validator: (String? value) {},
                  controller: userNameController,
                  obscureText: false,
                )),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                flex: 3,
                child: CustomTextField(
                  keyboardType: TextInputType.text,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12),
                    child: SvgPicture.asset(
                      passwordIcon,
                      fit: BoxFit.contain,
                    ),
                  ),
                  hintText: language.password,
                  validator: (String? value) {},
                  controller: passwordController,
                  obscureText: false,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(12),
                    child: SvgPicture.asset(
                      visibilityIconIcon,
                      fit: BoxFit.contain,
                    ),
                  ),
                )),
            //   const SizedBox(height: 10,),
            const Spacer(),
            Expanded(
              flex: 2,
              child: CustomButton(
                text: language.logIn,
                onPressed: () {
                  Navigator.pushNamed(context, AppRouteName.homeScreen);
                },
              ),
            ),
            const Spacer(),
            Expanded(
              flex: 1,
              child: SizedBox(
                child: Text(
                  language.logInWithFingerSignature,
                  style: TextStyle(color: Color(0xffE29E21)),
                ),
              ),
            ),
            Spacer(),
            GestureDetector(
                onTap: () async {
                  if (await AuthFinger.authenticate() == true)
                    print('bbb');
                  else
                    print('llll');
                },
                child: Image.asset(
                  fingerPrintIcon,
                )),

            const SizedBox(
              height: 10,
            ),
          ],
        )),
      );
    }

    return buildMobile;
  }

  //TODO BUILD landscape MOBILE
  Widget Function(BuildContext) landscapeMobile() {
    Widget buildMobile(BuildContext context) {
      return BackgroundWidget(
        isPortrait: true,
        child: Form(
            child: Column(
          children: [
            Expanded(
                flex: 3,
                child: CustomTextField(
                  keyboardType: TextInputType.text,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12),
                    child: SvgPicture.asset(
                      userIcon,
                      fit: BoxFit.contain,
                    ),
                  ),
                  hintText: language.username,
                  validator: (String? value) {},
                  controller: userNameController,
                  obscureText: false,
                )),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                flex: 3,
                child: CustomTextField(
                  keyboardType: TextInputType.text,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12),
                    child: SvgPicture.asset(
                      passwordIcon,
                      fit: BoxFit.contain,
                    ),
                  ),
                  hintText: language.password,
                  validator: (String? value) {},
                  controller: passwordController,
                  obscureText: false,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(12),
                    child: SvgPicture.asset(
                      visibilityIconIcon,
                      fit: BoxFit.contain,
                    ),
                  ),
                )),
            //   const SizedBox(height: 10,),
            const Spacer(),
            Expanded(
              flex: 2,
              child: CustomButton(
                text: language.logIn,
                onPressed: () {
                  Navigator.pushNamed(context, AppRouteName.homeScreen);
                },
              ),
            ),
            const Spacer(),
            Expanded(
              flex: 1,
              child: SizedBox(
                child: Text(
                  language.logInWithFingerSignature,
                  style: TextStyle(color: Color(0xffE29E21)),
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
                onTap: () async {
                  if (await AuthFinger.authenticate() == true)
                    print('bbb');
                  else
                    print('llll');
                },
                child: Image.asset(fingerPrintIcon)),
            const SizedBox(
              height: 10,
            ),
          ],
        )),
      );
    }

    return buildMobile;
  }

  //TODO BUILD TABLET
  Widget Function(BuildContext) tablet() {
    Widget buildTablet(BuildContext context) {
      return BackgroundWidget(
        isPortrait: true,
        isTablet: true,
        child: Form(
            child: Column(
          children: [
            Expanded(
              flex: 3,
              child: CustomTextField(
                keyboardType: TextInputType.text,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset(
                    userIcon,
                    fit: BoxFit.contain,
                  ),
                ),
                hintText: language.username,
                validator: (String? value) {},
                controller: userNameController,
                obscureText: false,
              ),
            ),
            const Spacer(),
            Expanded(
              flex: 3,
              child: CustomTextField(
                keyboardType: TextInputType.text,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(passwordIcon),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(visibilityIconIcon),
                ),
                hintText: language.password,
                validator: (String? value) {},
                controller: passwordController,
                obscureText: false,
              ),
            ),
            const Spacer(),
            Expanded(
              flex: 3,
              child: CustomButton(
                text: language.logIn,
                onPressed: () {
                  Navigator.pushNamed(context, AppRouteName.homeScreen);
                },
              ),
            ),
            const Spacer(),
            Expanded(
              flex: 1,
              child: SizedBox(
                child: Text(
                  language.logInWithFingerSignature,
                  style: TextStyle(color: Color(0xffE29E21)),
                ),
              ),
            ),
            SizedBox(child: Image.asset(fingerPrintIcon)),
            const SizedBox(
              height: 5,
            ),
          ],
        )),
      );
    }

    return buildTablet;
  }

  setImageAndIconsBasedOnTheme() {
    if (getIt<AppStore>().isDarkMode) {
      passwordIcon = IconPath.darkpasswordIcon;
      visibilityIconIcon = IconPath.darkvisibilityIcon;
      userIcon = IconPath.darkUserIcon;
      fingerPrintIcon = ImagePath.darkFingerPrint;
    } else {
      passwordIcon = IconPath.passwordIcon;
      visibilityIconIcon = IconPath.visibilityIcon;
      userIcon = IconPath.userIcon;
      fingerPrintIcon = ImagePath.fingerPrint;
    }
  }
}
