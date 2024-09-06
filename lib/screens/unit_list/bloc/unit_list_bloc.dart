import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hn_market/utils/utils.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../../../model/unit_model/unit_model.dart';
import '../../../objectbox.g.dart';
import '../../../utils/custom_textfield.dart';

part 'unit_list_event.dart';
part 'unit_list_state.dart';
part 'unit_list_bloc.freezed.dart';

class UnitListBloc extends Bloc<UnitListEvent, UnitListState> {
  final refreshController = RefreshController();
  final searchController = TextEditingController();
  final BuildContext context;
  UnitListBloc(this.context) : super(const UnitListState()) {
    on<Started>(started);
    on<Create>(create);
    on<Delete>(delete);
    on<OnChangeString>(onChangeString);
  }
  onChangeString(OnChangeString event, Emitter<UnitListState> emit) async {
    emit(state.copyWith(search_text: event.value));
    add(const Started());
  }

  delete(Delete event, Emitter<UnitListState> emit) async {
    try {
      EasyLoading.show();
      await Utils.objectBox.store
          .box<UnitModel>()
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

  create(Create event, Emitter<UnitListState> emit) async {
    try {
      final formKey = GlobalKey<FormState>();
      final name = TextEditingController();
      final unit = TextEditingController();
      await showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: 'Thêm đơn vị'.size14.w500.marginOnly(bottom: 10),
          content: Form(
              key: formKey,
              child: Column(
                children: [
                  CustomTextField(
                    controller: name,
                    title: 'Tên đơn vị',
                    required: true,
                  ),
                  10.sized,
                  CustomTextField(
                    controller: unit,
                    title: 'Kí hiệu đơn vị',
                    required: true,
                  ),
                ],
              )),
          actions: [
            'Thêm'
                .size13
                .color(Theme.of(context).primaryColor)
                .center
                .paddingAll(10)
                .onTap(
              () {
                if (!formKey.currentState!.validate()) {
                  return;
                }
                Utils.appRouter.maybePop(true);
              },
            ),
            'Huỷ'.size13.color(Colors.red).center.paddingAll(10).onTap(
              () {
                Utils.appRouter.maybePop(false);
              },
            ),
          ],
        ),
      ).then((value) async {
        if (value != null && value) {
          EasyLoading.show();

          await Utils.objectBox.store
              .box<UnitModel>()
              .putAndGetAsync(
                  UnitModel(ten_don_vi: name.text, ky_hieu: unit.text))
              .then((value) async {
            if (!context.mounted) return;
            TDToast.showSuccess('Thêm thành công',
                direction: IconTextDirection.vertical, context: context);
            add(const Started());
          });
        }
      });
    } catch (e) {
      e.printELog;
      EasyLoading.dismiss();
    } finally {
      EasyLoading.dismiss();
    }
  }

  started(Started event, Emitter<UnitListState> emit) async {
    try {
      if (!refreshController.isRefresh) EasyLoading.show();
      await Utils.objectBox.store
          .box<UnitModel>()
          .query(UnitModel_.ten_don_vi.contains(state.search_text))
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
