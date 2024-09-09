part of 'add_product_bloc.dart';

@freezed
class AddProductEvent with _$AddProductEvent {
  const factory AddProductEvent.started() = Started;
  const factory AddProductEvent.create() = Create;
  const factory AddProductEvent.chooseImage() = ChooseImage;
  const factory AddProductEvent.scanBarcode() = ScanBarcode;
  const factory AddProductEvent.addPrice({final PriceList? value}) = AddPrice;
  const factory AddProductEvent.deletePrice(final PriceList data) = DeletePrice;
  const factory AddProductEvent.chooseSupplier(final SupplierModel value) =
      ChooseSupplier;
  const factory AddProductEvent.changeBool(final String key) = ChangeBool;
  const factory AddProductEvent.changeString(
      final String key, final String value) = ChangeString;
  const factory AddProductEvent.chooseCategory(final CategoryModel value) =
      ChooseCategory;
  const factory AddProductEvent.chooseUnit(final UnitModel value) = ChooseUnit;
}
