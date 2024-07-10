part of 'auth_bloc.dart';

@immutable
 class AuthState {
  final UserModel? response;
  final String? message;
 final bool? isLoading;

  const AuthState({
    this.response,
    this.message,
    this.isLoading,
  });

  factory AuthState.initial() => const AuthState();

  AuthState copyWith({UserModel? response, String? message, bool? isLoading}) {
    return AuthState(
        isLoading: isLoading ?? this.isLoading,
        message: message ?? this.message,
        response: response);
  }
}
