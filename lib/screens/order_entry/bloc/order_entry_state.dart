part of 'order_entry_bloc.dart';

@freezed
class OrderEntryState with _$OrderEntryState {
  const factory OrderEntryState({
    @Default(false) final bool isDebt,
    @Default(OrderModel()) final OrderModel detail,
    @Default([]) final List<ProductModel> list_product,
    final AssetEntity? image,
  }) = _OrderEntryState;
}
