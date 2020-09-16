import 'package:aula3/app/home/models/transfer.dart';
import 'package:aula3/app/home/widgets/transfer_card.dart';

import '../create_transfer/create_transfer_form.dart';
import 'package:flutter/material.dart';

//CreateTransfer
//HomePage
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final transfers = <Transfer>[];

  void navigateCreateTransfer() {
    print("click");
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CreateTransferForm(
                  onChange: (transfer) {
                    transfers.add(transfer);
                    setState(() {});
                  },
                )));
  }

  List<Widget> generateTransferCards() => transfers
      .map((e) => TransferCard(
            transfer: e,
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    print("BUILD HOME");
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: ListView(children: generateTransferCards()),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add), onPressed: navigateCreateTransfer),
    );
  }
}
