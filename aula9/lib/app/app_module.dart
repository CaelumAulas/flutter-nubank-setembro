import 'package:aula9/app/app_widget.dart';
import 'package:aula9/app/modules/home/home_module.dart';
import 'package:aula9/app/modules/login/login_module.dart';
import 'package:aula9/shared/auth/authentication_controller.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [Bind((i) => AutheticationController())];

  @override
  List<ModularRouter> get routers => [
        ModularRouter("/login", module: LoginModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
