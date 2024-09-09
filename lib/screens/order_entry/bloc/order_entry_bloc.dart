import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hn_market/model/customer_model/customer_model.dart';
import 'package:hn_market/model/order_model/order_model.dart';
import 'package:hn_market/utils/utils.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../../../app_router/app_router.dart';
import '../../../model/product_model/product_model.dart';
import '../../../objectbox.g.dart';
import '../../../utils/gallary.dart';
import '../../../utils/image_cached.dart';
import '../order_popup.dart';

part 'order_entry_event.dart';
part 'order_entry_state.dart';
part 'order_entry_bloc.freezed.dart';

class OrderEntryBloc extends Bloc<OrderEntryEvent, OrderEntryState> {
  final BuildContext context;
  final formKey = GlobalKey<FormState>();

  final khach_no_formartter = CurrencyTextInputFormatter.simpleCurrency(
      name: 'đ', locale: 'vi', decimalDigits: 0);
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
    on<ChangeString>(changeString);
  }

  changeString(ChangeString event, Emitter<OrderEntryState> emit) async {
    switch (event.key) {
      case 'ten_khach_hang':
        emit(state.copyWith(ten_khach_hang: event.value));
        break;
      case 'sdt_khach_hang':
        emit(state.copyWith(sdt_khach_hang: event.value));
        break;
    }
  }

  chooseCustomer(ChooseCustomer event, Emitter<OrderEntryState> emit) async {
    try {
      await Utils.objectBox.store
          .box<CustomerModel>()
          .getAllAsync()
          .then((values) async {
        await Utils.appRouter
            .pushNativeRoute(OrderPopup.chooseCustomer(
                values,
                values.firstWhere(
                  (element) => element.uid == state.uid_khach_hang,
                  orElse: () => CustomerModel(),
                )))
            .then((value) {
          if (value != null) {
            final data = value as CustomerModel;
            emit(state.copyWith(
              uid_khach_hang: data.uid,
              ten_khach_hang: data.ten_khach_hang ?? '',
              hinh_khach_hang: data.hinh_khach_hang,
            ));
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
      final index = state.list_product.indexWhere(
          (element) => element.uid_product == event.data.uid_product);
      state.list_product[index].price.target = event.value;
      emit(state.copyWith(list_product: state.list_product));
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
      await Utils.objectBox.store
          .box<ProductModel>()
          .getAllAsync()
          .then((value) async {
        await Utils.appRouter
            .pushNativeRoute(OrderPopup.multiChooseProducts(
          value,
        ))
            .then((value) {
          if (value != null) {
            final list = (value as List<ProductModel>);
            state.list_product.addAll(list.map((e) => ProductItem(
                  uid_product: e.uid,
                  barcode: e.barcode,
                  ten_san_pham: e.ten_san_pham,
                  hinh_san_pham: e.hinh_san_pham,
                  so_luong: 1,
                )));
            emit(state.copyWith(list_product: state.list_product));
          }
        });
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
    final total = state.list_product.fold(
        0.0,
        (previousValue, element) =>
            previousValue +
            (element.price.target?.gia_ban ?? 0) * element.so_luong);

    emit(state.copyWith(tong_gia: total));
  }

  create(Create event, Emitter<OrderEntryState> emit) async {
    try {
      if (state.isDebt) {
        if (state.ten_khach_hang.isEmpty) {
          TDToast.showText('Chưa chọn khách hàng', context: context);
          return;
        }
      }
      if (state.list_product.isEmpty) {
        TDToast.showText('Chưa chọn sản phẩm', context: context);
        return;
      }
      EasyLoading.show();
      final data = OrderModel(
        list_product: state.list_product,
        thoi_gian_mua: DateTime.now(),
        khach_no: state.isDebt,
        tong_tien_no: state.isDebt
            ? khach_no_formartter.getUnformattedValue() > 0
                ? khach_no_formartter.getUnformattedValue().toDouble()
                : state.tong_gia
            : 0,
        ten_khach_hang: state.ten_khach_hang,
        sdt_khach_hang: state.sdt_khach_hang,
        hinh_khach_hang: await state.image?.originBytes,
      );
      await Utils.objectBox.store
          .box<OrderModel>()
          .putAndGetAsync(data)
          .then((value) async {
        if (!context.mounted) return;
        TDToast.showSuccess('Thành công',
            direction: IconTextDirection.vertical, context: context);
        Utils.appRouter.maybePop();
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
        onResult: (p0, controller) async {
          final barcode = p0.barcodes.first.rawValue;
          if (barcode == null) {
            if (!context.mounted) return;
            TDToast.showWarning('Sản phẩm không có trong kho',
                direction: IconTextDirection.vertical, context: context);
            Utils.appRouter.maybePop();
            return;
          }
          EasyLoading.show();
          await Utils.objectBox.store
              .box<ProductModel>()
              .query(ProductModel_.barcode.equals(barcode))
              .build()
              .findAsync()
              .then((value) {
            final data = value.firstOrNull;
            if (data == null) {
              if (!context.mounted) return;
              TDToast.showWarning('Sản phẩm không có trong kho',
                  direction: IconTextDirection.vertical, context: context);
              Utils.appRouter.maybePop();
              return;
            }

            final index = state.list_product
                .indexWhere((element) => element.uid_product == data.uid);
            if (index != -1) {
              state.list_product[index].so_luong++;
              emit(state.copyWith(list_product: state.list_product));
            } else {
              state.list_product.toList().add(ProductItem(
                    uid_product: data.uid,
                    barcode: data.barcode,
                    ten_san_pham: data.ten_san_pham,
                    hinh_san_pham: data.hinh_san_pham,
                    so_luong: 1,
                  ));
              emit(state.copyWith(list_product: state.list_product));
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
          emit(state.copyWith(
            image: value,
          ));
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
        final index = state.list_product.indexWhere(
            (element) => element.uid_product == event.data.uid_product);
        state.list_product[index].so_luong = event.data.so_luong + event.value;

        emit(state.copyWith(list_product: state.list_product));
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
            leading: event.data.hinh_san_pham != null
                ? ImageMemory(
                    event.data.hinh_san_pham!,
                    width: 64.sp,
                    height: 64.sp,
                  )
                : Container(),
            title: Row(
              children: [
                Expanded(child: (event.data.ten_san_pham ?? '').size14),
                10.sized,
                Utils.moneyFormat(event.data.price.target?.gia_ban ?? 0).size16
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
          state.list_product
              .removeWhere((element) => element.uid == event.data.uid_product);
          emit(state.copyWith(list_product: state.list_product));
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
      if (product != null) {
        emit(state.copyWith(list_product: [
          ProductItem(
            uid_product: product!.uid,
            barcode: product!.barcode,
            ten_san_pham: product!.ten_san_pham,
            hinh_san_pham: product!.hinh_san_pham,
            price: product!.price_list.firstOrNull,
            so_luong: 1,
          ),
        ]));
      }
    } catch (e) {
      e.printELog;
      emit(state.copyWith(isLoading: false));
    } finally {
      emit(state.copyWith(isLoading: false));
      add(const GetTotal());
    }
  }
}
