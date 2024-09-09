import 'package:flutter/material.dart';
import 'package:hn_market/model/supplier_model/supplier_model.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../../utils/custom_textfield.dart';
import '../../utils/utils.dart';

class SupplierListPopup {
  static addSupplier([final SupplierModel? oldData]) {
    final chosses = oldData ?? SupplierModel();

    final formKey = GlobalKey<FormState>();
    return TDSlidePopupRoute(
        slideTransitionFrom: SlideTransitionFrom.bottom,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return TDPopupBottomConfirmPanel(
                title: 'Thêm Nhà cung cấp',
                leftText: 'Hủy',
                leftClick: () {
                  Utils.appRouter.maybePop();
                },
                rightText: 'Xong',
                rightClick: () {
                  if (formKey.currentState!.validate()) {
                    Utils.appRouter.maybePop(chosses);
                  }
                },
                child: SizedBox(
                  height: ScreenUtil().screenHeight * 0.7,
                  width: ScreenUtil().screenWidth,
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          10.sized,
                          CustomTextField(
                            initialValue: chosses.name ?? '',
                            onChanged: (p0) {
                              chosses.name = p0;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Vui lòng nhập tên Nhà cung cấp';
                              }
                              return null;
                            },
                            title: 'Tên Nhà cung cấp',
                            hintText: 'Nhập Tên Nhà cung cấp',
                            required: true,
                          ),
                          10.sized,
                          CustomTextField(
                            initialValue: chosses.phone ?? '',
                            onChanged: (p0) {
                              chosses.phone = p0;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Vui lòng nhập số điện thoại';
                              }
                              return null;
                            },
                            inputType: TextInputType.phone,
                            title: 'Số điện thoại',
                            hintText: 'Nhập số điện thoại',
                            required: true,
                          ),
                          10.sized,
                          CustomTextField(
                            initialValue: chosses.address ?? '',
                            onChanged: (p0) {
                              chosses.address = p0;
                            },
                            title: 'Địa chỉ',
                            hintText: 'Nhập địa chỉ',
                          ),
                          10.sized,
                        ],
                      ).marginSymmetric(horizontal: 10),
                    ),
                  ),
                ));
          });
        });
  }
}
