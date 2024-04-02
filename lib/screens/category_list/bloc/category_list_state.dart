part of 'category_list_bloc.dart';

@freezed
class CategoryListState with _$CategoryListState {
  const factory CategoryListState({
    @Default('') final String search_text,
    @Default([]) final List<CategoryModel> list_value,
  }) = _CategoryListState;
}
