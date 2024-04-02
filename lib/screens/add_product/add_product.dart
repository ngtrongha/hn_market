import 'package:auto_route/auto_route.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hn_market/model/product_model/product_model.dart';
import 'package:hn_market/utils/image_cached.dart';
import 'package:hn_market/utils/utils.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import '../../utils/custom_textfield.dart';
import 'bloc/add_product_bloc.dart';

@RoutePage()
class AddProductScreen extends StatelessWidget implements AutoRouteWrapper {
  const AddProductScreen({super.key, this.oldData, required this.barcode});
  final ProductModel? oldData;
  final String barcode;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddProductBloc, AddProductState>(
      builder: (context, state) {
        final bloc = context.read<AddProductBloc>();
        return CustomScaffold(
          appBar: CustomAppBar(
            context,
            title: 'Thêm sản phẩm',
          ),
          heightBottomSheet: 50,
          bottomSheet: (oldData != null ? 'Cập nhật' : 'Thêm sản phẩm')
              .size15
              .color(Colors.white)
              .textButton(
            onPressed: () {
              bloc.add(const Create());
            },
          ).marginSymmetric(horizontal: 10),
          body: Form(
            key: bloc.formKey,
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.sized,
                Row(
                  children: [
                    if (state.image != null)
                      Container(
                        width: 125.sp,
                        height: 125.sp,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black12)),
                        child: AssetEntityImage(
                          state.image!,
                          fit: BoxFit.cover,
                        ),
                      ).onTap(() {
                        bloc.add(const ChooseImage());
                      })
                    else if (state.imageUrl.isNotEmpty)
                      Container(
                        width: 125.sp,
                        height: 125.sp,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black12)),
                        child: ImageCached(
                          image: state.imageUrl,
                        ),
                      ).onTap(() {
                        bloc.add(const ChooseImage());
                      })
                    else
                      Container(
                        width: 125.sp,
                        height: 125.sp,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black12)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(FontAwesomeIcons.camera),
                            10.sized,
                            'Hình khách'.size12,
                          ],
                        ),
                      ).onTap(() {
                        bloc.add(const ChooseImage());
                      }),
                    Expanded(
                        child: Column(
                      children: [
                        CustomTextField(
                          controller:
                              TextEditingController(text: state.barcode),
                          readOnly: true,
                          leftLabel: 'Mã SP',
                          rightBtn: const Icon(FontAwesomeIcons.barcode),
                          onBtnTap: () {
                            bloc.add(const ScanBarcode());
                          },
                        ),
                        10.sized,
                        CustomTextField(
                          controller: bloc.ten_san_pham,
                          leftLabel: 'Tên SP',
                          hintText: 'Nhập tên SP',
                          required: true,
                        ),
                      ],
                    ))
                  ],
                ).marginSymmetric(horizontal: 10),
                10.sized,
                CustomTextField(
                  readOnly: true,
                  leftLabel: 'Loại SP',
                  required: true,
                  rightBtn: Container(
                    constraints: BoxConstraints(maxWidth: 150.sp),
                    child: CustomPopup(
                      showArrow: true,
                      content: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: state.list_category
                              .map((e) => Container(
                                          width: 160.sp,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8),
                                          decoration: const BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      color: Colors.black12))),
                                          child:
                                              '#${state.list_category.indexOf(e) + 1}: ${e.ten_danh_muc}'
                                                  .size15)
                                      .onTap(() {
                                    bloc.add(ChooseCategory(e));
                                  }))
                              .toList(),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          state.category.ten_danh_muc.size15
                              .color(Theme.of(context).primaryColor),
                          15.sized,
                          const Icon(Icons.keyboard_arrow_down_rounded),
                        ],
                      ),
                    ),
                  ),
                ),
                10.sized,
                CustomTextField(
                  controller: bloc.dung_tich,
                  inputType: TextInputType.number,
                  leftLabel: 'Dung tích',
                  hintText: 'Nhập dung tích',
                  required: true,
                  rightBtn: Container(
                    constraints: BoxConstraints(maxWidth: 90.sp),
                    child: CustomPopup(
                      showArrow: true,
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: state.list_unit
                            .map((e) => Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.black12))),
                                  child: e.ten_don_vi.size15.center,
                                ).onTap(() {
                                  bloc.add(ChooseUnit(e));
                                }))
                            .toList(),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          state.unit.ky_hieu.size15
                              .color(Theme.of(context).primaryColor),
                          15.sized,
                          const Icon(Icons.keyboard_arrow_down_rounded)
                        ],
                      ),
                    ),
                  ),
                ),
                10.sized,
                CustomTextField(
                  controller: bloc.ghi_chu,
                  leftLabel: 'Ghi chú',
                  hintText: 'Nội dung',
                ),
                10.sized,
                Row(
                  children: [
                    'Danh sách giá bán'
                        .size15
                        .w600
                        .color(Colors.black)
                        .marginSymmetric(horizontal: 10),
                    const Spacer(),
                    'Thêm giá'
                        .size15
                        .color(Theme.of(context).primaryColor)
                        .textButton(
                            onPressed: () {
                              bloc.add(const AddPrice());
                            },
                            radius: 4,
                            width: 120.sp,
                            height: 40.sp,
                            backgroundColor: Colors.white,
                            side: BorderSide(
                                color: Theme.of(context).primaryColor))
                        .marginSymmetric(horizontal: 10)
                  ],
                ),
                10.sized,
                if (state.list_price.isNotEmpty)
                  ...state.list_price.map((e) {
                    final formaterr =
                        CurrencyTextInputFormatter(symbol: 'đ', locale: 'vi');

                    return Card(
                      child: Column(
                        children: [
                          10.sized,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              '#${state.list_price.indexOf(e) + 1}'.size16.w500,
                              Icon(
                                FontAwesomeIcons.xmark,
                                size: 20.sp,
                              ).onTap(() {
                                bloc.add(DeletePrice(e));
                              })
                            ],
                          ).marginSymmetric(horizontal: 12),
                          const Divider(),
                          CustomTextField(
                            controller: TextEditingController.fromValue(
                                TextEditingValue(
                                    text: formaterr.formatDouble(e.gia_ban),
                                    selection: TextSelection.collapsed(
                                        offset: formaterr
                                            .getFormattedValue()
                                            .length))),
                            inputType: TextInputType.number,
                            backgroundColor: Colors.white,
                            onChanged: (p0) {
                              bloc.add(ChangePrice(e,
                                  formaterr.getUnformattedValue().toDouble()));
                            },
                            leftLabel: 'Giá bán',
                            hintText: 'Nhập giá bán',
                            required: true,
                            inputFormatters: [formaterr],
                          ).marginSymmetric(horizontal: 10),
                          10.sized,
                          CustomTextField(
                            controller: TextEditingController.fromValue(
                                TextEditingValue(
                                    text: e.so_luong.toString(),
                                    selection: TextSelection.collapsed(
                                        offset: e.so_luong.toString().length))),
                            inputType: TextInputType.number,
                            backgroundColor: Colors.white,
                            onChanged: (p0) {
                              bloc.add(ChangeSL(e, double.tryParse(p0) ?? 0));
                            },
                            leftLabel: 'Số lượng',
                            hintText: 'Nhập số lượng',
                            required: true,
                            rightBtn: Container(
                              constraints: BoxConstraints(maxWidth: 90.sp),
                              child: CustomPopup(
                                showArrow: true,
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: state.list_unit
                                      .map((unit) => Container(
                                            width: 100.sp,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8),
                                            decoration: const BoxDecoration(
                                                border: Border(
                                                    bottom: BorderSide(
                                                        color:
                                                            Colors.black12))),
                                            child:
                                                unit.ten_don_vi.size15.center,
                                          ).onTap(() {
                                            bloc.add(ChooseUnitPrice(e, unit));
                                          }))
                                      .toList(),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    e.ten_don_vi.size15
                                        .color(Theme.of(context).primaryColor),
                                    15.sized,
                                    const Icon(
                                        Icons.keyboard_arrow_down_rounded)
                                  ],
                                ),
                              ),
                            ),
                          ).marginSymmetric(horizontal: 10),
                          10.sized,
                        ],
                      ),
                    ).marginSymmetric(horizontal: 10);
                  })
                else
                  Center(
                    child: 'Chưa thêm giá'.size12,
                  ),
                10.sized,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    'Nhập số lượng nhiều'.size15,
                    TDSwitch(
                      isOn: state.isImport,
                      type: TDSwitchType.icon,
                      onChanged: (value) {
                        bloc.add(const ChangeBool('isImport'));
                        return value;
                      },
                    ),
                  ],
                ).marginSymmetric(horizontal: 12).onTap(() {
                  bloc.add(const ChangeBool('isImport'));
                }),
                if (state.isImport)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      10.sized,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          'Tồn kho'.size15,
                          '${state.ton_kho}'.size16,
                        ],
                      ).marginSymmetric(horizontal: 10).onTap(() {
                        bloc.add(const ChangeBool('isImport'));
                      }),
                      10.sized,
                      CustomTextField(
                        controller: bloc.so_luong_nhap,
                        inputType: TextInputType.number,
                        leftLabel: 'SL nhập',
                        onChanged: (value) {
                          bloc.add(ChangeString('so_luong_nhap', value));
                        },
                      ),
                      10.sized,
                      CustomTextField(
                        controller: bloc.tong_gia_nhap,
                        inputType: TextInputType.number,
                        leftLabel: 'Tổng giá',
                        onChanged: (value) {
                          bloc.add(ChangeString('tong_gia_nhap', value));
                        },
                        inputFormatters: [bloc.tong_gia_nhap_formartter],
                      ),
                      10.sized,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          'Giá nhập mỗi sản phẩm'.size15,
                          Utils.moneyFormat(state.gia_nhap_moi_sp).size16,
                        ],
                      ).marginSymmetric(horizontal: 12).onTap(() {
                        bloc.add(const ChangeBool('isImport'));
                      }),
                    ],
                  ),
                40.sized,
              ],
            )),
          ),
        );
      },
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AddProductBloc(context, oldData, barcode)..add(const Started()),
      child: this,
    );
  }
}
