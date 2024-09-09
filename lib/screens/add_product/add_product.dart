import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hn_market/utils/utils.dart';

import '../../utils/custom_textfield.dart';
import '../../utils/image_cached.dart';
import 'bloc/add_product_bloc.dart';

@RoutePage()
class AddProductScreen extends StatelessWidget implements AutoRouteWrapper {
  const AddProductScreen({super.key, this.uid, required this.barcode});
  final int? uid;
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
          bottomSheet: (uid != null ? 'Cập nhật' : 'Thêm sản phẩm')
              .size15
              .color(Colors.white)
              .textButton(
                onPressed: () {
                  bloc.add(const Create());
                },
              )
              .marginSymmetric(horizontal: 10)
              .marginOnly(bottom: 10),
          body: Form(
            key: bloc.formKey,
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.sized,
                Row(
                  children: [
                    if (state.hinh_san_pham != null)
                      Container(
                        width: 157.sp,
                        height: 157.sp,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black12)),
                        child: ImageMemory(
                          state.hinh_san_pham!,
                        ),
                      ).onTap(() {
                        bloc.add(const ChooseImage());
                      })
                    else
                      Container(
                        width: 157.sp,
                        height: 157.sp,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black12)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(FontAwesomeIcons.camera),
                            10.sized,
                            'Hình sản phẩm'.size12,
                          ],
                        ),
                      ).onTap(() {
                        bloc.add(const ChooseImage());
                      }),
                    Expanded(
                        child: Column(
                      children: [
                        CustomTextField(
                          controller: TextEditingController(text: barcode),
                          readOnly: true,
                          title: 'Mã SP',
                          // rightWidget: const Icon(FontAwesomeIcons.barcode),
                          // onBtnTap: () {
                          //   bloc.add(const ScanBarcode());
                          // },
                        ).marginSymmetric(horizontal: 10),
                        10.sized,
                        CustomTextField(
                          controller: bloc.ten_san_phamController,
                          title: 'Tên SP',
                          hintText: 'Nhập tên SP',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Vui lòng nhập tên SP';
                            }
                            return null;
                          },
                          required: true,
                        ).marginSymmetric(horizontal: 10),
                      ],
                    ))
                  ],
                ).marginSymmetric(horizontal: 10),
                10.sized,
                CustomDropDownButton(
                        value: state.category?.uid,
                        title: 'Loại SP',
                        hintText: 'Chọn loại SP',
                        validator: (value) {
                          if (value == null) {
                            return 'Vui lòng chọn loại SP';
                          }
                          return null;
                        },
                        onChanged: (p0) {
                          final category = state.list_category
                              .firstWhere((element) => element.uid == p0);
                          bloc.add(ChooseCategory(category));
                        },
                        items: state.list_category
                            .map((e) => DropdownMenuItem(
                                value: e.uid,
                                child: (e.ten_danh_muc ?? '').size14.w600))
                            .toList())
                    .marginSymmetric(horizontal: 10),
                10.sized,
                CustomDropDownButton(
                        value: state.supplier?.uid,
                        title: 'Nhà cung cấp',
                        hintText: 'Chọn nhà cung cấp',
                        validator: (value) {
                          if (value == null) {
                            return 'Vui lòng chọn nhà cung cấp';
                          }
                          return null;
                        },
                        onChanged: (p0) {
                          final supplier = state.list_supplier
                              .firstWhere((element) => element.uid == p0);
                          bloc.add(ChooseSupplier(supplier));
                        },
                        items: state.list_supplier
                            .map((e) => DropdownMenuItem(
                                value: e.uid,
                                child: (e.name ?? '').size14.w600))
                            .toList())
                    .marginSymmetric(horizontal: 10),
                10.sized,
                CustomTextField(
                  inputType: TextInputType.number,
                  controller: bloc.dung_tichController,
                  title: 'Dung tích',
                  hintText: 'Nhập dung tích',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập dung tích';
                    }
                    return null;
                  },
                  required: true,
                  suffixIconMaxWidth: 120.sp,
                  suffixIcon: CustomDropDownButton(
                      value: state.unit?.uid,
                      hintText: 'Chọn đơn vị',
                      onChanged: (p0) {
                        final unit = state.list_unit
                            .firstWhere((element) => element.uid == p0);
                        bloc.add(ChooseUnit(unit));
                      },
                      items: state.list_unit
                          .map((e) => DropdownMenuItem(
                              value: e.uid,
                              child: (e.ten_don_vi ?? '').size14.w600))
                          .toList()),
                ).marginSymmetric(horizontal: 10),
                10.sized,
                CustomTextField(
                  controller: bloc.ghi_chuController,
                  title: 'Ghi chú',
                  hintText: 'Nội dung',
                ).marginSymmetric(horizontal: 10),
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
                if (state.price_list.isNotEmpty)
                  ...state.price_list.map((e) {
                    return Card(
                      child: Column(
                        children: [
                          10.sized,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              '#${state.price_list.indexOf(e) + 1}'.size16.w500,
                              20.sized,
                              (e.name ?? '').size16.w500,
                              const Spacer(),
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
                            controller: TextEditingController(
                                text: Utils.moneyFormat(e.gia_ban)),
                            inputType: TextInputType.number,
                            contentAlignment: TextAlign.end,
                            readOnly: true,
                            title: 'Giá bán',
                            required: true,
                          ).marginSymmetric(horizontal: 10),
                          10.sized,
                          CustomTextField(
                            controller: TextEditingController(
                                text: e.so_luong.toString()),
                            inputType: TextInputType.number,
                            readOnly: true,
                            title: 'Số lượng',
                            contentAlignment: TextAlign.end,
                            required: true,
                            suffixIconMaxWidth: 90.sp,
                            suffixIcon: (e.unit.target?.ten_don_vi ?? '')
                                .size15
                                .color(Theme.of(context).primaryColor)
                                .marginOnly(right: 10),
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
                // 10.sized,
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     'Nhập số lượng nhiều'.size15,
                //     TDSwitch(
                //       isOn: state.isImport,
                //       type: TDSwitchType.icon,
                //       onChanged: (value) {
                //         bloc.add(const ChangeBool('isImport'));
                //         return value;
                //       },
                //     ),
                //   ],
                // ).marginSymmetric(horizontal: 12).onTap(() {
                //   bloc.add(const ChangeBool('isImport'));
                // }),
                // if (state.isImport)
                //   Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       10.sized,
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           'Tồn kho'.size15,
                //           '0'.size16,
                //         ],
                //       ).marginSymmetric(horizontal: 10).onTap(() {
                //         bloc.add(const ChangeBool('isImport'));
                //       }),
                //       10.sized,
                //       CustomTextField(
                //         controller: bloc.so_luong_nhap,
                //         inputType: TextInputType.number,
                //         title: 'SL nhập',
                //         onChanged: (value) {
                //           bloc.add(ChangeString('so_luong_nhap', value));
                //         },
                //       ),
                //       10.sized,
                //       CustomTextField(
                //         controller: bloc.tong_gia_nhap,
                //         inputType: TextInputType.number,
                //         title: 'Tổng giá',
                //         onChanged: (value) {
                //           bloc.add(ChangeString('tong_gia_nhap', value));
                //         },
                //         inputFormatters: [bloc.tong_gia_nhap_formartter],
                //       ),
                //       10.sized,
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           'Giá nhập mỗi sản phẩm'.size15,
                //           Utils.moneyFormat(0).size16,
                //         ],
                //       ).marginSymmetric(horizontal: 12).onTap(() {
                //         bloc.add(const ChangeBool('isImport'));
                //       }),
                //     ],
                //   ),
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
          AddProductBloc(context, uid, barcode)..add(const Started()),
      child: this,
    );
  }
}
