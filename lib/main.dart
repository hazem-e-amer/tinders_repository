import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tinders/app_theme.dart';
import 'package:tinders/application/home/blocs/language_bloc/language_bloc.dart';
import 'package:tinders/routes/app_router.dart';
import 'package:tinders/routes/pages_name.dart';

import 'configure_di.dart';
import 'core/app_store/app_store.dart';
import 'core/local/app_localization.dart';
import 'core/local/language_data_model.dart';
import 'core/local/languages.dart';
import 'core/local/languages/language_en.dart';
import 'core/logic/global_bloc.dart';

BaseLanguage language = LanguageEn();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  await getIt<AppStore>().initial();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GlobalBloc(),
        ),
        BlocProvider(
          create: (context) => LanguageBloc(),
        ),
      ],
      child: BlocBuilder<GlobalBloc, GlobalState>(
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: Size(getIt<AppStore>().defaultWidth,
                getIt<AppStore>().defaultHeight),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp(
                builder: (context, child) {
                  return MediaQuery(
                    data: MediaQuery.of(context).copyWith(
                      alwaysUse24HourFormat: false,
                    ),
                    child: child!,
                  );
                },
                debugShowCheckedModeBanner: false,
                initialRoute: AppRouteName.splashScreen,
                onGenerateRoute: AppRoute.generateRoute,
                theme: getAppTheme(context, getIt<AppStore>().isDarkMode),
                localizationsDelegates: const [
                  AppLocalizations(),
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: LanguageDataModel.languageLocales(),
                localeResolutionCallback: (locale, supportedLocales) => locale,
                locale: Locale(getIt<AppStore>().selectedLanguageCode),
                home: child,
              );
            },
          );
        },
      ),
    );
  }
}
