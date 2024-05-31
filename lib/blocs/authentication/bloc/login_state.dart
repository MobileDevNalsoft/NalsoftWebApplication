part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState(
      {required FormzSubmissionStatus status,
      required Username username,
      required Password password,
      required bool isValid}) = _LoginState;

  factory LoginState.initial() {
    return const LoginState(
        status: FormzSubmissionStatus.initial,
        username: Username.pure(),
        password: Password.pure(),
        isValid: false);
  }
}
