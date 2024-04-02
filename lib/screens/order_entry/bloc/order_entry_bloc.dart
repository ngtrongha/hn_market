import 'package:bloc/bloc.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hn_market/model/customer_model/customer_model.dart';
import 'package:hn_market/model/order_model/order_model.dart';
import 'package:hn_market/utils/utils.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../../../app_router/app_router.dart';
import '../../../firestore/firestore.dart';
import '../../../utils/gallary.dart';
import '../../../utils/image_cached.dart';
import '../order_popup.dart';

part 'order_entry_event.dart';
part 'order_entry_state.dart';
part 'order_entry_bloc.freezed.dart';

class OrderEntryBloc extends Bloc<OrderEntryEvent, OrderEntryState> {
  final BuildContext context;
  final formKey = GlobalKey<FormState>();
  final ten_khach_hang = TextEditingController(text: 'Vãng lai');
  final sdt_khach_hang = TextEditingController();
  final khach_no = TextEditingController();
  final khach_no_formartter =
      CurrencyTextInputFormatter(symbol: 'đ', locale: 'vi');
  final ProductModel? product;
  OrderEntryBloc(this.context, this.product) : super(const OrderEntryState()) {
    on<Started>(started);
    on<RemoveProduct>(removeProduct);
    on<ChangeAmount>(changeAmount);
    on<ChooseImage>(chooseImage);
    on<AddProductByScan>(addProductByScan);
    on<AddProductByChoose>(addProductByChoose);
    on<Create>(create);
    on<GetTotal>(getTotal);
    on<ChangeBool>(changeBool);
    on<ChoosePrice>(choosePrice);
    on<ChooseCustomer>(chooseCustomer);
  }
  chooseCustomer(ChooseCustomer event, Emitter<OrderEntryState> emit) async {
    try {
      await MyFirestore().getCustomersCollection().get().then((value) async {
        final list = value.docs.map((e) => e.data()).toList();
        await Utils.appRouter
            .pushNativeRoute(OrderPopup.chooseCustomer(
                list,
                list.firstWhere(
                  (element) => element.uid == state.detail.uid_khach_hang,
                  orElse: () => const CustomerModel(),
                )))
            .then((value) {
          if (value != null) {
            final data = value as CustomerModel;
            emit(state.copyWith(
                detail: state.detail.copyWith(
              uid_khach_hang: data.uid,
              ten_khach_hang: data.ten_khach_hang,
              hinh_khach_hang: data.hinh_khach_hang,
            )));
          }
        });
      });
    } catch (e) {
      e.printELog;
      EasyLoading.dismiss();
    } finally {
      EasyLoading.dismiss();
    }
  }

  choosePrice(ChoosePrice event, Emitter<OrderEntryState> emit) async {
    try {
      emit(state.copyWith(
          detail: state.detail.copyWith(
              list_product: state.detail.list_product
                  .map((e) => e.uid_product == event.data.uid_product
                      ? e.copyWith(
                          gia_ban: event.value.gia_ban,
                          gia_ban_ky_hieu_don_vi: event.value.ky_hieu_don_vi,
                          gia_ban_ten_don_vi: event.value.ten_don_vi,
                          gia_ban_uid_don_vi: event.value.uid_don_vi,
                        )
                      : e)
                  .toList())));
    } catch (e) {
      e.printELog;
      EasyLoading.dismiss();
    } finally {
      EasyLoading.dismiss();
      add(const GetTotal());
    }
  }

  addProductByChoose(
      AddProductByChoose event, Emitter<OrderEntryState> emit) async {
    try {
      await Utils.appRouter
          .pushNativeRoute(OrderPopup.multiChooseProducts(
              state.list_product,
              state.list_product
                  .where((a) => state.detail.list_product
                      .any((b) => a.uid == b.uid_product))
                  .toList()))
          .then((value) {
        if (value != null) {
          emit(state.copyWith(
              detail: state.detail.copyWith(
                  list_product: (value as List<ProductModel>)
                      .map((e) => ProductItem(
                            uid_product: e.uid,
                            barcode: e.barcode,
                            ten_san_pham: e.ten_san_pham,
                            hinh_san_pham: e.hinh_san_pham,
                            // gia_ban: product!.gia_ban,
                            so_luong: 1,
                          ))
                      .toList())));
        }
      });
    } catch (e) {
      e.printELog;
      EasyLoading.dismiss();
    } finally {
      EasyLoading.dismiss();
      add(const GetTotal());
    }
  }

  changeBool(ChangeBool event, Emitter<OrderEntryState> emit) async {
    emit(state.copyWith(isDebt: !state.isDebt));
  }

  getTotal(GetTotal event, Emitter<OrderEntryState> emit) async {
    final total = state.detail.list_product.fold(
        0.0,
        (previousValue, element) =>
            previousValue + element.gia_ban * element.so_luong);
    emit(state.copyWith(detail: state.detail.copyWith(tong_gia: total)));
  }

  create(Create event, Emitter<OrderEntryState> emit) async {
    try {
      if (state.isDebt) {
        if (state.detail.uid_khach_hang.isEmpty) {
          TDToast.showText('Chưa chọn khách hàng', context: context);
          return;
        }
      }
      if (state.detail.list_product.isEmpty) {
        TDToast.showText('Chưa chọn sản phẩm', context: context);
        return;
      }
      EasyLoading.show();
      var data = state.detail.copyWith(
          thoi_gian_mua: DateTime.now(),
          khach_no: state.isDebt,
          tong_tien_no: state.isDebt
              ? khach_no_formartter.getUnformattedValue() > 0
                  ? khach_no_formartter.getUnformattedValue().toDouble()
                  : state.detail.tong_gia
              : 0,
          ten_khach_hang: ten_khach_hang.text,
          sdt_khach_hang: sdt_khach_hang.text);
      if (state.image != null) {
        final storageRef = FirebaseStorage.instance.ref();
        final mountainsRef = storageRef.child(
            '${MyFirestore.customers}/${'${ten_khach_hang.text.noAccentVietnamese()}-${DateTime.now().toIso8601String()}'}.png');
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
            .then((value) => data = data.copyWith(hinh_khach_hang: value));
      }
      final ordersStogare = MyFirestore().getOrdersCollection();
      await ordersStogare.add(data).then((value) async {
        await value.update({'uid': value.id}).then(
            (value) => Utils.appRouter.maybePop());
      });
    } catch (e) {
      e.printELog;
      EasyLoading.dismiss();
    } finally {
      EasyLoading.dismiss();
    }
  }

  addProductByScan(
      AddProductByScan event, Emitter<OrderEntryState> emit) async {
    try {
      await Utils.appRouter.push(QrScanRoute(
        onResult: (p0) async {
          final barcode = p0.barcodes.first.rawValue;
          EasyLoading.show();
          await MyFirestore()
              .getProductsCollection()
              .where('barcode', isEqualTo: barcode)
              .get()
              .then((value) {
            final data = value.docs.firstOrNull?.data();
            if (barcode == null || data == null) {
              TDToast.showWarning('Sản phẩm không có trong kho',
                  direction: IconTextDirection.vertical, context: context);
              Utils.appRouter.maybePop();
              return;
            }
            if (state.detail.list_product
                .any((element) => element.uid_product == data.uid)) {
              emit(state.copyWith(
                  detail: state.detail.copyWith(
                      list_product: state.detail.list_product
                          .map((e) => e.uid_product == data.uid
                              ? e.copyWith(so_luong: e.so_luong + 1)
                              : e)
                          .toList())));
            } else {
              emit(state.copyWith(
                  detail: state.detail.copyWith(
                      list_product: state.detail.list_product.toList()
                        ..add(ProductItem(
                          uid_product: data.uid,
                          barcode: data.barcode,
                          ten_san_pham: data.ten_san_pham,
                          hinh_san_pham: data.hinh_san_pham,
                          // gia_ban: data.gia_ban,
                          so_luong: 1,
                        )))));
            }
            Utils.appRouter.maybePop();
          });
        },
      ));
    } catch (e) {
      e.printELog;
      EasyLoading.dismiss();
    } finally {
      EasyLoading.dismiss();
      add(const GetTotal());
    }
  }

  chooseImage(ChooseImage event, Emitter<OrderEntryState> emit) async {
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
      EasyLoading.dismiss();
    } finally {
      EasyLoading.dismiss();
    }
  }

  changeAmount(ChangeAmount event, Emitter<OrderEntryState> emit) async {
    try {
      if (event.value < 0 && event.data.so_luong == 1) {
        add(RemoveProduct(event.data));
      } else {
        emit(state.copyWith(
            detail: state.detail.copyWith(
                list_product: state.detail.list_product
                    .map((e) => e.uid_product == event.data.uid_product
                        ? e.copyWith(so_luong: e.so_luong + event.value)
                        : e)
                    .toList())));
      }
    } catch (e) {
      e.printELog;
    } finally {
      add(const GetTotal());
    }
  }

  removeProduct(RemoveProduct event, Emitter<OrderEntryState> emit) async {
    try {
      await showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title:
              'Bạn muốn xoá sản phẩm này?'.size14.w500.marginOnly(bottom: 10),
          content: ListTile(
            leading: ImageCached(
              image: event.data.hinh_san_pham,
              width: 64.sp,
              height: 64.sp,
            ),
            title: Row(
              children: [
                Expanded(child: event.data.ten_san_pham.size14),
                10.sized,
                Utils.moneyFormat(event.data.gia_ban).size16
              ],
            ),
          ),
          actions: [
            'Xoá'
                .size13
                .color(Theme.of(context).primaryColor)
                .center
                .paddingAll(10)
                .onTap(
              () {
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
          emit(state.copyWith(
              detail: state.detail.copyWith(
                  list_product: state.detail.list_product.toList()
                    ..removeWhere((element) =>
                        element.uid_product == event.data.uid_product))));
        }
      });
    } catch (e) {
      e.printELog;
    } finally {
      add(const GetTotal());
    }
  }

  started(Started event, Emitter<OrderEntryState> emit) async {
    try {
      EasyLoading.show();
      if (product != null) {
        emit(state.copyWith(
            detail: state.detail.copyWith(
                list_product: state.detail.list_product.toList()
                  ..add(ProductItem(
                    uid_product: product!.uid,
                    barcode: product!.barcode,
                    ten_san_pham: product!.ten_san_pham,
                    hinh_san_pham: product!.hinh_san_pham,
                    // gia_ban: product!.gia_ban,
                    so_luong: 1,
                  )))));
      }
      await MyFirestore().getProductsCollection().get().then((value) async {
        emit(state.copyWith(
            list_product: value.docs.map((e) => e.data()).toList()));
      });
    } catch (e) {
      e.printELog;
      EasyLoading.dismiss();
    } finally {
      EasyLoading.dismiss();
      add(const GetTotal());
    }
  }
}
