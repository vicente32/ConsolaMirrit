import 'package:flutter/material.dart';



class SincronizarDragonPage extends StatelessWidget {
  static final String routName = 'sincronizarDragon';

  /* --------- build ---------- */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Sincronizar Dragonfish'),
      ),
      body: Center(
          child: Stack(children: <Widget>[
        _crearMenuForm(context),
      ])),
    );
  }

  /* --------- form principal ---------- */
  Widget _crearMenuForm(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _desdeUltimoProceso(context),
                SizedBox(height: 20),
                _desdeFecha(context),
                SizedBox(height: 20),
              ]),
        ),
      ]),
    );
  }

  /* --------- componentes del form ---------- */

  _desdeUltimoProceso(BuildContext context) {
    return ButtonTheme(
        minWidth: 250.0,
        height: 60.0,
        child: RaisedButton(
          child: Text('Procesar Articulo'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () {},
        ));
  }

  _desdeFecha(BuildContext context) {
    return ButtonTheme(
        minWidth: 250.0,
        height: 60.0,
        child: RaisedButton(
          child: Text('Sincronizar Articulos Dragon'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () {},
        ));
  }

  // Widget _crearBotonEstadoSistema(BuildContext context) {
  //   return ButtonTheme(
  //       minWidth: 250.0,
  //       height: 60.0,
  //       child: RaisedButton(
  //         child: Text('Estado de Sistema'),
  //         color: Colors.blue,
  //         textColor: Colors.white,
  //         shape: StadiumBorder(),
  //         onPressed: () => _procesarAccionEstadoSistema(context),
  //       ));
  // }

}