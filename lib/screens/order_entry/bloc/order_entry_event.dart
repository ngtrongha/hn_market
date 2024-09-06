part of 'order_entry_bloc.dart';

@freezed
class OrderEntryEvent with _$OrderEntryEvent {
  const factory OrderEntryEvent.started() = Started;
  const factory OrderEntryEvent.changeBool(final String key) = ChangeBool;
  const factory OrderEntryEvent.addProductByScan() = AddProductByScan;
  const factory OrderEntryEvent.addProductByChoose() = AddProductByChoose;
  const factory OrderEntryEvent.removeProduct(final ProductItem data) =
      RemoveProduct;
  const factory OrderEntryEvent.changeAmount(
      final ProductItem data, final int value) = ChangeAmount;
  const factory OrderEntryEvent.choosePrice(
      final ProductItem data, final PriceList value) = ChoosePrice;
  const factory OrderEntryEvent.chooseImage() = ChooseImage;
  
  const factory OrderEntryEvent.changeString(
      final String key, final String value) = ChangeString;
  const factory OrderEntryEvent.create() = Create;
  const factory OrderEntryEvent.getTotal() = GetTotal;
  const factory OrderEntryEvent.chooseCustomer() = ChooseCustomer;
}
