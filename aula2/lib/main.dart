//TODO
//Criar a UI
// - Tela Home - OK
// - Navegar para a tela de formulario

// - Tela de Formulario
// - AppBar - ok

// - 1 campo texto - ok
// - hint ?? (0000) - ok
// - Trocar de cor quando selecionado - ok
// - Animação do campo texto - ok

// - 2 campo texto com icone do dolar - ok
// - Trocar de cor quando selecionado - ok
// - hint ?? (0.00) - ok
// - mascara ?? - ok
// - Animação do campo texto - ok

// - Botao - ok

// - NAVEGACAO?

import 'package:aula2/app/home/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF1c5e20),
      ),
      home: HomePage(),
    );
  }
}
