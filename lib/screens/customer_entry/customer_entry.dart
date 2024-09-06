import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hn_market/utils/utils.dart';

import '../../utils/custom_textfield.dart';
import '../../utils/gallary.dart';
import '../../utils/image_cached.dart';
import 'bloc/customer_entry_bloc.dart';

@RoutePage()
class CustomerEntryScreen extends StatelessWidget implements AutoRouteWrapper {
  const CustomerEntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerEntryBloc, CustomerEntryState>(
      builder: (context, state) {
        final bloc = context.read<CustomerEntryBloc>();
        return CustomScaffold(
          appBar: CustomAppBar(
            context,
            title: 'Thêm khách hàng',
          ),
          bottomSheet: 'Thêm khách hàng'.size16.color(Colors.white).textButton(
            onPressed: () {
              bloc.add(const Create());
            },
          ).marginSymmetric(horizontal: 10),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.sized,
                Row(
                  children: [
                    if (state.hinh_khach_hang != null)
                      Container(
                        width: 125.sp,
                        height: 125.sp,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black12)),
                        child: ImageMemory(
                          state.hinh_khach_hang!,
                          fit: BoxFit.cover,
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
                          initialValue: state.ten_khach_hang,
                          onChanged: (value) {
                            bloc.add(ChangeString('ten_khach_hang', value));
                          },
                          title: 'Khách hàng',
                          required: true,
                          hintText: 'Nhập tên khách hàng',
                        ),
                        10.sized,
                        CustomTextField(
                          initialValue: state.sdt_khach_hang,
                          onChanged: (value) {
                            bloc.add(ChangeString('sdt_khach_hang', value));
                          },
                          inputType: TextInputType.phone,
                          title: 'SĐT Khách',
                          hintText: 'Nhập SĐT khách hàng',
                          required: true,
                        ),
                      ],
                    ))
                  ],
                ).marginSymmetric(horizontal: 10),
                10.sized,
                CustomTextField(
                  initialValue: state.dia_chi,
                  onChanged: (value) {
                    bloc.add(ChangeString('dia_chi', value));
                  },
                  title: 'Địa chỉ',
                  hintText: 'Nhập địa chỉ khách hàng',
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomerEntryBloc(context),
      child: this,
    );
  }
}
