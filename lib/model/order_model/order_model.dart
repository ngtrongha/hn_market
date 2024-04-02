import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@freezed
class OrderModel with _$OrderModel {
  const factory OrderModel({
    @Default('') final String uid,
    final DateTime? thoi_gian_mua,
    @Default('') final String uid_khach_hang,
    @Default('') final String ten_khach_hang,
    @Default('') final String hinh_khach_hang,
    @Default('') final String sdt_khach_hang,
    @Default(false) final bool khach_no,
    @Default(0) final double tong_tien_no,
    @Default(0) final double tong_gia,
    @Default([]) final List<ProductItem> list_product,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}

@freezed
class ProductItem with _$ProductItem {
  const factory ProductItem({
    @Default('') final String uid_product,
    @Default('') final String barcode,
    @Default('') final String ten_san_pham,
    @Default('') final String hinh_san_pham,
    @Default('') final String uid_don_vi,
    @Default('') final String ten_don_vi,
    @Default('') final String ky_hieu_don_vi,
    @Default('') final String gia_ban_uid_don_vi,
    @Default('') final String gia_ban_ten_don_vi,
    @Default('') final String gia_ban_ky_hieu_don_vi,
    @Default(0) final double gia_ban,
    @Default(0) final int so_luong,
  }) = _ProductItem;

  factory ProductItem.fromJson(Map<String, dynamic> json) =>
      _$ProductItemFromJson(json);
}
