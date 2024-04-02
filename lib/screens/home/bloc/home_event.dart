part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.started() = Started;
  const factory HomeEvent.changeBool(final String key) = ChangeBool;
  const factory HomeEvent.changeString(final String key, final String value) =
      ChangeString;
  const factory HomeEvent.getProducts() = GetProducts;
  const factory HomeEvent.getOrders() = GetOrders;
  const factory HomeEvent.scan() = Scan;
}
