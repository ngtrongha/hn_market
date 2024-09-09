import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hn_market/app_router/app_router.dart';
import 'package:hn_market/utils/custom_avatar.dart';
import 'package:hn_market/utils/utils.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../../utils/custom_textfield.dart';
import '../../utils/empty_widget.dart';
import '../../utils/image_cached.dart';
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
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              onPressed: () {
                bloc.add(const Scan());
              },
              child: const Icon(FontAwesomeIcons.qrcode),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: StylishBottomBar(
              // option: AnimatedBarOptions(
              //   // iconSize: 32,
              //   barAnimation: BarAnimation.blink,
              //   iconStyle: IconStyle.animated,

              //   // opacity: 0.3,
              // ),
              option: AnimatedBarOptions(),
              items: [
                BottomBarItem(
                  icon: const Icon(
                    Icons.house_outlined,
                  ),
                  selectedIcon: const Icon(Icons.house_rounded),
                  selectedColor: Colors.teal,
                  unSelectedColor: Colors.grey,
                  title: 'Trang chủ'.size10,
                  showBadge: true,
                  badgeColor: Colors.purple,
                  badgePadding: const EdgeInsets.only(left: 4, right: 4),
                ),
                BottomBarItem(
                  icon: const Icon(Icons.star_border_rounded),
                  selectedIcon: const Icon(Icons.star_rounded),
                  selectedColor: Colors.red,
                  // unSelectedColor: Colors.purple,
                  // backgroundColor: Colors.orange,
                  title: const Text('Star'),
                ),
                BottomBarItem(
                    icon: const Icon(
                      Icons.style_outlined,
                    ),
                    selectedIcon: const Icon(
                      Icons.style,
                    ),
                    selectedColor: Colors.deepOrangeAccent,
                    title: const Text('Style')),
                BottomBarItem(
                    icon: const Icon(
                      Icons.person_outline,
                    ),
                    selectedIcon: const Icon(
                      Icons.person,
                    ),
                    selectedColor: Colors.deepPurple,
                    title: const Text('Profile')),
              ],
              hasNotch: true,
              fabLocation: StylishBarFabLocation.center,
              currentIndex: state.indexNav,
              notchStyle: NotchStyle.circle,
              onTap: (index) {
                bloc.add(ChangeIndexNav(index));
              },
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
                      pinned: true,
                      backgroundColor: Theme.of(context).primaryColorLight,
                      expandedHeight: 120.sp,
                      flexibleSpace: Container(
                        height: 120.sp,
                        width: double.infinity,
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
                                if (Utils.debugLog)
                                  Icon(
                                    FontAwesomeIcons.bug,
                                    size: 20.sp,
                                  ).onTap(() {
                                    Utils.appRouter.pushWidget(
                                        TalkerScreen(talker: Utils.log));
                                  }),
                                if (Utils.debugLog) 10.sized,
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
                                        child: 'Thêm đơn hàng'.size15,
                                        onTap: () {
                                          Utils.appRouter
                                              .push(OrderEntryRoute());
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
                                      PopupMenuItem(
                                        child: 'Nhà cung cấp'.size15,
                                        onTap: () {
                                          Utils.appRouter
                                              .push(const SupplierListRoute());
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
                  switch (state.indexNav) {
                    0 => SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                                    child: Row(
                              children: [
                                if (state.isSearchProduct)
                                  Expanded(
                                    child: CustomTextField(
                                      onChanged: (value) {
                                        bloc.add(ChangeString(
                                            'search_product_text', value));
                                      },
                                      title: 'Tìm kiếm',
                                    ),
                                  )
                                else
                                  Expanded(
                                      child: 'Danh sách sản phẩm'.size15.w600),
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
                            if (bloc.getListProducts().isEmpty)
                              const EmptyWidget()
                            else
                              SingleChildScrollView(
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
                                                if (data.hinh_san_pham != null)
                                                  ImageMemory(
                                                    data.hinh_san_pham!,
                                                    width: 120.sp,
                                                    height: 80.sp,
                                                    fit: BoxFit.cover,
                                                    alignment: Alignment.center,
                                                  ),
                                                (data.ten_san_pham ?? '')
                                                    .size11,
                                                'Loại: ${data.category.target?.ten_danh_muc}'
                                                    .size11,
                                              ],
                                            ),
                                          ).onTap(() {
                                            if (data.barcode != null) {
                                              Utils.appRouter
                                                  .push(AddProductRoute(
                                                      barcode: data.barcode!,
                                                      uid: data.uid))
                                                  .whenComplete(() => bloc
                                                      .add(const Started()));
                                            }
                                          }))
                                      .toList(),
                                ),
                              ).marginSymmetric(horizontal: 5),
                            Card(
                                    child: Expanded(
                                            child:
                                                'Lịch sử mua hàng'.size15.w600)
                                        .marginAll(8))
                                .marginSymmetric(horizontal: 5, vertical: 4),
                            if (state.list_order.isEmpty)
                              const EmptyWidget()
                            else
                              Column(
                                children: state.list_order
                                    .map((data) => ListTile(
                                          onTap: () async {
                                            Utils.appRouter
                                                .push(OrderEntryRoute());
                                          },
                                          leading: CustomAvatar(
                                            avatar: data.hinh_khach_hang,
                                            avatarSize: 50.sp,
                                            name: data.ten_khach_hang,
                                          ),
                                          title: Row(
                                            children: [
                                              (data.ten_khach_hang ?? '')
                                                  .size16,
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
                                              ...data.list_product
                                                  .map((e) => Row(
                                                        children: [
                                                          '${e.so_luong}x'
                                                              .size10,
                                                          5.sized,
                                                          (e.ten_san_pham ?? '')
                                                              .size10,
                                                          const Spacer(),
                                                          Utils.moneyFormat(e
                                                                      .price
                                                                      .target
                                                                      ?.gia_ban ??
                                                                  0)
                                                              .size13
                                                        ],
                                                      ))
                                            ],
                                          ),
                                        ))
                                    .toList(),
                              )
                          ],
                        ),
                      ),
                    int() => const EmptyWidget(),
                  }
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
