import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:aula9_slidy/app/app_module.dart';
import 'package:aula9_slidy/app/modules/login/bloc/login_bloc.dart';
import 'package:aula9_slidy/app/modules/login/login_module.dart';

void main() {
  Modular.init(AppModule());
  Modular.bindModule(LoginModule());
  LoginBloc bloc;

  setUp(() {
    bloc = LoginModule.to.get<LoginBloc>();
  });

  group('LoginBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<LoginBloc>());
    });
  });
}
