import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';
import 'repositories/home_repository_impl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bloc = HomeBloc(repository: HomeRepositoryImpl());

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                bloc.add(DeleteProduct("id"));
              })
        ],
      ),
      body: Center(
        child: BlocBuilder<HomeBloc, HomeState>(
            cubit: bloc,
            builder: (context, state) {
              switch (state.runtimeType) {
                case Loading:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                  break;
                case Success:
                  {
                    final products = (state as Success).products;
                    return ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, index) => ListTile(
                              title: Text(products[index].name),
                              trailing: Text("${products[index].money}"),
                              onTap: () {},
                            ));
                  }
                  break;
                case Error:
                  {
                    final error = state as Error;
                    return Center(child: Text(error.message));
                  }
                default:
                  return Center(
                    child: Text("Click no FAB"),
                  );
              }
            }),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        bloc.add(GetProducts());
      }),
    );
  }
}
