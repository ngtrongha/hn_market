import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hn_market/utils/utils.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../../../model/category_model/category_model.dart';
import '../../../objectbox.g.dart';
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
      await Utils.objectBox.store
          .box<CategoryModel>()
          .removeAsync(event.uid)
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
                title: 'Tên danh mục',
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
          await Utils.objectBox.store
              .box<CategoryModel>()
              .putAndGetAsync(CategoryModel(ten_danh_muc: controller.text))
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

  started(Started event, Emitter<CategoryListState> emit) async {
    try {
      if (!refreshController.isRefresh) EasyLoading.show();
      await Utils.objectBox.store
          .box<CategoryModel>()
          .query(CategoryModel_.ten_danh_muc.contains(state.search_text))
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
