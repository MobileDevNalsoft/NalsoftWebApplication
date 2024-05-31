part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.loginSumbitted(
      {required String username, required String password}) = _LoginSubmitted;

  const factory LoginEvent.logoutRequested() = _LogoutRequested;
}
