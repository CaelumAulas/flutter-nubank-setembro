import 'package:aula8/shared/models/product.dart';
import 'package:dio/dio.dart';
import './home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final client =
      Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"));

  Future<List<Product>> getProducts() async {
    final response = await client.get("/posts");
    return (response.data as List)
        .map((json) => Product.fromJson(json))
        .toList();
  }
}
