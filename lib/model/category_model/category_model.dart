import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    @Default('') final String uid, 
    @Default('') final String ten_danh_muc,  
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}
