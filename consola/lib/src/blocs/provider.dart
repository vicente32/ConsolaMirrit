import 'package:flutter/material.dart';
import 'package:jmc_hh/src/blocs/articulo_bloc.dart';
import 'package:jmc_hh/src/blocs/status_bloc.dart';


class Provider extends InheritedWidget {
  static Provider _instancia;
  final statusBloc = new StatusBloc();
  final artBloc = new ArticuloBloc();

  factory Provider({Key key, Widget child}) {
    if (_instancia == null) {
      _instancia = new Provider._internal(key: key, child: child);
    }

    return _instancia;
  }

  Provider._internal({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static StatusBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>().statusBloc;
  }

  static ArticuloBloc articuloBloc (BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>().artBloc;
  }



}
