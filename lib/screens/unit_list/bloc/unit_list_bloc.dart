import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hn_market/utils/utils.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../../../firestore/firestore.dart';
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
  }

  delete(Delete event, Emitter<UnitListState> emit) async {
    try {
      EasyLoading.show();
      await MyFirestore()
          .getUnitCollection()
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
                    leftLabel: 'Tên đơn vị',
                    required: true,
                  ),
                  10.sized,
                  CustomTextField(
                    controller: unit,
                    leftLabel: 'Kí hiệu đơn vị',
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
          final stogare = MyFirestore().getUnitCollection();
          await stogare
              .add(UnitModel(ten_don_vi: name.text, ky_hieu: unit.text))
              .then((value) async {
            TDToast.showSuccess('Thêm thành công',
                direction: IconTextDirection.vertical, context: context);
            await value.update({'uid': value.id});

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

      await MyFirestore()
          .getUnitCollection()
          .get()
          .then((QuerySnapshot<UnitModel> querySnapshot) {
        final list = <UnitModel>[];
        for (var doc in querySnapshot.docs) {
          list.add(doc.data());
        }
        emit(state.copyWith(list_value: list));
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
