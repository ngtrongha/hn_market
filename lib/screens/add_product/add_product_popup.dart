import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../../model/product_model/product_model.dart';
import '../../model/unit_model/unit_model.dart';
import '../../utils/custom_textfield.dart';
import '../../utils/utils.dart';

class AddProductPopup {
  static addPrice(final List<UnitModel> list_unit, [final PriceList? oldData]) {
    final chosses = oldData ?? PriceList();
    final formaterr = CurrencyTextInputFormatter.simpleCurrency(
        name: 'đ', locale: 'vi', decimalDigits: 0);
    final formKey = GlobalKey<FormState>();
    return TDSlidePopupRoute(
        slideTransitionFrom: SlideTransitionFrom.bottom,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return TDPopupBottomConfirmPanel(
                title: 'Thêm giá',
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
                            title: 'Tên loại hàng',
                            hintText: 'Nhập Tên loại hàng',
                            required: true,
                          ),
                          10.sized,
                          CustomTextField(
                            initialValue:
                                formaterr.formatDouble(chosses.gia_ban),
                            inputType: TextInputType.number,
                            onChanged: (p0) {
                              chosses.gia_ban =
                                  formaterr.getUnformattedValue().toDouble();
                            },
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  formaterr.getUnformattedValue() == 0) {
                                return 'Vui lòng nhập giá bán';
                              }
                              return null;
                            },
                            title: 'Giá bán',
                            hintText: 'Nhập giá bán',
                            required: true,
                            inputFormatters: [formaterr],
                          ),
                          10.sized,
                          CustomTextField(
                            initialValue: chosses.so_luong.toString(),
                            inputType: TextInputType.number,
                            onChanged: (p0) {
                              chosses.so_luong = int.tryParse(p0) ?? 0;
                            },
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  value == '0') {
                                return 'Vui lòng nhập số lượng';
                              }
                              return null;
                            },
                            title: 'Số lượng',
                            hintText: 'Nhập số lượng',
                            required: true,
                            suffixIconMaxWidth: 120.sp,
                            suffixIcon: CustomDropDownButton(
                                value: chosses.uid_don_vi,
                                hintText: 'Chọn đơn vị',
                                validator: (value) {
                                  if (value == null) {
                                    return 'Vui lòng chọn đơn vị';
                                  }
                                  return null;
                                },
                                onChanged: (p0) {
                                  final unit = list_unit.firstWhere(
                                      (element) => element.uid == p0);
                                  chosses.uid_don_vi = unit.uid;
                                  chosses.ten_don_vi = unit.ten_don_vi;
                                  chosses.ky_hieu_don_vi = unit.ky_hieu;
                                  setState(() {});
                                },
                                items: list_unit
                                    .map((e) => DropdownMenuItem(
                                        value: e.uid,
                                        child:
                                            (e.ten_don_vi ?? '').size14.w600))
                                    .toList()),
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
