part of 'customer_entry_bloc.dart';

@freezed
class CustomerEntryState with _$CustomerEntryState {
  const factory CustomerEntryState({
    @Default('') final String ten_khach_hang,
    final Uint8List? hinh_khach_hang,
    @Default('') final String sdt_khach_hang,
    final String? dia_chi,
    @Default([]) final List<OrderModel> list_order, 
  }) = _CustomerEntryState;
}
