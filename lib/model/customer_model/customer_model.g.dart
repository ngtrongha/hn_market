// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerModelImpl _$$CustomerModelImplFromJson(Map<String, dynamic> json) =>
    _$CustomerModelImpl(
      uid: json['uid'] as String? ?? '',
      ten_khach_hang: json['ten_khach_hang'] as String? ?? '',
      hinh_khach_hang: json['hinh_khach_hang'] as String? ?? '',
      sdt_khach_hang: json['sdt_khach_hang'] as String? ?? '',
      dia_chi: json['dia_chi'] as String? ?? '',
    );

Map<String, dynamic> _$$CustomerModelImplToJson(_$CustomerModelImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'ten_khach_hang': instance.ten_khach_hang,
      'hinh_khach_hang': instance.hinh_khach_hang,
      'sdt_khach_hang': instance.sdt_khach_hang,
      'dia_chi': instance.dia_chi,
    };
