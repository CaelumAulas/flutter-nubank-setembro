import 'package:flutter/material.dart';
//TODO
//Adicionar o botao de voltar
//Adicionar o botao de editar
//Adicionar uma foto no topo (app bar sera?)
//Adicionar um background no topo
//Adicionar card com informacoes no topo
//Adicionar o Nome
//Adicionar uma descricao
//Adicionar uma tag de online

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      child: Column(
        children: [
          Container(
              height: size.height * .47,
              width: size.width,
              child: Stack(
                children: [
                  Container(
                    height: size.height * .44,
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Color(0xFFFF77C7),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Image.asset(
                        "assets/images/aula10_profile.png",
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0x19000000),
                                  blurRadius: 3.0,
                                  spreadRadius: 0.0,
                                  offset: Offset(
                                    0.0,
                                    1.0,
                                  ))
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InfoTile(
                                title: "139",
                                subtitle: "Tasks",
                                color: Color(0xFF301EE9),
                              ),
                              InfoTile(
                                title: "6",
                                subtitle: "Projects",
                                color: Color(0xFFFF77C7),
                              ),
                              InfoTile(
                                title: "19",
                                subtitle: "Completed",
                                color: Colors.green,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleIconButton(
                            icon: Icons.arrow_back_ios,
                            onPressed: () {},
                          ),
                          CircleIconButton(
                            icon: Icons.edit,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
          ProfileInfo()
        ],
      ),
    );
  }
}

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Adin\nCandrawinata",
            style: TextStyle(
              color: Color(0xFF4C578F),
              fontSize: 28,
              fontWeight: FontWeight.w800,
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text.rich(TextSpan(
                text: "Designer @ ",
                style: TextStyle(
                  color: Color(0xFF4C578F),
                ),
                children: [
                  TextSpan(
                      text: "Pixelz Studio",
                      style: TextStyle(
                          color: Color(0xFF4C578F),
                          fontWeight: FontWeight.bold))
                ])),
            Chip(
              label: Row(
                children: [
                  CircleAvatar(
                    radius: 4,
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    "Online",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              backgroundColor: Colors.green,
            ),
          ]),
        ],
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;
  const InfoTile({
    Key key,
    @required this.title,
    @required this.subtitle,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          subtitle,
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: color),
        )
      ],
    );
  }
}

class CircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const CircleIconButton({
    Key key,
    @required this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(500),
      onTap: onPressed,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: Icon(
          icon,
          color: Color(0xFF4C578F),
        ),
      ),
    );
  }
}
