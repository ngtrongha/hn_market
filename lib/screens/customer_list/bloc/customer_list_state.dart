part of 'customer_list_bloc.dart';

@freezed
class CustomerListState with _$CustomerListState {
  const factory CustomerListState({
    @Default([]) final List<CustomerModel> list_value,
    @Default('') final String search_text,
  }) = _CustomerListState;
}
