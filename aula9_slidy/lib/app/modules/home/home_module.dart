import 'package:aula9_slidy/app/modules/home/home_repository.dart';
import 'package:aula9_slidy/app/modules/home/bloc/home_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:aula9_slidy/app/modules/home/home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeRepository(client: i())),
        Bind((i) => HomeBloc(repository: i())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
