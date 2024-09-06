import 'dart:typed_data';

import 'package:objectbox/objectbox.dart';

@Entity()
class CustomerModel {
  @Id()
  int uid;
  String? ten_khach_hang;
  @Property(type: PropertyType.byteVector)
  Uint8List? hinh_khach_hang;
  String? sdt_khach_hang;
  String? dia_chi;
  @Property(type: PropertyType.date) // Store as int in milliseconds
  DateTime? createDate;
  CustomerModel(
      {this.uid = 0,
      this.ten_khach_hang,
      this.hinh_khach_hang,
      this.sdt_khach_hang,
      this.dia_chi,
      this.createDate});
}
