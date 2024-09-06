part of 'add_product_bloc.dart';

@freezed
class AddProductState with _$AddProductState {
  const factory AddProductState({
    @Default(false) final bool isImport,
    final Uint8List? hinh_san_pham,
    final int? uid_danh_muc,
    @Default('') final String ten_danh_muc,
    final int? uid_don_vi,
    @Default('') final String ten_don_vi,
    @Default('') final String ky_hieu_don_vi,
    @Default([]) final List<PriceList> price_list,
    @Default([]) final List<CategoryModel> list_category,
    @Default([]) final List<UnitModel> list_unit, 
  }) = _AddProductState;
}
