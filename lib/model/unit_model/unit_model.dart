import 'package:objectbox/objectbox.dart';

@Entity()
class UnitModel {
  @Id()
  int uid;
  String? ten_don_vi;
  String? loai_don_vi;
  String? ky_hieu;
  @Property(type: PropertyType.date) // Store as int in milliseconds
  DateTime? createDate;
  UnitModel(
      {this.uid = 0,
      this.ten_don_vi,
      this.loai_don_vi,
      this.ky_hieu,
      this.createDate});
}
