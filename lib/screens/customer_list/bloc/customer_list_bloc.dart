import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hn_market/utils/utils.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../model/customer_model/customer_model.dart';

part 'customer_list_event.dart';
part 'customer_list_state.dart';
part 'customer_list_bloc.freezed.dart';

class CustomerListBloc extends Bloc<CustomerListEvent, CustomerListState> {
  final refreshController = RefreshController();
  final searchController = TextEditingController();
  final BuildContext context;
  List<CustomerModel> get getCustomers => state.list_value
      .where((element) =>
          element.ten_khach_hang
              ?.toLowerCase()
              .contains(state.search_text.toLowerCase()) ??
          false)
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
      await Utils.objectBox.store
          .box<CustomerModel>()
          .removeAsync(event.uid)
          .then((querySnapshot) {
        add(const Started());
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
      await Utils.objectBox.store
          .box<CustomerModel>()
          .getAllAsync()
          .then((value) {
        emit(state.copyWith(
          list_value: value,
        ));
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
}
