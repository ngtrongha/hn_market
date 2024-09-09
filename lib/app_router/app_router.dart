import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hn_market/utils/extensions/string_extension.dart';
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
import '../screens/supplier_list/supplier_list.dart';
import '../screens/unit_list/unit_list.dart';
import '../utils/empty_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => Platform.isIOS
      ? const RouteType.cupertino()
      : const RouteType.material(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
        CustomRoute(
          page: AddProductRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          path: AddProductRoute.name.pathName,
        ),
        CustomRoute(
          page: LoginRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          path: LoginRoute.name.pathName,
        ),
        CustomRoute(
          page: QrScanRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          path: QrScanRoute.name.pathName,
        ),
        CustomRoute(
          page: CategoryListRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          path: CategoryListRoute.name.pathName,
        ),
        CustomRoute(
          page: UnitListRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          path: UnitListRoute.name.pathName,
        ),
        CustomRoute(
          page: OrderEntryRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          path: OrderEntryRoute.name.pathName,
        ),
        CustomRoute(
          page: CustomerEntryRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          path: CustomerEntryRoute.name.pathName,
        ),
        CustomRoute(
          page: CustomerListRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          path: CustomerListRoute.name.pathName,
        ),
        CustomRoute(
          page: SupplierListRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          path: SupplierListRoute.name.pathName,
        ),
        CustomRoute(
          page: HomeRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          path: HomeRoute.name.pathName,
          guards: [AuthGuard()],
          initial: true,
        ),
      ];
}

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    final isLogin = FirebaseAuth.instance.currentUser != null;
    if (isLogin) {
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
