part of 'language_bloc.dart';

abstract class LanguageState {}

class LanguageInitialState extends LanguageState {
  final String language = 'English';
}

class LanguageLoadingState extends LanguageState {}

class LanguageLoadedState extends LanguageState {
  final String language;

  LanguageLoadedState({required this.language});
}
