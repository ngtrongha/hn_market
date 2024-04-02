import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../model/product_model/product_model.dart';
import '../screens/add_product/add_product.dart';
import '../screens/category_list/category_list.dart';
import '../screens/customer_entry/customer_entry.dart';
import '../screens/customer_list/customer_list.dart';
import '../screens/home/home.dart';
import '../screens/login/login.dart';
import '../screens/order_entry/order_entry.dart';
import '../screens/qr_scan/qr_scan.dart';
import '../screens/unit_list/unit_list.dart';
import '../utils/empty_page.dart';
import '../utils/utils.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => Platform.isIOS
      ? const RouteType.cupertino()
      : const RouteType.material(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: AddProductRoute.page,
        ),
        AutoRoute(
          page: LoginRoute.page,
        ),
        AutoRoute(
          page: QrScanRoute.page,
        ),
        AutoRoute(
          page: CategoryListRoute.page,
        ),
        AutoRoute(
          page: UnitListRoute.page,
        ),
        AutoRoute(
          page: OrderEntryRoute.page,
        ),
        AutoRoute(
          page: CustomerEntryRoute.page,
        ),AutoRoute(
          page: CustomerListRoute.page,
        ),
        AutoRoute(page: HomeRoute.page, initial: true, guards: [AuthGuard()]),
      ];
}

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    if (Utils.mainBloc.state.isLogin) {
      // if user is authenticated we continue
      resolver.next(true);
    } else {
      // we redirect the user to our login page
      // tip: use resolver.redirect to have the redirected route
      // automatically removed from the stack when the resolver is completed
      resolver.redirect(LoginRoute(onResult: (success) {
        // if success == true the navigation will be resumed
        // else it will be aborted
        resolver.next(success);
      }));
    }
  }
}
