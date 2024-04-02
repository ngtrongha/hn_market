part of 'main_bloc.dart';

@freezed
class MainEvent with _$MainEvent {
  const factory MainEvent.started() = Started;
  const factory MainEvent.changeLogin(final bool value) = ChangeLogin;
  const factory MainEvent.updateUser(final User? user) = UpdateUser;
}
