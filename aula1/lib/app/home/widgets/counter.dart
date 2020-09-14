import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({
    Key key,
  }) : super(key: key);
  @override
  CounterState createState() => CounterState();
}
//TODO
//Increment =>  + numero
//Estado => ?? State..Widget => Variavel
//

class CounterState extends State<Counter> {
  var count = 0;
  void increment() {
    count++;
    setState(() {});
    print(count);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("You have pushed the button this many times:"),
          Text(
            "$count",
            style: TextStyle(fontSize: 24),
          )
        ],
      ),
    );
  }
}
