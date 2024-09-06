// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AddProductScreen]
class AddProductRoute extends PageRouteInfo<AddProductRouteArgs> {
  AddProductRoute({
    Key? key,
    int? uid,
    required String barcode,
    List<PageRouteInfo>? children,
  }) : super(
          AddProductRoute.name,
          args: AddProductRouteArgs(
            key: key,
            uid: uid,
            barcode: barcode,
          ),
          initialChildren: children,
        );

  static const String name = 'AddProductRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddProductRouteArgs>();
      return WrappedRoute(
          child: AddProductScreen(
        key: args.key,
        uid: args.uid,
        barcode: args.barcode,
      ));
    },
  );
}

class AddProductRouteArgs {
  const AddProductRouteArgs({
    this.key,
    this.uid,
    required this.barcode,
  });

  final Key? key;

  final int? uid;

  final String barcode;

  @override
  String toString() {
    return 'AddProductRouteArgs{key: $key, uid: $uid, barcode: $barcode}';
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const CategoryListScreen());
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const CustomerEntryScreen());
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const CustomerListScreen());
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const EmptyPageScreen();
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginRouteArgs>();
      return WrappedRoute(
          child: LoginScreen(
        key: args.key,
        onResult: args.onResult,
      ));
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OrderEntryRouteArgs>(
          orElse: () => const OrderEntryRouteArgs());
      return WrappedRoute(
          child: OrderEntryScreen(
        key: args.key,
        product: args.product,
      ));
    },
  );
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
    required void Function(
      BarcodeCapture,
      MobileScannerController,
    ) onResult,
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<QrScanRouteArgs>();
      return QrScanScreen(
        key: args.key,
        onResult: args.onResult,
      );
    },
  );
}

class QrScanRouteArgs {
  const QrScanRouteArgs({
    this.key,
    required this.onResult,
  });

  final Key? key;

  final void Function(
    BarcodeCapture,
    MobileScannerController,
  ) onResult;

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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const UnitListScreen());
    },
  );
}
