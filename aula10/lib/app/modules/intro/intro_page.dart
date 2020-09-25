import 'package:flutter/material.dart';

//TODO:
// - Imagem de fundo ( pode usar um container)
// - Cor de fundo
// - Titulo - 60% height de posicao
// - Subtitulo que ta uns 70% height de posicao

// - Page Indicator =>
// - Container mais claro
// - Container mais escuro variando de posição
class IntroPage extends StatelessWidget {
  const IntroPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("intro page"),
    );
  }
}
