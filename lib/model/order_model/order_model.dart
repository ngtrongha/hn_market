import 'dart:typed_data';

import 'package:objectbox/objectbox.dart';

@Entity()
class OrderModel {
  @Id()
  int uid = 0;
  @Property(type: PropertyType.date) // Store as int in milliseconds
  DateTime? thoi_gian_mua;
  int? uid_khach_hang;
  String? ten_khach_hang;
  @Property(type: PropertyType.byteVector)
  Uint8List? hinh_khach_hang;
  String? sdt_khach_hang;
  bool khach_no;
  double tong_tien_no;
  double tong_gia;

  final list_product = ToMany<ProductItem>();
  @Property(type: PropertyType.date) // Store as int in milliseconds
  DateTime? createDate;
  OrderModel(
      {this.uid = 0,
      this.thoi_gian_mua,
      this.uid_khach_hang,
      this.ten_khach_hang,
      this.hinh_khach_hang,
      this.sdt_khach_hang,
      this.khach_no = false,
      this.tong_tien_no = 0,
      this.tong_gia = 0,
      List<ProductItem> list_product = const [],
      this.createDate}) {
    this.list_product.addAll(list_product);
  }
}

@Entity()
class ProductItem {
  @Id()
  int uid;
  int? uid_product;
  String? barcode;
  String? ten_san_pham;
  @Property(type: PropertyType.byteVector)
  Uint8List? hinh_san_pham;
  int? uid_don_vi;
  String? ten_don_vi;
  String? ten_loai;
  String? ky_hieu_don_vi;
  int? gia_ban_uid_don_vi;
  String? gia_ban_ten_don_vi;
  String? gia_ban_ky_hieu_don_vi;
  double gia_ban;
  int so_luong;
  ProductItem(
      {this.uid = 0,
      this.uid_product,
      this.barcode,
      this.ten_san_pham,
      this.hinh_san_pham,
      this.uid_don_vi,
      this.ten_don_vi,
      this.ten_loai,
      this.ky_hieu_don_vi,
      this.gia_ban_uid_don_vi,
      this.gia_ban_ten_don_vi,
      this.gia_ban_ky_hieu_don_vi,
      this.gia_ban = 0,
      this.so_luong = 1});
}
