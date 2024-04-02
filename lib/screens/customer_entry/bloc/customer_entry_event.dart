part of 'customer_entry_bloc.dart';

@freezed
class CustomerEntryEvent with _$CustomerEntryEvent {
  const factory CustomerEntryEvent.started() = Started;
  const factory CustomerEntryEvent.create() = Create;
  const factory CustomerEntryEvent.chooseImage() = ChooseImage;
}
