// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductModelImpl _$$ProductModelImplFromJson(Map<String, dynamic> json) =>
    _$ProductModelImpl(
      uid: json['uid'] as String? ?? '',
      barcode: json['barcode'] as String? ?? '',
      ten_san_pham: json['ten_san_pham'] as String? ?? '',
      hinh_san_pham: json['hinh_san_pham'] as String? ?? '',
      uid_danh_muc: json['uid_danh_muc'] as String? ?? '',
      ten_danh_muc: json['ten_danh_muc'] as String? ?? '',
      uid_don_vi: json['uid_don_vi'] as String? ?? '',
      ten_don_vi: json['ten_don_vi'] as String? ?? '',
      ky_hieu_don_vi: json['ky_hieu_don_vi'] as String? ?? '',
      ghi_chu: json['ghi_chu'] as String? ?? '',
      gia_nhap: (json['gia_nhap'] as num?)?.toDouble() ?? 0,
      dung_tich: json['dung_tich'] as int? ?? 0,
      so_luong: json['so_luong'] as int? ?? 0,
      price_list: (json['price_list'] as List<dynamic>?)
              ?.map((e) => PriceList.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ProductModelImplToJson(_$ProductModelImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'barcode': instance.barcode,
      'ten_san_pham': instance.ten_san_pham,
      'hinh_san_pham': instance.hinh_san_pham,
      'uid_danh_muc': instance.uid_danh_muc,
      'ten_danh_muc': instance.ten_danh_muc,
      'uid_don_vi': instance.uid_don_vi,
      'ten_don_vi': instance.ten_don_vi,
      'ky_hieu_don_vi': instance.ky_hieu_don_vi,
      'ghi_chu': instance.ghi_chu,
      'gia_nhap': instance.gia_nhap,
      'dung_tich': instance.dung_tich,
      'so_luong': instance.so_luong,
      'price_list': instance.price_list,
    };

_$PriceListImpl _$$PriceListImplFromJson(Map<String, dynamic> json) =>
    _$PriceListImpl(
      uid: json['uid'] as String? ?? '',
      uid_don_vi: json['uid_don_vi'] as String? ?? '',
      ten_don_vi: json['ten_don_vi'] as String? ?? '',
      ky_hieu_don_vi: json['ky_hieu_don_vi'] as String? ?? '',
      gia_ban: (json['gia_ban'] as num?)?.toDouble() ?? 0,
      so_luong: json['so_luong'] as int? ?? 0,
    );

Map<String, dynamic> _$$PriceListImplToJson(_$PriceListImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'uid_don_vi': instance.uid_don_vi,
      'ten_don_vi': instance.ten_don_vi,
      'ky_hieu_don_vi': instance.ky_hieu_don_vi,
      'gia_ban': instance.gia_ban,
      'so_luong': instance.so_luong,
    };
