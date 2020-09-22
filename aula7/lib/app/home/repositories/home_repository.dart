import 'package:aula7/shared/models/product.dart';

abstract class HomeRepository {
  Future<List<Product>> getProducts();
}
