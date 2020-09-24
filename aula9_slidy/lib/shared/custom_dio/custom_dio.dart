import 'package:aula9_slidy/shared/custom_dio/interceptors/log_interceptor.dart';
import 'package:dio/browser_imp.dart';

class CustomDio extends DioForBrowser {
  CustomDio() {
    options.baseUrl = "https://jsonplaceholder.typicode.com";
    interceptors.add(LogInterceptor());
  }
}
