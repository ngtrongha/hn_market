// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddProductRoute.name: (routeData) {
      final args = routeData.argsAs<AddProductRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: AddProductScreen(
          key: args.key,
          oldData: args.oldData,
          barcode: args.barcode,
        )),
      );
    },
    CategoryListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const CategoryListScreen()),
      );
    },
    CustomerEntryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const CustomerEntryScreen()),
      );
    },
    CustomerListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const CustomerListScreen()),
      );
    },
    EmptyRouteRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EmptyPageScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: LoginScreen(
          key: args.key,
          onResult: args.onResult,
        )),
      );
    },
    OrderEntryRoute.name: (routeData) {
      final args = routeData.argsAs<OrderEntryRouteArgs>(
          orElse: () => const OrderEntryRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: OrderEntryScreen(
          key: args.key,
          product: args.product,
        )),
      );
    },
    QrScanRoute.name: (routeData) {
      final args = routeData.argsAs<QrScanRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: QrScanScreen(
          key: args.key,
          onResult: args.onResult,
        ),
      );
    },
    UnitListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const UnitListScreen()),
      );
    },
  };
}

/// generated route for
/// [AddProductScreen]
class AddProductRoute extends PageRouteInfo<AddProductRouteArgs> {
  AddProductRoute({
    Key? key,
    ProductModel? oldData,
    required String barcode,
    List<PageRouteInfo>? children,
  }) : super(
          AddProductRoute.name,
          args: AddProductRouteArgs(
            key: key,
            oldData: oldData,
            barcode: barcode,
          ),
          initialChildren: children,
        );

  static const String name = 'AddProductRoute';

  static const PageInfo<AddProductRouteArgs> page =
      PageInfo<AddProductRouteArgs>(name);
}

class AddProductRouteArgs {
  const AddProductRouteArgs({
    this.key,
    this.oldData,
    required this.barcode,
  });

  final Key? key;

  final ProductModel? oldData;

  final String barcode;

  @override
  String toString() {
    return 'AddProductRouteArgs{key: $key, oldData: $oldData, barcode: $barcode}';
  }
}

/// generated route for
/// [CategoryListScreen]
class CategoryListRoute extends PageRouteInfo<void> {
  const CategoryListRoute({List<PageRouteInfo>? children})
      : super(
          CategoryListRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoryListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CustomerEntryScreen]
class CustomerEntryRoute extends PageRouteInfo<void> {
  const CustomerEntryRoute({List<PageRouteInfo>? children})
      : super(
          CustomerEntryRoute.name,
          initialChildren: children,
        );

  static const String name = 'CustomerEntryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CustomerListScreen]
class CustomerListRoute extends PageRouteInfo<void> {
  const CustomerListRoute({List<PageRouteInfo>? children})
      : super(
          CustomerListRoute.name,
          initialChildren: children,
        );

  static const String name = 'CustomerListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EmptyPageScreen]
class EmptyRouteRoute extends PageRouteInfo<void> {
  const EmptyRouteRoute({List<PageRouteInfo>? children})
      : super(
          EmptyRouteRoute.name,
          initialChildren: children,
        );

  static const String name = 'EmptyRouteRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    Key? key,
    required void Function(bool)? onResult,
    List<PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(
            key: key,
            onResult: onResult,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<LoginRouteArgs> page = PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({
    this.key,
    required this.onResult,
  });

  final Key? key;

  final void Function(bool)? onResult;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, onResult: $onResult}';
  }
}

/// generated route for
/// [OrderEntryScreen]
class OrderEntryRoute extends PageRouteInfo<OrderEntryRouteArgs> {
  OrderEntryRoute({
    Key? key,
    ProductModel? product,
    List<PageRouteInfo>? children,
  }) : super(
          OrderEntryRoute.name,
          args: OrderEntryRouteArgs(
            key: key,
            product: product,
          ),
          initialChildren: children,
        );

  static const String name = 'OrderEntryRoute';

  static const PageInfo<OrderEntryRouteArgs> page =
      PageInfo<OrderEntryRouteArgs>(name);
}

class OrderEntryRouteArgs {
  const OrderEntryRouteArgs({
    this.key,
    this.product,
  });

  final Key? key;

  final ProductModel? product;

  @override
  String toString() {
    return 'OrderEntryRouteArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [QrScanScreen]
class QrScanRoute extends PageRouteInfo<QrScanRouteArgs> {
  QrScanRoute({
    Key? key,
    required void Function(BarcodeCapture) onResult,
    List<PageRouteInfo>? children,
  }) : super(
          QrScanRoute.name,
          args: QrScanRouteArgs(
            key: key,
            onResult: onResult,
          ),
          initialChildren: children,
        );

  static const String name = 'QrScanRoute';

  static const PageInfo<QrScanRouteArgs> page = PageInfo<QrScanRouteArgs>(name);
}

class QrScanRouteArgs {
  const QrScanRouteArgs({
    this.key,
    required this.onResult,
  });

  final Key? key;

  final void Function(BarcodeCapture) onResult;

  @override
  String toString() {
    return 'QrScanRouteArgs{key: $key, onResult: $onResult}';
  }
}

/// generated route for
/// [UnitListScreen]
class UnitListRoute extends PageRouteInfo<void> {
  const UnitListRoute({List<PageRouteInfo>? children})
      : super(
          UnitListRoute.name,
          initialChildren: children,
        );

  static const String name = 'UnitListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
