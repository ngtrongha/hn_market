part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(false) final bool isLogin,
  }) = _LoginState;
}
