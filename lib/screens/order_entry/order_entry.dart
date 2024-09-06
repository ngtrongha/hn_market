import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hn_market/utils/custom_avatar.dart';
import 'package:hn_market/utils/empty_widget.dart';
import 'package:hn_market/utils/utils.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../../model/product_model/product_model.dart';
import '../../objectbox.g.dart';
import '../../utils/custom_textfield.dart';
import '../../utils/image_cached.dart';
import '../../utils/loading.dart';
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
                    Utils.moneyFormat(state.tong_gia)
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
          body: state.isLoading
              ? const Center(child: LoadingWidget())
              : Form(
                  key: bloc.formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        10.sized,
                        if (state.uid_khach_hang == 0)
                          Card(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 60.sp,
                                  height: 60.sp,
                                  child:
                                      const Icon(FontAwesomeIcons.circleInfo),
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
                                  avatar: state.hinh_khach_hang,
                                  avatarSize: 60,
                                  name: state.ten_khach_hang,
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
                                        (state.ten_khach_hang)
                                            .size15
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
                                        (state.sdt_khach_hang).size15.w500
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
                            controller: TextEditingController(
                                text: state.tong_tien_no.toString()),
                            inputType: TextInputType.number,
                            inputFormatters: [bloc.khach_no_formartter],
                            title: 'Số tiền nợ',
                            hintText: 'Không nhập là nợ toàn bộ đơn hàng',
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
                                      radius: 16,
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
                                      radius: 16,
                                      height: 35,
                                      side: BorderSide(
                                          color:
                                              Theme.of(context).primaryColor)),
                            ),
                          ],
                        ).marginSymmetric(horizontal: 12),
                        10.sized,
                        if (state.list_product.isNotEmpty)
                          ...state.list_product.map((e) => Card(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    10.sized,
                                    Row(
                                      children: [
                                        '#${state.list_product.indexOf(e) + 1}'
                                            .size16
                                            .w500,
                                        10.sized,
                                        Expanded(
                                            child: (e.ten_san_pham ?? '')
                                                .size16
                                                .w600),
                                        10.sized,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        if (e.hinh_san_pham != null)
                                          ImageMemory(
                                            e.hinh_san_pham!,
                                            width: 80.sp,
                                            height: 80.sp,
                                          ),
                                        10.sized,
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Row(children: [
                                                'Loại:'.size14,
                                                Expanded(
                                                    child: (e.ten_loai ?? '')
                                                        .size16
                                                        .end),
                                              ]),
                                              4.sized,
                                              Row(
                                                children: [
                                                  'Giá:'.size14,
                                                  10.sized,
                                                  Expanded(
                                                    child: CustomPopup(
                                                      showArrow: true,
                                                      content: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: (Utils
                                                                    .objectBox
                                                                    .store
                                                                    .box<
                                                                        ProductModel>()
                                                                    .query(ProductModel_
                                                                        .uid
                                                                        .equals(e.uid_product ??
                                                                            -1))
                                                                    .build()
                                                                    .findFirst() ??
                                                                ProductModel())
                                                            .price_list
                                                            .map(
                                                                (price) =>
                                                                    Container(
                                                                      width:
                                                                          200.w,
                                                                      padding: const EdgeInsets
                                                                          .symmetric(
                                                                          vertical:
                                                                              8),
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                              border: Border(bottom: BorderSide(color: Colors.black12))),
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          (price.name ?? '')
                                                                              .size14,
                                                                          '${Utils.moneyFormat(price.gia_ban)}${e.so_luong > 1 ? '/${price.so_luong}' : ''}/${price.ten_don_vi}'
                                                                              .size15
                                                                              .center,
                                                                        ],
                                                                      ),
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
                                                            MainAxisAlignment
                                                                .end,
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
                                                            const EdgeInsets
                                                                .all(2),
                                                        decoration:
                                                            ShapeDecoration(
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            side: const BorderSide(
                                                                width: 1,
                                                                color: Color(
                                                                    0xFF3C8DBC)),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        3),
                                                          ),
                                                        ),
                                                        child: Icon(
                                                          Icons.remove,
                                                          size: 15.sp,
                                                          color: const Color(
                                                              0xFF3C8DBC),
                                                        ),
                                                      ).onTap(() {
                                                        bloc.add(ChangeAmount(
                                                            e, -1));
                                                      }),
                                                      const Spacer(),
                                                      AnimatedFlipCounter(
                                                        value: e.so_luong,
                                                        textStyle:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .bodyLarge,
                                                      ),
                                                      const Spacer(),
                                                      Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(2),
                                                        decoration:
                                                            ShapeDecoration(
                                                          color: const Color(
                                                              0xFF3C8DBC),
                                                          shape: RoundedRectangleBorder(
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
