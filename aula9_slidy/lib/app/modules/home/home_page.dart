import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'bloc/home_bloc.dart';
import 'bloc/home_bloc.dart';
import 'bloc/home_state.dart';
import 'bloc/home_state.dart';
import 'bloc/home_state.dart';
import 'bloc/home_state.dart';
import 'bloc/home_state.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        cubit: controller,
        builder: (_, state) {
          switch (state.runtimeType) {
            case SuccessHomeState:
              {
                final data = (state as SuccessHomeState).data;
                return Center(
                  child: ListTile(
                    title: Text(data['title']),
                  ),
                );
              }
              break;
            case Error:
              {
                final error = (state as ErrorHomeState).message;
                return Center(
                  child: Text(error),
                );
              }
              break;

            default:
              return Center(
                child: CircularProgressIndicator(),
              );
          }
        },
      ),
    );
  }
}
