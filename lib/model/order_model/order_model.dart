import 'dart:typed_data';

import 'package:objectbox/objectbox.dart';

import '../category_model/category_model.dart';
import '../customer_model/customer_model.dart';
import '../product_model/product_model.dart';
import '../supplier_model/supplier_model.dart';
import '../unit_model/unit_model.dart';

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
  final customer = ToOne<CustomerModel>();
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
      this.createDate,
      CustomerModel? customer}) {
    this.list_product.addAll(list_product);
    this.customer.target = customer;
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
  int so_luong;
  final supplier = ToOne<SupplierModel>();
  final category = ToOne<CategoryModel>();
  final unit = ToOne<UnitModel>();
  final price = ToOne<PriceList>();
  ProductItem({
    this.uid = 0,
    this.uid_product,
    this.barcode,
    this.ten_san_pham,
    this.hinh_san_pham,
    this.so_luong = 1,
    PriceList? price,
    SupplierModel? supplier,
    CategoryModel? category,
    UnitModel? unit,
  }) {
    this.price.target = price;
    this.supplier.target = supplier;
    this.category.target = category;
    this.unit.target = unit;
  }
}
