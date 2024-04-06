import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hn_market/utils/custom_avatar.dart';
import 'package:hn_market/utils/empty_widget.dart';
import 'package:hn_market/utils/utils.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../../model/product_model/product_model.dart';
import '../../utils/custom_textfield.dart';
import '../../utils/image_cached.dart';
import 'bloc/order_entry_bloc.dart';

@RoutePage()
class OrderEntryScreen extends StatelessWidget implements AutoRouteWrapper {
  const OrderEntryScreen({super.key, this.product});
  final ProductModel? product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderEntryBloc, OrderEntryState>(
      builder: (context, state) {
        final bloc = context.read<OrderEntryBloc>();
        return CustomScaffold(
          appBar: CustomAppBar(
            context,
            title: 'Đơn hàng',
          ),
          heightBottomSheet: 75,
          bottomSheet: Container(
            height: 75.sp,
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    'Tổng tiền'.size14,
                    5.sized,
                    Utils.moneyFormat(state.detail.tong_gia)
                        .size16
                        .w600
                        .color(Colors.black),
                  ],
                )),
                Expanded(
                    child:
                        'Thanh toán'.size15.color(Colors.white).elevatedButton(
                  onPressed: () {
                    bloc.add(const Create());
                  },
                ))
              ],
            ),
          ),
          body: Form(
              key: bloc.formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    10.sized,
                    if (state.detail.uid_khach_hang.isEmpty)
                      Card(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 60.sp,
                              height: 60.sp,
                              child: const Icon(FontAwesomeIcons.circleInfo),
                            ).onTap(() {
                              bloc.add(const ChooseImage());
                            }),
                            Expanded(
                                child: 'Chưa chọn khách hàng'.size15.center)
                          ],
                        ).marginAll(10),
                      ).marginSymmetric(horizontal: 5).onTap(() {
                        bloc.add(const ChooseCustomer());
                      })
                    else
                      Card(
                        child: Row(
                          children: [
                            CustomAvatar(
                              avatarUrl: state.detail.hinh_khach_hang,
                              avatarSize: 60,
                              shape: TDAvatarShape.square,
                              name: state.detail.ten_khach_hang,
                            ),
                            10.sized,
                            Expanded(
                                child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    'Khách hàng:'.size14,
                                    state.detail.ten_khach_hang.size15
                                        .color(Colors.black)
                                        .w600
                                  ],
                                ),
                                10.sized,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    'SĐT:'.size14,
                                    state.detail.sdt_khach_hang.size15.w500
                                  ],
                                ),
                              ],
                            ))
                          ],
                        ).marginAll(10),
                      ).marginSymmetric(horizontal: 5).onTap(() {
                        bloc.add(const ChooseCustomer());
                      }),
                    10.sized,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        'Nợ'.size15,
                        TDSwitch(
                          isOn: state.isDebt,
                          type: TDSwitchType.icon,
                          onChanged: (value) {
                            bloc.add(const ChangeBool('isDebt'));
                            return value;
                          },
                        ),
                      ],
                    ).marginSymmetric(horizontal: 10).onTap(() {
                      bloc.add(const ChangeBool('isDebt'));
                    }),
                    10.sized,
                    Visibility(
                      visible: state.isDebt,
                      child: CustomTextField(
                        controller: bloc.khach_no,
                        inputType: TextInputType.number,
                        inputFormatters: [bloc.khach_no_formartter],
                        leftLabel: 'Số tiền nợ',
                        additionInfo: 'Không nhập là nợ toàn bộ đơn hàng',
                      ).marginSymmetric(horizontal: 10),
                    ),
                    10.sized,
                    Card(
                            child: Row(
                      children: [
                        Expanded(child: 'Danh sách sản phẩm'.size15.w600),
                      ],
                    ).marginAll(10))
                        .marginSymmetric(horizontal: 5),
                    Row(
                      children: [
                        Expanded(
                          child: 'Quét mã'
                              .size13
                              .color(Colors.white)
                              .textButton(
                                  onPressed: () =>
                                      bloc.add(const AddProductByScan()),
                                  radius: 2,
                                  height: 35,
                                  backgroundColor:
                                      Theme.of(context).primaryColor),
                        ),
                        10.sized,
                        Expanded(
                          child: 'Chọn SP'
                              .size13
                              .color(Theme.of(context).primaryColor)
                              .textButton(
                                  onPressed: () =>
                                      bloc.add(const AddProductByChoose()),
                                  backgroundColor: Colors.white,
                                  radius: 2,
                                  height: 35,
                                  side: BorderSide(
                                      color: Theme.of(context).primaryColor)),
                        ),
                      ],
                    ).marginSymmetric(horizontal: 12),
                    10.sized,
                    if (state.detail.list_product.isNotEmpty)
                      ...state.detail.list_product.map((e) => Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                10.sized,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    '#${state.detail.list_product.indexOf(e) + 1}'
                                        .size16
                                        .w500,
                                    Icon(
                                      FontAwesomeIcons.xmark,
                                      size: 20.sp,
                                    ).onTap(() {
                                      bloc.add(RemoveProduct(e));
                                    })
                                  ],
                                ).marginSymmetric(horizontal: 12),
                                const Divider(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ImageCached(
                                      image: e.hinh_san_pham,
                                      width: 80.sp,
                                      height: 80.sp,
                                    ),
                                    10.sized,
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                  child: e.ten_san_pham.size16
                                                      .w600),
                                              10.sized,
                                              Utils.moneyFormat(
                                                      e.gia_ban * e.so_luong)
                                                  .size16,
                                            ],
                                          ),
                                          3.sized,
                                          Row(
                                            children: [
                                              'Giá:'.size14,
                                              Expanded(
                                                child: CustomPopup(
                                                  showArrow: true,
                                                  content: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: state.list_product
                                                        .firstWhere(
                                                            (element) =>
                                                                element.uid ==
                                                                e.uid_product,
                                                            orElse: () =>
                                                                const ProductModel())
                                                        .price_list
                                                        .map(
                                                            (price) =>
                                                                Container(
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      vertical:
                                                                          8),
                                                                  decoration: const BoxDecoration(
                                                                      border: Border(
                                                                          bottom:
                                                                              BorderSide(color: Colors.black12))),
                                                                  child: '${Utils.moneyFormat(price.gia_ban)}${e.so_luong > 1 ? '/${price.so_luong}' : ''}/${price.ten_don_vi}'
                                                                      .size15
                                                                      .center,
                                                                ).onTap(() {
                                                                  bloc.add(
                                                                      ChoosePrice(
                                                                          e,
                                                                          price));
                                                                }))
                                                        .toList(),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      '${Utils.moneyFormat(e.gia_ban)}/${e.gia_ban_ten_don_vi}'
                                                          .size15
                                                          .color(Theme.of(
                                                                  context)
                                                              .primaryColor),
                                                      5.sized,
                                                      const Icon(Icons
                                                          .keyboard_arrow_down_rounded)
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Spacer(),
                                              Expanded(
                                                  child: Row(
                                                children: [
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.all(2),
                                                    decoration: ShapeDecoration(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        side: const BorderSide(
                                                            width: 1,
                                                            color: Color(
                                                                0xFF3C8DBC)),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(3),
                                                      ),
                                                    ),
                                                    child: Icon(
                                                      Icons.remove,
                                                      size: 15.sp,
                                                      color: const Color(
                                                          0xFF3C8DBC),
                                                    ),
                                                  ).onTap(() {
                                                    bloc.add(
                                                        ChangeAmount(e, -1));
                                                  }),
                                                  const Spacer(),
                                                  AnimatedFlipCounter(
                                                    value: e.so_luong,
                                                    textStyle: Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge,
                                                  ),
                                                  const Spacer(),
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.all(2),
                                                    decoration: ShapeDecoration(
                                                      color: const Color(
                                                          0xFF3C8DBC),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          3)),
                                                    ),
                                                    child: Icon(
                                                      Icons.add,
                                                      size: 15.sp,
                                                      color: Colors.white,
                                                    ),
                                                  ).onTap(() {
                                                    bloc.add(
                                                        ChangeAmount(e, 1));
                                                  }),
                                                ],
                                              ))
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ).marginSymmetric(horizontal: 10),
                                10.sized,
                              ],
                            ),
                          ).marginSymmetric(horizontal: 10))
                    else
                      const EmptyWidget(
                        emptyText: 'Chưa có sản phẩm',
                      ).marginOnly(top: 10)
                  ],
                ),
              )),
        );
      },
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          OrderEntryBloc(context, product)..add(const Started()),
      child: this,
    );
  }
}
