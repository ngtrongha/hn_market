import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hn_market/app_router/app_router.dart';
import 'package:hn_market/utils/custom_avatar.dart';
import 'package:hn_market/utils/empty_widget.dart';
import 'package:hn_market/utils/utils.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import 'bloc/customer_list_bloc.dart';

@RoutePage()
class CustomerListScreen extends StatelessWidget implements AutoRouteWrapper {
  const CustomerListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerListBloc, CustomerListState>(
      builder: (context, state) {
        final bloc = context.read<CustomerListBloc>();
        return CustomScaffold(
          appBar: CustomAppBar(
            context,
            title: 'Danh sách khách hàng',
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Utils.appRouter.push(const CustomerEntryRoute());
            },
            child: const Icon(FontAwesomeIcons.plus),
          ),
          body: Column(
            children: [
              TDSearchBar(
                placeHolder: 'Tìm kiếm',
                style: TDSearchStyle.round,
                mediumStyle: true,
                onTextChanged: (String text) {
                  bloc.add(OnChangeString(text));
                },
              ),
              10.sized,
              Expanded(
                  child: SmartRefresher(
                controller: bloc.refreshController,
                onRefresh: () => bloc.add(const Started()),
                child: bloc.getCustomers.isEmpty
                    ? const EmptyWidget()
                    : SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: bloc.getCustomers
                              .map((e) => ListTile(
                                    title: (e.ten_khach_hang ?? '').size15,
                                    leading: CustomAvatar(
                                      avatar: e.hinh_khach_hang,
                                      name: e.ten_khach_hang,
                                    ),
                                    trailing: Icon(
                                      FontAwesomeIcons.trash,
                                      color: Colors.red,
                                      size: 15.sp,
                                    ).onTap(() {
                                      bloc.add(Delete(e.uid));
                                    }),
                                  ))
                              .toList(),
                        ),
                      ),
              ))
            ],
          ),
        );
      },
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomerListBloc(context),
      child: this,
    );
  }
}
