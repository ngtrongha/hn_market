part of 'unit_list_bloc.dart';

@freezed
class UnitListEvent with _$UnitListEvent {
  const factory UnitListEvent.started() = Started;
  const factory UnitListEvent.create() = Create;
  const factory UnitListEvent.delete(final String uid) = Delete;
  const factory UnitListEvent.onChangeString(final String value) =
      OnChangeString;
}
