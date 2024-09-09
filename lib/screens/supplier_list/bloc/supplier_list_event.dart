part of 'supplier_list_bloc.dart';

@freezed
class SupplierListEvent with _$SupplierListEvent {
  const factory SupplierListEvent.started() = Started;
  const factory SupplierListEvent.create({final SupplierModel? value}) = Create;
  const factory SupplierListEvent.delete(final int uid) = Delete;
  const factory SupplierListEvent.onChangeString(final String value) =
      OnChangeString;
}
