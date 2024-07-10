part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LogInEvent extends AuthEvent{
final UserModel user;
LogInEvent({required this.user});
}
class FingerPrintEvent extends AuthEvent {
  final UserModel user;
  FingerPrintEvent({
    required this.user,
  });
}
