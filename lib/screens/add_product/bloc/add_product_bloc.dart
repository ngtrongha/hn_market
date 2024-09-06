import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hn_market/objectbox.g.dart';
import 'package:hn_market/utils/gallary.dart';
import 'package:hn_market/utils/utils.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../../../app_router/app_router.dart';
import '../../../model/category_model/category_model.dart';
import '../../../model/product_model/product_model.dart';
import '../../../model/unit_model/unit_model.dart';
import '../add_product_popup.dart';

part 'add_product_event.dart';
part 'add_product_state.dart';
part 'add_product_bloc.freezed.dart';

class AddProductBloc extends Bloc<AddProductEvent, AddProductState> {
  final BuildContext context;
  final formKey = GlobalKey<FormState>();
  final ten_san_phamController = TextEditingController();
  final ghi_chuController = TextEditingController();
  final gia_nhapController = TextEditingController();
  final dung_tichController = TextEditingController();
  final so_luongController = TextEditingController();

  final int? uid;
  final String barcode;
  AddProductBloc(this.context, this.uid, this.barcode)
      : super(const AddProductState()) {
    on<ChooseImage>(chooseImage);
    // on<ScanBarcode>(scanBarcode);
    on<Create>(create);
    on<Started>(started);
    on<ChooseUnit>(chooseUnit);
    on<ChooseCategory>(chooseCategory);
    on<ChangeBool>(changeBool);
    on<ChangeString>(changeString);
    on<AddPrice>(addPrice);
    on<DeletePrice>(deletePrice);
  }

  deletePrice(DeletePrice event, Emitter<AddProductState> emit) async {
    try {
      emit(state.copyWith(
          price_list: state.price_list.toList()
            ..removeWhere((element) => element.uid == event.data.uid)));
    } catch (e) {
      e.printELog;
    }
  }

  addPrice(AddPrice event, Emitter<AddProductState> emit) async {
    try {
      await Utils.appRouter
          .pushNativeRoute(
              AddProductPopup.addPrice(state.list_unit, event.value))
          .then((value) {
        if (value != null) {
          emit(state.copyWith(
              price_list: state.price_list.toList()..add(value as PriceList)));
        }
      });
    } catch (e) {
      e.printELog;
    }
  }

  changeString(ChangeString event, Emitter<AddProductState> emit) async {
    switch (event.key) {
      //   } else {
      //     emit(state.copyWith(
      //         gia_nhap_moi_sp:
      //             tong_gia_nhap_formartter.getUnformattedValue().toDouble() /
      //                 double.parse(so_luong_nhap.text)));
      //   }
      //   break;
      // case 'tong_gia_nhap':
      //   if (so_luong_nhap.text.isEmpty || so_luong_nhap.text == '0') {
      //     emit(state.copyWith(gia_nhap_moi_sp: 0));
      //   } else {
      //     emit(state.copyWith(
      //         gia_nhap_moi_sp:
      //             tong_gia_nhap_formartter.getUnformattedValue().toDouble() /
      //                 double.parse(so_luong_nhap.text)));
      //   }
      //   break;
    }
  }

  changeBool(ChangeBool event, Emitter<AddProductState> emit) async {
    emit(state.copyWith(isImport: !state.isImport));
  }

  chooseUnit(ChooseUnit event, Emitter<AddProductState> emit) async {
    try {
      emit(state.copyWith(
          uid_don_vi: event.value.uid,
          ten_don_vi: event.value.ten_don_vi ?? '',
          ky_hieu_don_vi: event.value.ky_hieu ?? ''));
    } catch (e) {
      e.printELog;
    }
  }

  chooseCategory(ChooseCategory event, Emitter<AddProductState> emit) async {
    try {
      emit(state.copyWith(
          ten_danh_muc: event.value.ten_danh_muc ?? '',
          uid_danh_muc: event.value.uid));
    } catch (e) {
      e.printELog;
    }
  }

  started(Started event, Emitter<AddProductState> emit) async {
    try {
      EasyLoading.show();
      await Utils.objectBox.store
          .box<CategoryModel>()
          .getAllAsync()
          .then((value) {
        emit(state.copyWith(list_category: value));
      });
      await Utils.objectBox.store.box<UnitModel>().getAllAsync().then((value) {
        emit(state.copyWith(list_unit: value));
      });
      if (uid != null) {
        await Utils.objectBox.store
            .box<ProductModel>()
            .query(ProductModel_.uid.equals(uid!))
            .build()
            .findFirstAsync()
            .then((value) {
          ghi_chuController.text = value?.ghi_chu ?? '';
          ten_san_phamController.text = value?.ten_san_pham ?? '';
          gia_nhapController.text = value?.gia_nhap.toString() ?? '';
          dung_tichController.text = value?.dung_tich.toString() ?? '';
          so_luongController.text = value?.so_luong.toString() ?? '';
          emit(state.copyWith(
              hinh_san_pham: value?.hinh_san_pham,
              uid_danh_muc: value?.uid_danh_muc ?? 0,
              ten_danh_muc: value?.ten_danh_muc ?? '',
              uid_don_vi: value?.uid_don_vi ?? 0,
              ten_don_vi: value?.ten_don_vi ?? '',
              ky_hieu_don_vi: value?.ky_hieu_don_vi ?? '',
              price_list: value?.price_list ?? []));
        });
      }
    } catch (e) {
      e.printELog;
      EasyLoading.dismiss();
    } finally {
      EasyLoading.dismiss();
    }
  }

  create(Create event, Emitter<AddProductState> emit) async {
    try {
      if (!formKey.currentState!.validate()) {
        return;
      }
      if (ten_san_phamController.text.isEmpty) {
        TDToast.showText('Bạn chưa nhập tên SP', context: context);
        return;
      }
      if (state.price_list.isEmpty) {
        if (state.price_list.any((element) => element.gia_ban == 0)) {
          TDToast.showText('Bạn chưa nhập giá', context: context);
          return;
        }
        if (state.price_list.any((element) => element.so_luong == 0)) {
          TDToast.showText('Bạn chưa nhập số lượng', context: context);
          return;
        }
        TDToast.showText('Bạn chưa thêm giá', context: context);
        return;
      }
      EasyLoading.show();
      var data = ProductModel(
        uid: uid ?? 0,
        barcode: barcode,
        ten_san_pham: ten_san_phamController.text,
        hinh_san_pham: state.hinh_san_pham,
        uid_danh_muc: state.uid_danh_muc,
        ten_danh_muc: state.ten_danh_muc,
        uid_don_vi: state.uid_don_vi,
        ten_don_vi: state.ten_don_vi,
        ky_hieu_don_vi: state.ky_hieu_don_vi,
        ghi_chu: ghi_chuController.text,
        gia_nhap: double.tryParse(gia_nhapController.text) ?? 0,
        dung_tich: int.tryParse(dung_tichController.text) ?? 0,
        so_luong: int.tryParse(so_luongController.text) ?? 0,
        price_list: state.price_list,
      );
      Utils.objectBox.store
          .box<ProductModel>()
          .putAndGetAsync(data)
          .then((value) async {
        value.uid.printDLog;
        if (!context.mounted) return;
        TDToast.showSuccess('Thành công',
            direction: IconTextDirection.vertical, context: context);
        Utils.appRouter.maybePop();
      });
    } on Exception catch (e) {
      e.printELog;
      EasyLoading.dismiss();
    } finally {
      EasyLoading.dismiss();
    }
  }

  // scanBarcode(ScanBarcode event, Emitter<AddProductState> emit) async {
  //   try {
  //     await Utils.appRouter.push(QrScanRoute(
  //       onResult: (p0, controller) {
  //         if (p0.barcodes.firstOrNull?.rawValue != null) {
  //           emit(state.copyWith(
  //               barcode: p0.barcodes.firstOrNull?.rawValue ?? ''));
  //           Utils.appRouter.popUntil(
  //               (route) => route.settings.name == AddProductRoute.name);
  //         }
  //       },
  //     )).then((value) {});
  //   } catch (e) {
  //     e.printELog;
  //   } finally {}
  // }

  chooseImage(ChooseImage event, Emitter<AddProductState> emit) async {
    try {
      await Gallery(context)
          .camera(
        maxAssetsCount: 1,
        handleResult: (context, result) =>
            Utils.appRouter.maybePop(<AssetEntity>[result]),
      )
          .then((value) async {
        final file = (await value?.file);
        final path = file?.path;
        if (path != null) {
          if (!context.mounted) {
            return;
          }
          await Gallery(context).cropImage(path).then((value) {
            if (value != null) {
              emit(state.copyWith(hinh_san_pham: value));
            }
          });
        }
      });
    } catch (e) {
      e.printELog;
    } finally {}
  }
}
