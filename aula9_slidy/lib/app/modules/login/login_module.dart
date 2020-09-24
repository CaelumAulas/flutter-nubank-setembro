import 'package:aula9_slidy/app/modules/login/bloc/login_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:aula9_slidy/app/modules/login/login_page.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LoginBloc()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => LoginPage()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
