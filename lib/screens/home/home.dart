import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hn_market/app_router/app_router.dart';
import 'package:hn_market/utils/custom_avatar.dart';
import 'package:hn_market/utils/image_cached.dart';
import 'package:hn_market/utils/utils.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../../utils/custom_textfield.dart';
import '../../utils/empty_widget.dart';
import 'bloc/home_bloc.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(context)..add(const Started()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          final bloc = context.read<HomeBloc>();
          return CustomScaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                bloc.add(const Scan());
              },
              child: const Icon(FontAwesomeIcons.qrcode),
            ),
            body: RefreshIndicator(
              onRefresh: () async {
                bloc.add(const Started());
                return await Future.delayed(Duration.zero);
              },
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  if (Utils.mainBloc.state.user != null)
                    SliverAppBar(
                      floating: true,
                      backgroundColor: Theme.of(context).primaryColorLight,
                      expandedHeight: 100.sp,
                      flexibleSpace: Container(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                10.sized,
                                CustomAvatar(
                                  avatarUrl:
                                      Utils.mainBloc.state.user!.photoURL ?? '',
                                  avatarSize: 40.sp,
                                ),
                                10.sized,
                                (Utils.mainBloc.state.user!.displayName ?? '')
                                    .size16
                                    .color(Colors.black),
                                const Spacer(),
                                PopupMenuButton(
                                  icon: const Icon(FontAwesomeIcons.gear),
                                  itemBuilder: (context) {
                                    return [
                                      PopupMenuItem(
                                        child: 'Thêm sản phẩm'.size15,
                                        onTap: () {
                                          Utils.appRouter.push(
                                              AddProductRoute(barcode: ''));
                                        },
                                      ),
                                      PopupMenuItem(
                                        child: 'Khách hàng'.size15,
                                        onTap: () {
                                          Utils.appRouter
                                              .push(const CustomerListRoute());
                                        },
                                      ),
                                      PopupMenuItem(
                                        child: 'Danh mục'.size15,
                                        onTap: () {
                                          Utils.appRouter
                                              .push(const CategoryListRoute());
                                        },
                                      ),
                                      PopupMenuItem(
                                        child: 'Đơn vị'.size15,
                                        onTap: () {
                                          Utils.appRouter
                                              .push(const UnitListRoute());
                                        },
                                      ),
                                    ];
                                  },
                                )
                              ],
                            ),
                            5.sized,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                'Doanh thu hôm nay'.size15,
                                Utils.moneyFormat(bloc.getDoanhThuNgay())
                                    .size16
                                    .w600
                                    .color(Colors.black)
                              ],
                            ).marginSymmetric(horizontal: 10),
                          ],
                        ),
                      ),
                    ),
                  SliverAppBar(
                    expandedHeight: state.isSearchProduct ? 70.sp : 52.sp,
                    flexibleSpace: Card(
                            child: Row(
                      children: [
                        if (state.isSearchProduct)
                          Expanded(
                            child: SizedBox(
                              height: 40.sp,
                              child: CustomTextField(
                                onChanged: (value) {
                                  bloc.add(ChangeString(
                                      'search_product_text', value));
                                },
                                leftLabel: 'Tìm kiếm',
                              ),
                            ),
                          )
                        else
                          Expanded(child: 'Danh sách sản phẩm'.size15.w600),
                        10.sized,
                        Icon(
                          !state.isSearchProduct
                              ? FontAwesomeIcons.magnifyingGlass
                              : FontAwesomeIcons.xmark,
                          size: 15.sp,
                        ).onTap(() {
                          bloc.add(const ChangeBool('key'));
                        }),
                        10.sized,
                      ],
                    ).marginAll(8))
                        .marginSymmetric(horizontal: 5, vertical: 4),
                  ),
                  SliverToBoxAdapter(
                    child: bloc.getListProducts().isEmpty
                        ? const EmptyWidget()
                        : SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: bloc
                                  .getListProducts()
                                  .map((data) => Container(
                                        width: 120.sp,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ImageCached(
                                              image: data.hinh_san_pham,
                                              width: 120.sp,
                                              height: 80.sp,
                                            ),
                                            data.ten_san_pham.size11,
                                            'Loại: ${data.ten_danh_muc}'.size11,
                                          ],
                                        ),
                                      ).onTap(() {
                                        Utils.appRouter
                                            .push(AddProductRoute(
                                                barcode: data.barcode,
                                                oldData: data))
                                            .whenComplete(() =>
                                                bloc.add(const Started()));
                                      }))
                                  .toList(),
                            ),
                          ).marginSymmetric(horizontal: 5),
                  ),
                  SliverAppBar(
                    floating: true,
                    expandedHeight: 50.sp,
                    flexibleSpace: Card(
                            child: Row(
                      children: [
                        Expanded(child: 'Lịch sử mua hàng'.size15.w600),
                      ],
                    ).marginAll(8))
                        .marginSymmetric(horizontal: 5, vertical: 4),
                  ),
                  SliverToBoxAdapter(
                    child: state.list_order.isEmpty
                        ? const EmptyWidget()
                        : Column(
                            children: state.list_order
                                .map((data) => ListTile(
                                      onTap: () async {
                                        Utils.appRouter.push(OrderEntryRoute());
                                      },
                                      leading: CustomAvatar(
                                        avatarUrl: data.hinh_khach_hang,
                                        avatarSize: 50.sp,
                                        name: data.ten_khach_hang,
                                        shape: TDAvatarShape.square,
                                      ),
                                      title: Row(
                                        children: [
                                          data.ten_khach_hang.size16,
                                          const Spacer(),
                                          Utils.moneyFormat(data.tong_gia)
                                              .size14
                                              .w600
                                              .color(Theme.of(context)
                                                  .primaryColor)
                                        ],
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (data.khach_no)
                                            Row(
                                              children: [
                                                'Khách nợ:'.size14.color(
                                                    Theme.of(context)
                                                        .primaryColor),
                                                const Spacer(),
                                                Utils.moneyFormat(
                                                        data.tong_tien_no)
                                                    .size14
                                                    .color(Theme.of(context)
                                                        .primaryColor),
                                              ],
                                            ),
                                          Row(
                                            children: [
                                              'Thời gian mua:'.size14.color(
                                                  Theme.of(context)
                                                      .primaryColor),
                                              const Spacer(),
                                              Utils.dateToString(
                                                      'HH:mm, dd/MM/yyyy',
                                                      data.thoi_gian_mua)
                                                  .size14
                                                  .color(Theme.of(context)
                                                      .primaryColor),
                                            ],
                                          ),
                                          ...data.list_product.map((e) => Row(
                                                children: [
                                                  '${e.so_luong}x'.size10,
                                                  5.sized,
                                                  e.ten_san_pham.size10,
                                                  const Spacer(),
                                                  Utils.moneyFormat(e.gia_ban)
                                                      .size13
                                                ],
                                              ))
                                        ],
                                      ),
                                    ))
                                .toList(),
                          ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
