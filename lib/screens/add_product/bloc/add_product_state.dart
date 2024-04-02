part of 'add_product_bloc.dart';

@freezed
class AddProductState with _$AddProductState {
  const factory AddProductState({
    @Default(false) final bool isImport,
    @Default(0) final int ton_kho,
    @Default(0) final double gia_nhap_moi_sp,
    @Default('') final String barcode,
    @Default('') final String imageUrl,
    @Default(CategoryModel()) final CategoryModel category,
    @Default(UnitModel()) final UnitModel unit,
    @Default([]) final List<CategoryModel> list_category,
    @Default([]) final List<UnitModel> list_unit,
    @Default([]) final List<PriceList> list_price,
    final AssetEntity? image,
  }) = _AddProductState;
}
