import 'package:bloc/bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hn_market/model/customer_model/customer_model.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../../../firestore/firestore.dart';
import '../../../utils/gallary.dart';
import '../../../utils/utils.dart';

part 'customer_entry_event.dart';
part 'customer_entry_state.dart';
part 'customer_entry_bloc.freezed.dart';

class CustomerEntryBloc extends Bloc<CustomerEntryEvent, CustomerEntryState> {
  final ten_khach_hang = TextEditingController();
  final sdt = TextEditingController();
  final dai_chi = TextEditingController();
  final BuildContext context;
  CustomerEntryBloc(this.context) : super(const CustomerEntryState()) {
    on<ChooseImage>(chooseImage);
    on<Started>(started);
    on<Create>(create);
  }
  create(Create event, Emitter<CustomerEntryState> emit) async {
    try {
      if (ten_khach_hang.text.isEmpty) {
        TDToast.showText('Chưa nhập tên khách', context: context);
        return;
      }
      if (sdt.text.isEmpty) {
        TDToast.showText('Chưa nhập sdt khách', context: context);
        return;
      }
      EasyLoading.show();
      var data = state.detail.copyWith(
        ten_khach_hang: ten_khach_hang.text,
        sdt_khach_hang: sdt.text,
        dia_chi: dai_chi.text,
      );
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
      final stogare = MyFirestore().getCustomersCollection();
      await stogare.add(data).then((value) async {
        await value.update({'uid': value.id}).then((value) {
          TDToast.showSuccess('Thành công',
              direction: IconTextDirection.vertical, context: context);
          Utils.appRouter.maybePop();
        });
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
    try {} catch (e) {
      e.printELog;
    } finally {}
  }

  chooseImage(ChooseImage event, Emitter<CustomerEntryState> emit) async {
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
