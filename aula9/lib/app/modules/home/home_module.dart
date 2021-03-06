import 'package:aula9/app/modules/home/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularModularRouter> get ModularRouters => [
        ModularModularRouter(Modular.initialRoute, child: (_, __) => HomePage())
      ];
}
