part of 'add_product_bloc.dart';

@freezed
class AddProductState with _$AddProductState {
  const factory AddProductState({
    @Default(false) final bool isImport,
    final Uint8List? hinh_san_pham,
    final CategoryModel? category,
    final UnitModel? unit,
    final SupplierModel? supplier,
    @Default([]) final List<PriceList> price_list,
    @Default([]) final List<CategoryModel> list_category,
    @Default([]) final List<UnitModel> list_unit,
    @Default([]) final List<SupplierModel> list_supplier,
  }) = _AddProductState;
}
