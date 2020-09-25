import 'package:aula10/app/modules/intro/intro_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//TODO:
// - Imagem de fundo ( pode usar um container)
// - Cor de fundo
// - Titulo - 60% height de posicao
// - Subtitulo que ta uns 70% height de posicao

// - Page Indicator =>
// - Container mais claro
// - Container mais escuro variando de posição
class IntroPage extends StatefulWidget {
  const IntroPage({Key key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final introController = IntroController();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFFFF77C7),
      child: Stack(
        children: [
          PageView(
            controller: introController.pageController,
            children: [
              IntroWidget(
                title: "Ide Tanpa\nBatas",
                subtitle:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
              ),
              IntroWidget(
                title: "Rakuna Batata",
                subtitle:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
              ),
              IntroWidget(
                title: "Chuck Norris",
                subtitle:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
              ),
            ],
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: SafeArea(
                child: ValueListenableBuilder<int>(
                    valueListenable: introController.current,
                    builder: (_, current, __) => PageIndicator(
                          length: 3,
                          current: current,
                        )),
              )),
        ],
      ),
    );
  }
}

class IntroWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  const IntroWidget({
    Key key,
    @required this.title,
    @required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
            left: false,
            right: false,
            child: Container(
              height: size.height * .45,
              decoration: BoxDecoration(
                  color: Color(0xFFFF91D1),
                  image: DecorationImage(
                      image: AssetImage("assets/images/background_aula10.png"),
                      fit: BoxFit.cover)),
            ),
          ),
          Text(
            title,
            style: TextStyle(
                color: Color(0xFF394181),
                fontSize: 35,
                fontWeight: FontWeight.w800),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            subtitle,
            style: TextStyle(
              color: Color(0xFF394181),
            ),
          ),
          SizedBox(
            height: 80,
          ),
        ],
      ),
    );
  }
}

class PageIndicator extends StatelessWidget {
  final int length;
  final int current;
  const PageIndicator({
    Key key,
    @required this.length,
    @required this.current,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          length,
          (index) => Container(
            width: size.width * .1,
            decoration: BoxDecoration(
                color: index == current ? Color(0xFFFFFFFF) : Color(0xFFFF85CD),
                borderRadius: BorderRadius.circular(100)),
            height: 5,
          ),
        ));
  }
}
