import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hn_market/model/customer_model/customer_model.dart';
import 'package:hn_market/utils/custom_checkbox.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../../model/product_model/product_model.dart';
import '../../utils/empty_widget.dart';
import '../../utils/image_cached.dart';
import '../../utils/utils.dart';

class OrderPopup {
  static multiChooseProducts(final List<ProductModel> values,
      [final List<ProductModel> chosses = const []]) {
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
                      child: SingleChildScrollView(
                        child: Column(
                          children: values.map((data) {
                            return ListTile(
                              onTap: () async {
                                setState(() {
                                  chosses.add(data);
                                });
                              },
                              leading: ImageCached(
                                image: data.hinh_san_pham,
                              ),
                              title: data.ten_san_pham.size16,
                              trailing: CustomCheckBox(
                                value: chosses
                                    .any((element) => element.uid == data.uid),
                                onChanged: (p0) {
                                  setState(() {
                                    chosses.add(data);
                                  });
                                },
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      'Loại:'.size12,
                                      5.sized,
                                      data.ten_danh_muc.size14
                                    ],
                                  )
                                ],
                              ),
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
                            return ListTile(
                              onTap: () async {
                                setState(() {
                                  choose = data;
                                });
                              },
                              leading: ImageCached(
                                image: data.hinh_khach_hang,
                              ),
                              title: data.ten_khach_hang.size16,
                              trailing: CustomCheckBox(
                                value: choose?.uid == data.uid,
                                onChanged: (p0) {
                                  setState(() {
                                    choose = data;
                                  });
                                },
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      'SDT:'.size12,
                                      5.sized,
                                      data.sdt_khach_hang.size14
                                    ],
                                  )
                                ],
                              ),
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
