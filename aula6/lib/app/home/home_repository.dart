import 'package:aula6/shared/models/product.dart';
import 'package:dio/dio.dart';

class HomeRepository {
  final client =
      Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"));

  Future<List<Product>> getProducts() async {
    final response = await client.get("/posts");
    return (response.data as List)
        .map((json) => Product.fromJson(json))
        .toList();
  }
}
