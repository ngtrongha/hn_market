part of 'customer_entry_bloc.dart';

@freezed
class CustomerEntryState with _$CustomerEntryState {
  const factory CustomerEntryState({
    @Default(CustomerModel()) final CustomerModel detail,
    final AssetEntity? image,
  }) = _CustomerEntryState;
}
