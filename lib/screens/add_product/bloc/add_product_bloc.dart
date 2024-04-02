import 'package:bloc/bloc.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hn_market/firestore/firestore.dart';
import 'package:hn_market/utils/gallary.dart';
import 'package:hn_market/utils/utils.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';
import 'package:uuid/uuid.dart';

import '../../../app_router/app_router.dart';

part 'add_product_event.dart';
part 'add_product_state.dart';
part 'add_product_bloc.freezed.dart';

class AddProductBloc extends Bloc<AddProductEvent, AddProductState> {
  final BuildContext context;
  final ten_san_pham = TextEditingController(); 
  final tong_gia_nhap = TextEditingController();
  final dung_tich = TextEditingController();
  final so_luong_nhap = TextEditingController();
  final ghi_chu = TextEditingController(); 
  final tong_gia_nhap_formartter =
      CurrencyTextInputFormatter(symbol: 'đ', locale: 'vi');
  final formKey = GlobalKey<FormState>();
  final ProductModel? oldData;
  final String barcode;
  AddProductBloc(this.context, this.oldData, this.barcode)
      : super(const AddProductState()) {
    on<ChooseImage>(chooseImage);
    on<ScanBarcode>(scanBarcode);
    on<Create>(create);
    on<Started>(started);
    on<ChooseUnit>(chooseUnit);
    on<ChooseCategory>(chooseCategory);
    on<ChangeBool>(changeBool);
    on<ChangeString>(changeString);
    on<AddPrice>(addPrice);
    on<DeletePrice>(deletePrice);
    on<ChooseUnitPrice>(chooseUnitPrice);
    on<ChangePrice>(changePrice);
    on<ChangeSL>(changeSL);
  }
  changeSL(ChangeSL event, Emitter<AddProductState> emit) async {
    emit(state.copyWith(
        list_price: state.list_price
            .map((e) => e.uid == event.data.uid
                ? e.copyWith(
                    so_luong: event.value.toInt(),
                  )
                : e)
            .toList()));
  }

  changePrice(ChangePrice event, Emitter<AddProductState> emit) async {
    emit(state.copyWith(
        list_price: state.list_price
            .map((e) => e.uid == event.data.uid
                ? e.copyWith(
                    gia_ban: event.value,
                  )
                : e)
            .toList()));
  }

  chooseUnitPrice(ChooseUnitPrice event, Emitter<AddProductState> emit) async {
    emit(state.copyWith(
        list_price: state.list_price
            .map((e) => e.uid == event.data.uid
                ? e.copyWith(
                    uid_don_vi: event.value.uid,
                    ten_don_vi: event.value.ten_don_vi,
                    ky_hieu_don_vi: event.value.ky_hieu,
                  )
                : e)
            .toList()));
  }

  deletePrice(DeletePrice event, Emitter<AddProductState> emit) async {
    emit(state.copyWith(
        list_price: state.list_price.toList()
          ..removeWhere((element) => element.uid == event.data.uid)));
  }

  addPrice(AddPrice event, Emitter<AddProductState> emit) async {
    emit(state.copyWith(
        list_price: state.list_price.toList()
          ..add(PriceList(
            uid: const Uuid().v8(),
            uid_don_vi: state.unit.uid,
            ten_don_vi: state.unit.ten_don_vi,
            ky_hieu_don_vi: state.unit.ky_hieu,
            so_luong: 1,
          ))));
  }

  changeString(ChangeString event, Emitter<AddProductState> emit) async {
    switch (event.key) {
      case 'so_luong_nhap':
        if (so_luong_nhap.text.isEmpty || so_luong_nhap.text == '0') {
          emit(state.copyWith(gia_nhap_moi_sp: 0));
        } else {
          emit(state.copyWith(
              gia_nhap_moi_sp:
                  tong_gia_nhap_formartter.getUnformattedValue().toDouble() /
                      double.parse(so_luong_nhap.text)));
        }
        break;
      case 'tong_gia_nhap':
        if (so_luong_nhap.text.isEmpty || so_luong_nhap.text == '0') {
          emit(state.copyWith(gia_nhap_moi_sp: 0));
        } else {
          emit(state.copyWith(
              gia_nhap_moi_sp:
                  tong_gia_nhap_formartter.getUnformattedValue().toDouble() /
                      double.parse(so_luong_nhap.text)));
        }
        break;
    }
  }

  changeBool(ChangeBool event, Emitter<AddProductState> emit) async {
    emit(state.copyWith(isImport: !state.isImport));
  }

  chooseUnit(ChooseUnit event, Emitter<AddProductState> emit) async {
    emit(state.copyWith(unit: event.value));
  }

  chooseCategory(ChooseCategory event, Emitter<AddProductState> emit) async {
    emit(state.copyWith(category: event.value));
  }

  started(Started event, Emitter<AddProductState> emit) async {
    try {
      emit(state.copyWith(barcode: barcode));
      await MyFirestore()
          .getCategoryCollection()
          .get()
          .then((QuerySnapshot<CategoryModel> querySnapshot) {
        final list = <CategoryModel>[];
        for (var doc in querySnapshot.docs) {
          list.add(doc.data());
        }
        emit(state.copyWith(list_category: list, category: list.first));
      });
      await MyFirestore()
          .getUnitCollection()
          .get()
          .then((QuerySnapshot<UnitModel> querySnapshot) {
        final list = <UnitModel>[];
        for (var doc in querySnapshot.docs) {
          list.add(doc.data());
        }
        emit(state.copyWith(list_unit: list, unit: list.first));
      });
      if (oldData != null) {
        oldData!.toJson().printDLog;
        ten_san_pham.text = oldData!.ten_san_pham; 
        dung_tich.text = oldData!.dung_tich.toString();
        emit(state.copyWith(
          ton_kho: oldData!.so_luong,
          imageUrl: oldData!.hinh_san_pham,
          list_price: oldData!.price_list,
          category: CategoryModel(
              uid: oldData!.uid_danh_muc, ten_danh_muc: oldData!.ten_danh_muc),
          unit: UnitModel(
              uid: oldData!.uid_don_vi,
              ten_don_vi: oldData!.ten_don_vi,
              ky_hieu: oldData!.ky_hieu_don_vi),
        ));
      }
    } catch (e) {
      e.printELog;
    } finally {}
  }

  create(Create event, Emitter<AddProductState> emit) async {
    try {
      if (ten_san_pham.text.isEmpty) {
        TDToast.showText('Bạn chưa nhập tên SP', context: context);
        return;
      }
      if (dung_tich.text.isEmpty) {
        TDToast.showText('Bạn chưa nhập tên SP', context: context);
        return;
      }
      if (state.list_price.isEmpty) {
        if (state.list_price.any((element) => element.gia_ban == 0)) {
          TDToast.showText('Bạn chưa nhập giá', context: context);
          return;
        }
        if (state.list_price.any((element) => element.so_luong == 0)) {
          TDToast.showText('Bạn chưa nhập số lượng', context: context);
          return;
        }
        TDToast.showText('Bạn chưa thêm giá', context: context);
        return;
      }
      EasyLoading.show();
      var data = ProductModel(
          barcode: state.barcode,
          hinh_san_pham: state.imageUrl,
          ten_san_pham: ten_san_pham.text,
          uid_danh_muc: state.category.uid,
          ten_danh_muc: state.category.ten_danh_muc,
          uid_don_vi: state.unit.uid,
          ten_don_vi: state.unit.ten_don_vi,
          ky_hieu_don_vi: state.unit.ky_hieu, 
          so_luong: state.ton_kho + (int.tryParse(so_luong_nhap.text) ?? 0),
          gia_nhap: state.gia_nhap_moi_sp,
          price_list: state.list_price,
          dung_tich: int.tryParse(dung_tich.text) ?? 0);
      if (state.image != null) {
        final storageRef = FirebaseStorage.instance.ref();
        final mountainsRef = storageRef.child(
            '${MyFirestore.products}/${'${ten_san_pham.text.noAccentVietnamese()}-${DateTime.now().toIso8601String()}'}.png');
        await state.image!.originBytes.then((value) async {
          if (value != null) {
            var result = await FlutterImageCompress.compressWithList(
              value,
              minHeight: 1920,
              minWidth: 1080,
              quality: 60,
              format: CompressFormat.png,
            );
            await mountainsRef.putData(result);
          }
        });
        await mountainsRef
            .getDownloadURL()
            .then((value) => data = data.copyWith(hinh_san_pham: value));
      }
      final productsStogare = MyFirestore().getProductsCollection();
      if (oldData == null) {
        await productsStogare.add(data).then((value) async {
          await value.update({'uid': value.id}).then((value) {
            TDToast.showSuccess('Thành công',
                direction: IconTextDirection.vertical, context: context);
            Utils.appRouter.maybePop();
          });
        });
      } else {
        var uid = oldData?.uid ?? '';
        if (uid.isEmpty) {
          await productsStogare
              .where('barcode', isEqualTo: barcode)
              .get()
              .then((value) {
            uid = value.docs.first.id;
          });
        }
        await productsStogare
            .doc(uid)
            .update(data.copyWith(uid: uid, price_list: []).toJson()
              ..update('price_list',
                  (price) => data.price_list.toList().map((e) => e.toJson())))
            .then((value) {
          TDToast.showSuccess('Thành công',
              direction: IconTextDirection.vertical, context: context);
          Utils.appRouter.maybePop();
        });
      }
    } on Exception catch (e) {
      e.printELog;
      EasyLoading.dismiss();
    } finally {
      EasyLoading.dismiss();
    }
  }

  scanBarcode(ScanBarcode event, Emitter<AddProductState> emit) async {
    try {
      await Utils.appRouter.push(QrScanRoute(
        onResult: (p0) {
          emit(state.copyWith(barcode: p0.barcodes.first.rawValue ?? ''));
          Utils.appRouter.maybePop();
        },
      ));
    } catch (e) {
      e.printELog;
    } finally {}
  }

  chooseImage(ChooseImage event, Emitter<AddProductState> emit) async {
    try {
      await Gallery(context)
          .camera(
        maxAssetsCount: 1,
        handleResult: (context, result) =>
            Utils.appRouter.maybePop(<AssetEntity>[result]),
      )
          .then((value) {
        if (value != null) {
          emit(state.copyWith(image: value));
        }
      });
    } catch (e) {
      e.printELog;
    } finally {}
  }
}
