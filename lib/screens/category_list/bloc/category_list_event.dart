part of 'category_list_bloc.dart';

@freezed
class CategoryListEvent with _$CategoryListEvent {
  const factory CategoryListEvent.started() = Started;
  const factory CategoryListEvent.create() = Create;
  const factory CategoryListEvent.delete(final String uid) = Delete;
  const factory CategoryListEvent.onChangeString(final String value) =
      OnChangeString;
}
