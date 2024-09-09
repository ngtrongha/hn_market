import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../model/supplier_model/supplier_model.dart';
import '../../../objectbox.g.dart';
import '../../../utils/utils.dart';
import '../supplier_list_popup.dart';

part 'supplier_list_event.dart';
part 'supplier_list_state.dart';
part 'supplier_list_bloc.freezed.dart';

class SupplierListBloc extends Bloc<SupplierListEvent, SupplierListState> {
  final refreshController = RefreshController();
  final searchController = TextEditingController();
  final BuildContext context;
  SupplierListBloc(this.context) : super(const SupplierListState()) {
    on<Started>(started);
    on<Create>(create);
    on<Delete>(delete);
    on<OnChangeString>(onChangeString);
  }
  onChangeString(OnChangeString event, Emitter<SupplierListState> emit) async {
    emit(state.copyWith(search_text: event.value));
    add(const Started());
  }

  delete(Delete event, Emitter<SupplierListState> emit) async {
    try {
      EasyLoading.show();
      await Utils.objectBox.store
          .box<SupplierModel>()
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

  create(Create event, Emitter<SupplierListState> emit) async {
    try {
      try {
        await Utils.appRouter
            .pushNativeRoute(SupplierListPopup.addSupplier(event.value))
            .then((value) {
          final data = value as SupplierModel?;
          if (data != null) {
            Utils.objectBox.store
                .box<SupplierModel>()
                .putAsync(data)
                .then((value) {
              add(const Started());
            });
          }
        });
      } catch (e) {
        e.printELog;
      }
    } catch (e) {
      e.printELog;
      EasyLoading.dismiss();
    } finally {
      EasyLoading.dismiss();
    }
  }

  started(Started event, Emitter<SupplierListState> emit) async {
    try {
      if (!refreshController.isRefresh) EasyLoading.show();
      await Utils.objectBox.store
          .box<SupplierModel>()
          .query(SupplierModel_.name.contains(state.search_text))
          .build()
          .findAsync()
          .then((value) {
        emit(state.copyWith(list_value: value));
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
