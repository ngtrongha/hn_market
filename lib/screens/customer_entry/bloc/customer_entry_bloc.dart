import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hn_market/model/customer_model/customer_model.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../../../model/order_model/order_model.dart';
import '../../../objectbox.g.dart';
import '../../../utils/gallary.dart';
import '../../../utils/utils.dart';

part 'customer_entry_event.dart';
part 'customer_entry_state.dart';
part 'customer_entry_bloc.freezed.dart';

class CustomerEntryBloc extends Bloc<CustomerEntryEvent, CustomerEntryState> {
  // final ten_khach_hang = TextEditingController();
  // final sdt = TextEditingController();
  // final dai_chi = TextEditingController();
  final BuildContext context;
  final int? uid;
  CustomerEntryBloc(this.context, {this.uid})
      : super(const CustomerEntryState()) {
    on<ChooseImage>(chooseImage);
    on<Started>(started);
    on<Create>(create);
    on<ChangeString>(changeString);
  }
  changeString(ChangeString event, Emitter<CustomerEntryState> emit) async {
    switch (event.key) {
      case 'dia_chi':
        emit(state.copyWith(
          dia_chi: event.value,
        ));
        break;
      case 'ten_khach_hang':
        emit(state.copyWith(
          ten_khach_hang: event.value,
        ));
        break;
      case 'sdt_khach_hang':
        emit(state.copyWith(
          sdt_khach_hang: event.value,
        ));
    }
  }

  create(Create event, Emitter<CustomerEntryState> emit) async {
    try {
      if (state.ten_khach_hang.isEmpty) {
        TDToast.showText('Chưa nhập tên khách', context: context);
        return;
      }
      if (state.sdt_khach_hang.isEmpty) {
        TDToast.showText('Chưa nhập sdt khách', context: context);
        return;
      }
      EasyLoading.show();

      var data = CustomerModel(
        ten_khach_hang: state.ten_khach_hang,
        sdt_khach_hang: state.sdt_khach_hang,
        hinh_khach_hang: state.hinh_khach_hang,
        dia_chi: state.dia_chi,
        createDate: DateTime.now(),
      );

      await Utils.objectBox.store
          .box<CustomerModel>()
          .putAndGetAsync(data)
          .then((value) async {
        if (!context.mounted) return;
        TDToast.showSuccess('Thành công',
            direction: IconTextDirection.vertical, context: context);
        Utils.appRouter.maybePop();
      });
      // if (oldData == null) {

      // } else {
      //   var uid = oldData?.uid ?? '';
      //   if (uid.isEmpty) {
      //     await productsStogare
      //         .where('barcode', isEqualTo: barcode)
      //         .get()
      //         .then((value) {
      //       uid = value.docs.first.id;
      //     }).onError((error, stackTrace) => null);
      //   }
      //   await productsStogare
      //       .doc(uid)
      //       .update(data.copyWith(uid: uid).toJson())
      //       .then((value) {
      //     TDToast.showSuccess('Thành công',
      //         direction: IconTextDirection.vertical, context: context);
      //     Utils.appRouter.maybePop();
      //   });
      // }
    } catch (e) {
      e.printELog;
    } finally {}
  }

  started(Started event, Emitter<CustomerEntryState> emit) async {
    try {
      EasyLoading.show();
      if (uid != null) {
        await Utils.objectBox.store
            .box<OrderModel>()
            .query(OrderModel_.uid_khach_hang.equals(uid!))
            .build()
            .findAsync()
            .then((value) {
          emit(state.copyWith(
            list_order: value,
          ));
        });
        await Utils.objectBox.store
            .box<CustomerModel>()
            .getAsync(uid!)
            .then((value) {
          emit(state.copyWith(
            ten_khach_hang: value?.ten_khach_hang ?? '',
            sdt_khach_hang: value?.sdt_khach_hang ?? '',
            dia_chi: value?.dia_chi ?? '',
            hinh_khach_hang: value?.hinh_khach_hang,
          ));
        });
      }
    } catch (e) {
      e.printELog;
      EasyLoading.dismiss();
    } finally {
      EasyLoading.dismiss();
    }
  }

  chooseImage(ChooseImage event, Emitter<CustomerEntryState> emit) async {
    try {
      await Gallery(context)
          .camera(
        maxAssetsCount: 1,
        handleResult: (context, result) =>
            Utils.appRouter.maybePop(<AssetEntity>[result]),
      )
          .then((value) async {
        final path = (await value?.file)?.path;
        if (path != null) {
          if (!context.mounted) {
            return;
          }
          await Gallery(context).cropImage(path).then((value) {
            if (value != null) {
              emit(state.copyWith(hinh_khach_hang: value));
            }
          });
        }
      });
    } catch (e) {
      e.printELog;
    } finally {}
  }
}
