import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    @Default('') final String uid,
    @Default('') final String barcode,
    @Default('') final String ten_san_pham,
    @Default('') final String hinh_san_pham,
    @Default('') final String uid_danh_muc,
    @Default('') final String ten_danh_muc,
    @Default('') final String uid_don_vi,
    @Default('') final String ten_don_vi,
    @Default('') final String ky_hieu_don_vi,
    @Default('') final String ghi_chu,
    @Default(0) final double gia_nhap,
    @Default(0) final int dung_tich,
    @Default(0) final int so_luong,
    @Default([]) final List<PriceList> price_list,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

@freezed
class PriceList with _$PriceList {
  const factory PriceList({
    @Default('') final String uid,
    @Default('') final String uid_don_vi,
    @Default('') final String ten_don_vi,
    @Default('') final String ky_hieu_don_vi,
    @Default(0) final double gia_ban,
    @Default(0) final int so_luong,
  }) = _PriceList;

  factory PriceList.fromJson(Map<String, dynamic> json) =>
      _$PriceListFromJson(json);
}
