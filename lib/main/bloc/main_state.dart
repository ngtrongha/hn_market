part of 'main_bloc.dart';

@freezed
class MainState with _$MainState {
  const factory MainState({
    @Default(false) final bool isLogin,
    
    final User? user,
  }) = _MainState;
}
