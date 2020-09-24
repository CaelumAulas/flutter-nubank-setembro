import 'package:aula9_slidy/app/modules/login/login_module.dart';
import 'package:aula9_slidy/shared/custom_dio/custom_dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:aula9_slidy/app/app_widget.dart';
import 'package:aula9_slidy/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [Bind((i) => CustomDio())];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', module: LoginModule()),
        ModularRouter('/home', module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
