import 'package:flutter/material.dart';

class CreateTransfer extends StatefulWidget {
  CreateTransfer({Key key}) : super(key: key);

  @override
  _CreateTransferState createState() => _CreateTransferState();
}

/// BOTAO DE VOLTAR ELE COLOCA AUTOMATICO?

// - Tela de Formulario
// - AppBar

// - 1 campo texto - OK
// - hint ?? (0000) - OK
// - Trocar de cor quando selecionado - OK
// - Animação do campo texto - OK

// - 2 campo texto com icone do dolar - OK
// - Trocar de cor quando selecionado - OK
// - hint ?? (0.00) - OK
// - mascara ?? - OK
// - Animação do campo texto - OK
class _CreateTransferState extends State<CreateTransfer> {
  String numeroDaConta;
  String valor;

  final numeroDaContaController = TextEditingController();
  final valorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //     icon: Icon(Icons.arrow_back),
        //     onPressed: () {
        //       Navigator.pop(context);
        //     }),
        title: Text("Criando transferência"),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: numeroDaContaController,
              onChanged: (value) => numeroDaConta = value,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Número da conta", hintText: "0000"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: valorController,
              onChanged: (value) => valor = value,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.monetization_on,
                    size: 16,
                  ),
                  labelText: "Valor",
                  hintText: "0.00"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: RaisedButton(
                color: Color(0xFF2a62ff),
                child: Text(
                  "Confirmar",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  print("Numero da conta: ${numeroDaContaController.text}");
                  print("Valor: ${valorController.text}");
                }),
          )
        ],
      ),
    );
  }
}
