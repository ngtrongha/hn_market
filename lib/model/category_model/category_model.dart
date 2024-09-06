import 'package:objectbox/objectbox.dart';

@Entity()
class CategoryModel {
  @Id()
  int uid;
  String? ten_danh_muc;
  String? loai_danh_muc;
  @Property(type: PropertyType.date) // Store as int in milliseconds
  DateTime? createDate;
  CategoryModel(
      {this.uid = 0, this.ten_danh_muc, this.loai_danh_muc, this.createDate});
}
