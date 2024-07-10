import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'language_event.dart';

part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageInitialState()) {
    on<LanguageChangeEvent>((event, emit) {
      emit(LanguageLoadedState(language: event.language));
    });
  }
}
