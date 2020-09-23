import 'package:flutter/foundation.dart';

class Product {
  final String name;
  final String id;
  final int price;
  final String photoURL;

  Product(
      {@required this.name,
      @required this.id,
      @required this.price,
      this.photoURL});

  String get money =>
      "R\$ ${(price / 100.0).toStringAsFixed(2).replaceAll(".", ",")}";

  factory Product.fromJson(Map<String, dynamic> json) => Product(
      name: json['title'], id: "${json['id']}", price: json['id'] * 100);
}
