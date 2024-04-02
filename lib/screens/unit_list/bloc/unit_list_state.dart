part of 'unit_list_bloc.dart';

@freezed
class UnitListState with _$UnitListState {
  const factory UnitListState({
    @Default('') final String search_text,
    @Default([]) final List<UnitModel> list_value,
  }) = _UnitListState;
}
