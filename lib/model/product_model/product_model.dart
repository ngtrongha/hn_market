import 'dart:typed_data';

import 'package:objectbox/objectbox.dart';

@Entity()
class ProductModel {
  @Id()
  int uid;
  String? barcode;
  String? ten_san_pham;
  @Property(type: PropertyType.byteVector)
  Uint8List? hinh_san_pham;
  int? uid_danh_muc;
  String? ten_danh_muc;
  int? uid_don_vi;
  String? ten_don_vi;
  String? ky_hieu_don_vi;
  String? ghi_chu;
  double gia_nhap;
  int dung_tich;
  int so_luong;

  final price_list = ToMany<PriceList>();
  ProductModel({
    this.uid = 0,
    this.barcode,
    this.ten_san_pham,
    this.hinh_san_pham,
    this.uid_danh_muc,
    this.ten_danh_muc,
    this.uid_don_vi,
    this.ten_don_vi,
    this.ky_hieu_don_vi,
    this.ghi_chu,
    this.gia_nhap = 0,
    this.dung_tich = 0,
    this.so_luong = 1,
  List<PriceList>  price_list = const [],
  }) {
    this.price_list.addAll(price_list);
  }
}

@Entity()
class PriceList {
  @Id()
  int uid;
  String? name;
  int? uid_don_vi;
  String? ten_don_vi;
  String? ky_hieu_don_vi;
  double gia_ban;
  int so_luong;
  PriceList(
      {this.uid = 0,
      this.name,
      this.uid_don_vi,
      this.ten_don_vi,
      this.ky_hieu_don_vi,
      this.gia_ban = 0,
      this.so_luong = 1});
}
