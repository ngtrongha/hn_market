import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hn_market/utils/utils.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import 'bloc/category_list_bloc.dart';

@RoutePage()
class CategoryListScreen extends StatelessWidget implements AutoRouteWrapper {
  const CategoryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryListBloc, CategoryListState>(
      builder: (context, state) {
        final bloc = context.read<CategoryListBloc>();
        return CustomScaffold(
          appBar: CustomAppBar(
            context,
            title: 'Danh mục sản phẩm',
          ),
          floatingActionButton: FloatingActionButton.small(
            onPressed: () {
              bloc.add(const Create());
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
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: state.list_value
                        .where((element) =>
                            element.ten_danh_muc
                                ?.toLowerCase()
                                .contains(state.search_text.toLowerCase()) ??
                            false)
                        .map((e) => ListTile(
                              title: (e.ten_danh_muc ?? '').size15,
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
      create: (context) => CategoryListBloc(context)..add(const Started()),
      child: this,
    );
  }
}
