import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../configure_di.dart';
import '../../../core/app_store/app_store.dart';
import '../../../core/data/local_data/shared_pref.dart';
import '../../../core/logic/global_bloc.dart';
import '../../../core/utils/extensions/context_extensions.dart';
import '../../../core/values/constant.dart';
import '../../../core/values/values.dart';

class ThemeWidget extends StatefulWidget {
   ThemeWidget({super.key,required this.themeIcon});
  int index=1;
  String themeIcon;
  @override
  State<ThemeWidget> createState() => _ThemeWidgetState();
}

class _ThemeWidgetState extends State<ThemeWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
       widget.index = await getIntAsync(THEME_MODE_INDEX);
        if(widget.index == 1) {
         widget.index = 2;

        }
        else if(widget.index == 2) {
          widget.index = 1;

        }
      else  widget.index =1;

        await setValue(THEME_MODE_INDEX, widget.index);
        getIt<AppStore>().setDarkMode(widget.index);
        context.read<GlobalBloc>().add(ThemeChanged(getIt<AppStore>().isDarkMode));
      setState(() {});
        finish(context,true);
      },
      child: Image.asset(widget.themeIcon),
    );
  }
}
