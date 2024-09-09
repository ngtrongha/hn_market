part of 'supplier_list_bloc.dart';

@freezed
class SupplierListState with _$SupplierListState {
  const factory SupplierListState({
    @Default('') final String search_text,
    @Default([]) final List<SupplierModel> list_value,
  }) = _SupplierListState;
}
