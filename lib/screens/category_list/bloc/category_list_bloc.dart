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

part 'category_list_event.dart';
part 'category_list_state.dart';
part 'category_list_bloc.freezed.dart';

class CategoryListBloc extends Bloc<CategoryListEvent, CategoryListState> {
  final refreshController = RefreshController();
  final searchController = TextEditingController();
  final BuildContext context;
  CategoryListBloc(this.context) : super(const CategoryListState()) {
    on<Started>(started);
    on<Create>(create);
    on<Delete>(delete);
    on<OnChangeString>(onChangeString);
  }
  onChangeString(OnChangeString event, Emitter<CategoryListState> emit) async {
    emit(state.copyWith(search_text: event.value));
  }

  delete(Delete event, Emitter<CategoryListState> emit) async {
    try {
      EasyLoading.show();
      await MyFirestore()
          .getCategoryCollection()
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

  create(Create event, Emitter<CategoryListState> emit) async {
    try {
      final formKey = GlobalKey<FormState>();
      final controller = TextEditingController();
      await showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: 'Thêm danh mục'.size14.w500.marginOnly(bottom: 10),
          content: Form(
              key: formKey,
              child: CustomTextField(
                controller: controller,
                leftLabel: 'Tên danh mục',
                required: true,
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
          final stogare = MyFirestore().getCategoryCollection();
          await stogare
              .add(CategoryModel(ten_danh_muc: controller.text))
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

  started(Started event, Emitter<CategoryListState> emit) async {
    try {
      if (!refreshController.isRefresh) EasyLoading.show();

      await MyFirestore()
          .getCategoryCollection()
          .get()
          .then((QuerySnapshot<CategoryModel> querySnapshot) {
        final list = <CategoryModel>[];
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
