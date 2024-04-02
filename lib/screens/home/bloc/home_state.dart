part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) final bool isLogin,
    @Default(false) final bool isSearchProduct,
    @Default('') final String search_product_text,
    @Default([]) final List<ProductModel> list_product,
    @Default([]) final List<OrderModel> list_order,
  }) = _HomeState;
}
