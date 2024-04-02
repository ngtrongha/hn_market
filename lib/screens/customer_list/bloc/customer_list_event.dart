part of 'customer_list_bloc.dart';

@freezed
class CustomerListEvent with _$CustomerListEvent {
  const factory CustomerListEvent.started() = Started;
  const factory CustomerListEvent.delete(final String uid) = Delete;
  const factory CustomerListEvent.onChangeString(final String value) =
      OnChangeString;
}
