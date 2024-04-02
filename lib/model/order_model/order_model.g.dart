// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderModelImpl _$$OrderModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderModelImpl(
      uid: json['uid'] as String? ?? '',
      thoi_gian_mua: json['thoi_gian_mua'] == null
          ? null
          : DateTime.parse(json['thoi_gian_mua'] as String),
      uid_khach_hang: json['uid_khach_hang'] as String? ?? '',
      ten_khach_hang: json['ten_khach_hang'] as String? ?? '',
      hinh_khach_hang: json['hinh_khach_hang'] as String? ?? '',
      sdt_khach_hang: json['sdt_khach_hang'] as String? ?? '',
      khach_no: json['khach_no'] as bool? ?? false,
      tong_tien_no: (json['tong_tien_no'] as num?)?.toDouble() ?? 0,
      tong_gia: (json['tong_gia'] as num?)?.toDouble() ?? 0,
      list_product: (json['list_product'] as List<dynamic>?)
              ?.map((e) => ProductItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$OrderModelImplToJson(_$OrderModelImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'thoi_gian_mua': instance.thoi_gian_mua?.toIso8601String(),
      'uid_khach_hang': instance.uid_khach_hang,
      'ten_khach_hang': instance.ten_khach_hang,
      'hinh_khach_hang': instance.hinh_khach_hang,
      'sdt_khach_hang': instance.sdt_khach_hang,
      'khach_no': instance.khach_no,
      'tong_tien_no': instance.tong_tien_no,
      'tong_gia': instance.tong_gia,
      'list_product': instance.list_product,
    };

_$ProductItemImpl _$$ProductItemImplFromJson(Map<String, dynamic> json) =>
    _$ProductItemImpl(
      uid_product: json['uid_product'] as String? ?? '',
      barcode: json['barcode'] as String? ?? '',
      ten_san_pham: json['ten_san_pham'] as String? ?? '',
      hinh_san_pham: json['hinh_san_pham'] as String? ?? '',
      uid_don_vi: json['uid_don_vi'] as String? ?? '',
      ten_don_vi: json['ten_don_vi'] as String? ?? '',
      ky_hieu_don_vi: json['ky_hieu_don_vi'] as String? ?? '',
      gia_ban_uid_don_vi: json['gia_ban_uid_don_vi'] as String? ?? '',
      gia_ban_ten_don_vi: json['gia_ban_ten_don_vi'] as String? ?? '',
      gia_ban_ky_hieu_don_vi: json['gia_ban_ky_hieu_don_vi'] as String? ?? '',
      gia_ban: (json['gia_ban'] as num?)?.toDouble() ?? 0,
      so_luong: json['so_luong'] as int? ?? 0,
    );

Map<String, dynamic> _$$ProductItemImplToJson(_$ProductItemImpl instance) =>
    <String, dynamic>{
      'uid_product': instance.uid_product,
      'barcode': instance.barcode,
      'ten_san_pham': instance.ten_san_pham,
      'hinh_san_pham': instance.hinh_san_pham,
      'uid_don_vi': instance.uid_don_vi,
      'ten_don_vi': instance.ten_don_vi,
      'ky_hieu_don_vi': instance.ky_hieu_don_vi,
      'gia_ban_uid_don_vi': instance.gia_ban_uid_don_vi,
      'gia_ban_ten_don_vi': instance.gia_ban_ten_don_vi,
      'gia_ban_ky_hieu_don_vi': instance.gia_ban_ky_hieu_don_vi,
      'gia_ban': instance.gia_ban,
      'so_luong': instance.so_luong,
    };
