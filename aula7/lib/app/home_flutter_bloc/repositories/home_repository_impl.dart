import 'package:aula7/app/home/repositories/home_repository.dart';
import 'package:aula7/shared/models/product.dart';
import 'package:dio/dio.dart';

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
