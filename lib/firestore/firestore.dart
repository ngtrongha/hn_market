// import 'package:hn_market/model/customer_model/customer_model.dart';

// import '../model/order_model/order_model.dart';
// import 'firestore.dart';

// export 'package:hn_market/model/category_model/category_model.dart';
// export 'package:hn_market/model/unit_model/unit_model.dart';
// export 'package:hn_market/model/product_model/product_model.dart';
// export 'package:cloud_firestore/cloud_firestore.dart';

// class MyFirestore {
//   static const products = 'products';
//   static const categories = 'categories';
//   static const units = 'units';
//   static const orders = 'orders';
//   static const customers = 'customers';
//   CollectionReference<CustomerModel> getCustomersCollection() {
//     return FirebaseFirestore.instance
//         .collection(customers)
//         .withConverter<CustomerModel>(
//             fromFirestore: (snapshot, _) =>
//                 CustomerModel.fromJson(snapshot.data()!),
//             toFirestore: (value, _) => value.toJson());
//   }

//   CollectionReference<OrderModel> getOrdersCollection() {
//     return FirebaseFirestore.instance
//         .collection(orders)
//         .withConverter<OrderModel>(
//           fromFirestore: (snapshot, _) => OrderModel.fromJson(snapshot.data()!),
//           toFirestore: (value, _) => value.copyWith(list_product: []).toJson()
//             ..update('list_product',
//                 (data) => value.list_product.map((e) => e.toJson())),
//         );
//   }

//   CollectionReference<ProductModel> getProductsCollection() {
//     return FirebaseFirestore.instance
//         .collection(products)
//         .withConverter<ProductModel>(
//           fromFirestore: (snapshot, _) =>
//               ProductModel.fromJson(snapshot.data()!),
//           toFirestore: (value, _) => value.copyWith(price_list: []).toJson()
//             ..update('price_list',
//                 (data) => value.price_list.map((e) => e.toJson()).toList()),
//         );
//   }

//   CollectionReference<CategoryModel> getCategoryCollection() {
//     return FirebaseFirestore.instance
//         .collection(categories)
//         .withConverter<CategoryModel>(
//           fromFirestore: (snapshot, _) =>
//               CategoryModel.fromJson(snapshot.data()!),
//           toFirestore: (value, _) => value.toJson(),
//         );
//   }

//   CollectionReference<UnitModel> getUnitCollection() {
//     return FirebaseFirestore.instance
//         .collection(units)
//         .withConverter<UnitModel>(
//           fromFirestore: (snapshot, _) => UnitModel.fromJson(snapshot.data()!),
//           toFirestore: (value, _) => value.toJson(),
//         );
//   }
// }
