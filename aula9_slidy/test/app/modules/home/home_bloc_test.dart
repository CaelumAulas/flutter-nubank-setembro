import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:aula9_slidy/app/app_module.dart';

import '../../../../lib/app/modules/home/bloc/home_bloc.dart';
import '../../../../lib/app/modules/home/home_module.dart';

void main() {
  Modular.init(AppModule());
  Modular.bindModule(HomeModule());
  HomeBloc bloc;

  setUp(() {
    bloc = HomeModule.to.get<HomeBloc>();
  });

  group('HomeBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<HomeBloc>());
    });
  });
}
