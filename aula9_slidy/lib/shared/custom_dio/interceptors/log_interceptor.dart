import 'package:dio/dio.dart';

class LogInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) {
    print("REQ: -> ${options.path} -> METHOD: ${options.method}");
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    print("RES -> data: ${response.data}");
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    print(
        "ERROR -> data: ${err.response.data} -> StatusCode: ${err.response.statusCode}");
    return super.onError(err);
  }
}
