import 'package:aula6/shared/models/product.dart';
import 'package:flutter/foundation.dart';

class ShoppingController {
  static ShoppingController get instance {
    if (_instance == null) {
      _instance = ShoppingController();
    }
    return _instance;
  }

  static ShoppingController _instance;

  final itemsNotifier = ValueNotifier<List<Product>>(<Product>[]);

  List<Product> get items => itemsNotifier.value;

  void add(Product product) {
    final actual = items.toList();
    actual.add(product);
    itemsNotifier.value = actual;
  }

  void remove(int index) {
    final actual = items.toList();
    actual.removeAt(index);
    itemsNotifier.value = actual;
  }

  void dispose() {
    itemsNotifier.dispose();
  }

  String get amount => "${items.length}";
}
