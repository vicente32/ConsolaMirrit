import 'package:flutter/material.dart';

class MenuPrincipalPage extends StatelessWidget {
  static final String routName = 'menuppal';

  /* --------- build ---------- */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Consola MIRRIT'),
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
                _crearBotonPicking(context),
                SizedBox(height: 20),
                _crearBotonRecepcion(context),
                SizedBox(height: 20),
                _crearBotonRecuento(context),
                SizedBox(height: 20),
                _crearBotonTransferencia(context),
                SizedBox(height: 20),
                _crearBotonSettings(context),
              ]),
        ),
      ]),
    );
  }

  /* --------- componentes del form ---------- */
  Widget _crearBotonPicking(BuildContext context) {
    return ButtonTheme(
        minWidth: 250.0,
        height: 60.0,
        child: RaisedButton(
          child: Text('Estado de Sistema'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () => _procesarAccionBotonPicking(context),
        ));
  }

  _crearBotonRecepcion(BuildContext context) {
    return ButtonTheme(
        minWidth: 250.0,
        height: 60.0,
        child: RaisedButton(
          child: Text('Procesar Articulo'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () => _procesarAccionBotonRecepcion(context),
        ));
  }

  _crearBotonRecuento(BuildContext context) {
    return ButtonTheme(
        minWidth: 250.0,
        height: 60.0,
        child: RaisedButton(
          child: Text('Sincronizar Articulos DRAGON'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () => _procesarAccionBotonRecuento(context),
        ));
  }

  _crearBotonTransferencia(BuildContext context) {
    return ButtonTheme(
        minWidth: 250.0,
        height: 60.0,
        child: RaisedButton(
          child: Text('Sincronizar E-Commerce'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () => _procesarAccionBotonTransferencia(context),
        ));
  }

  _crearBotonSettings(BuildContext context) {
    return ButtonTheme(
        minWidth: 250.0,
        height: 60.0,
        child: RaisedButton(
          child: Text('Settings'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () => _procesarAccionBotonTransferencia(context),
        ));
  }

  /* --------- acciones ---------- */
  _procesarAccionBotonPicking(BuildContext context) {
    //Navigator.pushNamed(context, MenuPickingPage.routName);
  }

  _procesarAccionBotonRecepcion(BuildContext context) {
    //Navigator.pushNamed(context, MenuRecepcionPage.routName);
  }

  _procesarAccionBotonRecuento(BuildContext context) {
    //Navigator.pushNamed(context, MenuRecuentoPage.routName);
  }

  _procesarAccionBotonTransferencia(BuildContext context) {
    //Navigator.pushNamed(context, MenuTransferenciaPage.routName);
  }
}
