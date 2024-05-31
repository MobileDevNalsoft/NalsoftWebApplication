import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:formz/formz.dart';
import 'package:nalsoft_web_application/repos/authentication/auth_repo.dart';
import '../../../models/model.dart';
part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({AuthenticatonRepository? authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(LoginState.initial()) {
    on<_LoginSubmitted>(_onLoginSubmitted);
  }

  final AuthenticatonRepository? _authenticationRepository;

  Future _onLoginSubmitted(
      _LoginSubmitted event, Emitter<LoginState> emit) async {
    final username = Username.dirty(event.username);
    final password = Password.dirty(event.password);
    state.copyWith(
        username: username, isValid: Formz.validate([username, password]));
    state.copyWith(
        password: password, isValid: Formz.validate([username, password]));

    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      int statusCode;
      try {
        statusCode = await _authenticationRepository!.login(
            username: state.username.value, password: state.password.value);
        if (statusCode == 200) {
          emit(state.copyWith(status: FormzSubmissionStatus.success));
        } else {
          throw Error();
        }
      } catch (e) {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
  }
}
