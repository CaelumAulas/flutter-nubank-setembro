import 'package:aula3/app/home/models/transfer.dart';
import 'package:flutter/material.dart';

class TransferCard extends StatelessWidget {
  final Transfer transfer;

  const TransferCard({Key key, this.transfer}) : super(key: key);
  //TODO
  //Icon
  //Text -> Valor
  //Text ?? Subtext?? -> Numero De Conta
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
            "R\$ ${transfer.valor.toStringAsFixed(2).replaceAll(".", ",")}"),
        subtitle: Text("${transfer.conta}"),
        leading: Icon(Icons.monetization_on),
      ),
    );
  }
}
