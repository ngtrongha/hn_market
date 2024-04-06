import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hn_market/app_router/app_router.dart';
import 'package:hn_market/model/order_model/order_model.dart';
import 'package:hn_market/utils/utils.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../firestore/firestore.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final refreshController = RefreshController();
  final BuildContext context;
  double getDoanhThuNgay() {
    final now = DateTime.now();
    final date = DateTime(now.year, now.month, now.day);
    final list = state.list_order.where((element) {
      if (element.thoi_gian_mua == null) {
        return false;
      }
      final orderDate = DateTime(element.thoi_gian_mua!.year,
          element.thoi_gian_mua!.month, element.thoi_gian_mua!.day);

      return orderDate.compareTo(date) == 0;
    });
    if (list.isEmpty) {
      return 0;
    }
    return list.fold(
        0.0, (previousValue, element) => previousValue + element.tong_gia);
  }

  List<ProductModel> getListProducts() {
    return state.list_product
        .where((element) => element.ten_san_pham
            .toLowerCase()
            .noAccentVietnamese()
            .contains(state.search_product_text.toLowerCase()))
        .toList();
  }

  HomeBloc(this.context) : super(const HomeState()) {
    on<Started>(started);
    on<Scan>(scan);
    on<GetOrders>(getOrders);
    on<GetProducts>(getProducts);
    on<ChangeBool>(changeBool);
    on<ChangeString>(changeString);
  }
  changeString(ChangeString event, Emitter<HomeState> emit) async {
    switch (event.key) {
      case 'search_product_text':
        emit(state.copyWith(search_product_text: event.value));
        break;
    }
  }

  changeBool(ChangeBool event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isSearchProduct: !state.isSearchProduct));
  }

  scan(Scan event, Emitter<HomeState> emit) async {
    try {
      await Utils.appRouter.push(QrScanRoute(
        onResult: (p0) async {
          final barcode = p0.barcodes.first.rawValue;
          await MyFirestore()
              .getProductsCollection()
              .where('barcode', isEqualTo: barcode)
              .get()
              .then((value) async {
            if (barcode == null) {
              return;
            }
            if (value.docs.isEmpty) {
              await Utils.appRouter
                  .popAndPush(AddProductRoute(barcode: barcode))
                  .whenComplete(() => add(const Started()));
            } else { 
              Utils.appRouter
                  .popAndPush(
                      OrderEntryRoute(product: value.docs.firstOrNull?.data()))
                  .whenComplete(() => add(const Started()));
            }
          }).onError((error, stackTrace) {
            error?.toString().printELog;
          });
        },
      ));
    } catch (e) {
      e.printELog;
      EasyLoading.dismiss();
      refreshController.refreshFailed();
    } finally {
      EasyLoading.dismiss();
      refreshController.refreshCompleted();
    }
  }

  getProducts(GetProducts event, Emitter<HomeState> emit) async {
    try {
      if (!refreshController.isRefresh) EasyLoading.show();
      await MyFirestore()
          .getProductsCollection()
          .get()
          .then((QuerySnapshot<ProductModel> querySnapshot) {
        final list = <ProductModel>[];
        for (var doc in querySnapshot.docs) {
          list.add(doc.data());
        }
        emit(state.copyWith(list_product: list));
      });
    } catch (e) {
      e.printELog;
      EasyLoading.dismiss();
      refreshController.refreshFailed();
    } finally {
      EasyLoading.dismiss();
      refreshController.refreshCompleted();
    }
  }

  getOrders(GetOrders event, Emitter<HomeState> emit) async {
    try {
      await MyFirestore()
          .getOrdersCollection()
          .orderBy('thoi_gian_mua', descending: true)
          .get()
          .then((QuerySnapshot<OrderModel> querySnapshot) {
        final list = <OrderModel>[];
        for (var doc in querySnapshot.docs) {
          list.add(doc.data());
        }
        emit(state.copyWith(list_order: list));
      });
    } catch (e) {
      e.printELog;
      EasyLoading.dismiss();
    } finally {
      EasyLoading.dismiss();
    }
  }

  started(Started event, Emitter<HomeState> emit) async {
    try {
      if (!refreshController.isRefresh) EasyLoading.show();
      add(const GetProducts());
      add(const GetOrders());
    } catch (e) {
      e.printELog;
      EasyLoading.dismiss();
      refreshController.refreshFailed();
    } finally {
      EasyLoading.dismiss();
      refreshController.refreshCompleted();
    }
  }
}
