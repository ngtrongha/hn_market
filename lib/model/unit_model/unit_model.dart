import 'package:freezed_annotation/freezed_annotation.dart';

part 'unit_model.freezed.dart';
part 'unit_model.g.dart';

@freezed
class UnitModel with _$UnitModel {
  const factory UnitModel({
    @Default('') final String uid, 
    @Default('') final String ten_don_vi,  
    @Default('') final String ky_hieu,  
  }) = _UnitModel;

  factory UnitModel.fromJson(Map<String, dynamic> json) =>
      _$UnitModelFromJson(json);
}
