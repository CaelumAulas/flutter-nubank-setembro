import 'dart:async';

import 'package:aula8/app/home/home_bloc.dart';
import 'package:aula8/app/home/home_state.dart';
import 'package:aula8/app/home/repositories/home_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBlocListener {
  final HomeBloc bloc;
  StreamSubscription subscription;
  HomeBlocListener(this.bloc) {
    subscription = bloc.listen((value) {
      print(value);
    });
  }
  void dispose() {
    subscription.cancel();
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bloc = HomeBloc(HomeRepositoryImpl());
  final flutterBloc = HomeFlutterBloc();
  HomeBlocListener subscription;
  @override
  void initState() {
    subscription = HomeBlocListener(bloc);
    super.initState();
  }

  @override
  void dispose() {
    flutterBloc.close();
    bloc.close();
    subscription.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: BlocConsumer<HomeBloc, HomeState>(
            cubit: bloc,
            builder: (_, state) => Text("Count $state"),
            listener: (_, state) {
              print(state);
            }),
      ),
      floatingActionButton: FloatingActionButton(onPressed: bloc.getProducts),
    );
  }
}
