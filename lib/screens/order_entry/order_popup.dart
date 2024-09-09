import 'package:flutter/material.dart';
import 'package:hn_market/model/customer_model/customer_model.dart';
import 'package:hn_market/utils/custom_checkbox.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../../model/product_model/product_model.dart';
import '../../utils/empty_widget.dart';
import '../../utils/image_cached.dart';
import '../../utils/utils.dart';

class OrderPopup {
  static multiChooseProducts(final List<ProductModel> values,
      [final List<ProductModel>? oldData]) {
    final chosses = oldData ?? [];
    return TDSlidePopupRoute(
        slideTransitionFrom: SlideTransitionFrom.bottom,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return TDPopupBottomConfirmPanel(
              title: 'Chọn sản phẩm',
              leftText: 'Hủy',
              leftClick: () {
                Utils.appRouter.maybePop();
              },
              rightText: 'Chọn',
              rightClick: () {
                Utils.appRouter.maybePop(chosses);
              },
              child: values.isEmpty
                  ? const EmptyWidget().marginSymmetric(vertical: 40)
                  : SizedBox(
                      height: ScreenUtil().screenHeight * 0.7,
                      width: ScreenUtil().screenWidth,
                      child: SingleChildScrollView(
                        child: Column(
                          children: values.map((data) {
                            return Container(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  if (data.hinh_san_pham != null)
                                    ImageMemory(
                                      data.hinh_san_pham!,
                                      height: 64.sp,
                                      width: 64.sp,
                                    ),
                                  10.sized,
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      (data.ten_san_pham ?? '').size16,
                                      4.sized,
                                      Row(
                                        children: [
                                          'Loại:'.size12,
                                          5.sized,
                                          (data.category.target?.ten_danh_muc ?? '').size14
                                        ],
                                      )
                                    ],
                                  )),
                                  CustomCheckBox(
                                    value: chosses.any(
                                        (element) => element.uid == data.uid),
                                    onChanged: (p0) {
                                      setState(() {
                                        chosses.add(data);
                                      });
                                    },
                                  )
                                ],
                              ).onTap(() {
                                setState(() {
                                  chosses.add(data);
                                });
                              }),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
            );
          });
        });
  }

  static chooseCustomer(final List<CustomerModel> values,
      [final CustomerModel? old]) {
    CustomerModel? choose = old;
    return TDSlidePopupRoute(
        slideTransitionFrom: SlideTransitionFrom.bottom,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return TDPopupBottomConfirmPanel(
              title: 'Chọn sản phẩm',
              leftText: 'Hủy',
              leftClick: () {
                Utils.appRouter.maybePop();
              },
              rightText: 'Chọn',
              rightClick: () {
                Utils.appRouter.maybePop(choose);
              },
              child: values.isEmpty
                  ? const EmptyWidget().marginSymmetric(vertical: 40)
                  : SizedBox(
                      height: ScreenUtil().screenHeight * 0.7,
                      child: SingleChildScrollView(
                        child: Column(
                          children: values.map((data) {
                            return Container(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  if (data.hinh_khach_hang != null)
                                    ImageMemory(
                                      data.hinh_khach_hang!,
                                      height: 64.sp,
                                      width: 64.sp,
                                    ),
                                  10.sized,
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      (data.ten_khach_hang ?? '').size16,
                                      4.sized,
                                      Row(
                                        children: [
                                          'SDT:'.size12,
                                          5.sized,
                                          (data.sdt_khach_hang ?? '').size14
                                        ],
                                      )
                                    ],
                                  )),
                                  CustomCheckBox(
                                    value: choose == data,
                                    onChanged: (p0) {
                                      setState(() {
                                        choose = data;
                                      });
                                    },
                                  )
                                ],
                              ).onTap(() {
                                setState(() {
                                  choose = data;
                                });
                              }),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
            );
          });
        });
  }
}
