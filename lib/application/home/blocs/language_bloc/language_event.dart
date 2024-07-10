part of 'language_bloc.dart';

abstract class LanguageEvent {}

class LanguageChangeEvent extends LanguageEvent {
  final String language;

  LanguageChangeEvent({required this.language});
}
