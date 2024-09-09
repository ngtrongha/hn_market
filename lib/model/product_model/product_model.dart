import 'dart:typed_data';

import 'package:objectbox/objectbox.dart';

import '../category_model/category_model.dart';
import '../supplier_model/supplier_model.dart';
import '../unit_model/unit_model.dart';

@Entity()
class ProductModel {
  @Id()
  int uid;
  String? barcode;
  String? ten_san_pham;
  @Property(type: PropertyType.byteVector)
  Uint8List? hinh_san_pham;
  String? ghi_chu;
  double gia_nhap;
  int dung_tich;
  int so_luong;

  final supplier = ToOne<SupplierModel>();
  final category = ToOne<CategoryModel>();
  final unit = ToOne<UnitModel>();
  final price_list = ToMany<PriceList>();
  ProductModel({
    this.uid = 0,
    this.barcode,
    this.ten_san_pham,
    this.hinh_san_pham,
    this.ghi_chu,
    this.gia_nhap = 0,
    this.dung_tich = 0,
    this.so_luong = 1,
    List<PriceList> price_list = const [],
    SupplierModel? supplier,
    CategoryModel? category,
    UnitModel? unit,
  }) {
    this.price_list.addAll(price_list);
    this.supplier.target = supplier;
    this.category.target = category;
    this.unit.target = unit;
  }
}

@Entity()
class PriceList {
  @Id()
  int uid;
  String? name;
  double gia_ban;
  int so_luong;
  final unit = ToOne<UnitModel>();
  PriceList({
    this.uid = 0,
    this.name,
    this.gia_ban = 0,
    this.so_luong = 1,
    UnitModel? unit,
  }) {
    this.unit.target = unit;
  }
}
