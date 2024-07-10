import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tinders/app_theme.dart';
import 'package:tinders/application/authentication/repositories/auth_repo.dart';

import '../../../configure_di.dart';
import '../../../core/data/local_data/shared_pref.dart';
import '../../../core/utils/common.dart';
import '../../../core/values/constant.dart';
import '../../../main.dart';
import '../models/User.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState.initial()) {
    on<AuthEvent>((event, emit) {});

    on<LogInEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true, response: null));
      await getIt<AuthRepo>().logInUseCase(user: event.user).then((value) {
        emit(state.copyWith(response: value, isLoading: false));
      }).catchError((e) {
        emit(state.copyWith(
            message: e.toString(), isLoading: false, response: null));
        toast('$e', bgColor: colors(context).kAppColor);
      });
    });

    on<FingerPrintEvent>((event, emit) {
      bool isUserExistBefore = false;

      String? phone = getStringAsync(PHONE_NUMBER_OR_USERNAME);
      String? pass = getStringAsync(PASSWORD);

      if (phone == '' || pass == '') {
        event.user.username = "";
        event.user.password = "";
      } else {
        isUserExistBefore = true;
        event.user.password = phone;
        event.user.password = pass;
      }
      if (isUserExistBefore) {
        add(LogInEvent(user: event.user));
      } else {
        toast(language.logIn, bgColor: Colors.blue, textColor: Colors.black);
      }
    });
  }
}
