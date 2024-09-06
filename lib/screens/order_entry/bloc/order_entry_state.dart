part of 'order_entry_bloc.dart';

@freezed
class OrderEntryState with _$OrderEntryState {
  const factory OrderEntryState({
    @Default(false) final bool isDebt,
    @Default(true) final bool isLoading,
    final DateTime? thoi_gian_mua,
    @Default(0) final int uid_khach_hang,
    @Default('') final String ten_khach_hang,
    final Uint8List? hinh_khach_hang,
    @Default('') final String sdt_khach_hang,
    @Default(false) final bool khach_no,
    @Default(0) final double tong_tien_no,
    @Default(0) final double tong_gia,
    final DateTime? createDate,
    @Default([]) final List<ProductItem> list_product,
    final AssetEntity? image,
  }) = _OrderEntryState;
}
