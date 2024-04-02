import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hn_market/model/order_model/order_model.dart';
import 'package:hn_market/utils/utils.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../firestore/firestore.dart';
import '../../../model/customer_model/customer_model.dart';

part 'customer_list_event.dart';
part 'customer_list_state.dart';
part 'customer_list_bloc.freezed.dart';

class CustomerListBloc extends Bloc<CustomerListEvent, CustomerListState> {
  final refreshController = RefreshController();
  final searchController = TextEditingController();
  final BuildContext context;
  List<CustomerModel> get getCustomers => state.list_value
      .where((element) => element.ten_khach_hang
          .toLowerCase()
          .contains(state.search_text.toLowerCase()))
      .toList();
  CustomerListBloc(this.context) : super(const CustomerListState()) {
    on<Started>(started);
    on<Delete>(delete);
    on<OnChangeString>(onChangeString);
  }
  onChangeString(OnChangeString event, Emitter<CustomerListState> emit) async {
    emit(state.copyWith(search_text: event.value));
  }

  delete(Delete event, Emitter<CustomerListState> emit) async {
    try {
      EasyLoading.show();
      await MyFirestore()
          .getCustomersCollection()
          .doc(event.uid)
          .delete()
          .then((querySnapshot) {
        emit(state.copyWith(
            list_value: state.list_value.toList()
              ..removeWhere((element) => element.uid == event.uid)));
      });
    } catch (e) {
      e.printELog;
      EasyLoading.dismiss();
    } finally {
      EasyLoading.dismiss();
    }
  }

  started(Started event, Emitter<CustomerListState> emit) async {
    try {
      if (!refreshController.isRefresh) EasyLoading.show();
      await MyFirestore()
          .getCustomersCollection()
          .get()
          .then((QuerySnapshot<CustomerModel> querySnapshot) {
        final list = <CustomerModel>[];
        for (var doc in querySnapshot.docs) {
          list.add(doc.data());
        }
        emit(state.copyWith(list_value: list));
      });
      if (state.list_order.isEmpty) {
        await MyFirestore()
            .getOrdersCollection()
            .get()
            .then((QuerySnapshot<OrderModel> querySnapshot) {
          final list = <OrderModel>[];
          for (var doc in querySnapshot.docs) {
            list.add(doc.data());
          }
          emit(state.copyWith(list_order: list));
        });
      }
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
