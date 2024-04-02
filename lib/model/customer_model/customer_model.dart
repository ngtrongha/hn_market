import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_model.freezed.dart';
part 'customer_model.g.dart';

@freezed
class CustomerModel with _$CustomerModel {
  const factory CustomerModel({
    @Default('') final String uid,
    @Default('') final String ten_khach_hang,
    @Default('') final String hinh_khach_hang,
    @Default('') final String sdt_khach_hang,
    @Default('') final String dia_chi,
  }) = _CustomerModel;

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);
}
