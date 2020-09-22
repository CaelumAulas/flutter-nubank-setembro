import 'package:aula6/shared/models/product.dart';

abstract class HomeRepository {
  Future<List<Product>> getProducts();
}
