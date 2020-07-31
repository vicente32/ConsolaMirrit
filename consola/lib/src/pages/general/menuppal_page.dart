import 'package:flutter/material.dart';
import 'settings_page.dart';
import '../estadoDr/sincronizarDragon_page.dart';
import '../reprArt/reprocesarArt_page.dart';
import '../estadoSistema/estadosistema_page.dart';
import '../SincronizarE-commerce/SincronizarECommerce_page.dart';

class MenuPrincipalPage extends StatelessWidget {
  static final String routName = 'MenuPrincipalPage';

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
                _crearBotonEstadoSistema(context),
                SizedBox(height: 20),
                _crearBotonProcesarArt(context),
                SizedBox(height: 20),
                _crearBotonSincronizarDragon(context),
                SizedBox(height: 20),
                _crearBotonSincronizarEcommerce(context),
                SizedBox(height: 20),
                _crearBotonSettings(context),
              ]),
        ),
      ]),
    );
  }

  /* --------- componentes del form ---------- */
  Widget _crearBotonEstadoSistema(BuildContext context) {
    return ButtonTheme(
        minWidth: 250.0,
        height: 60.0,
        child: RaisedButton(
          child: Text('Estado de Sistema'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () => _procesarAccionEstadoSistema(context),
        ));
  }

  _crearBotonProcesarArt(BuildContext context) {
    return ButtonTheme(
        minWidth: 250.0,
        height: 60.0,
        child: RaisedButton(
          child: Text('Procesar Articulo'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () {
           _procesarProcesarArt(context);
            print("reprocesar articulo");          
          }
        ));
  }

  _crearBotonSincronizarDragon(BuildContext context) {
    return ButtonTheme(
        minWidth: 250.0,
        height: 60.0,
        child: RaisedButton(
          child: Text('Sincronizar Articulos Dragon'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () => _procesarSincronizarDragon(context),
        ));
  }

  _crearBotonSincronizarEcommerce(BuildContext context) {
    return ButtonTheme(
        minWidth: 250.0,
        height: 60.0,
        child: RaisedButton(
          child: Text('Sincronizar E-Commerce'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () => _procesarSincronizarEcommerce(context),
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
          onPressed: () => _procesarAccionBotonSettings(context),
        ));
  }

  /* --------- acciones ---------- */
  _procesarAccionEstadoSistema(BuildContext context) {
    Navigator.pushNamed(context, EstadoSistemaPage.routName);
  }

  _procesarProcesarArt(BuildContext context) {
    Navigator.pushNamed(context, ReprocesarArticuloPage.routName);
  }

  _procesarSincronizarDragon(BuildContext context) {
    Navigator.pushNamed(context, SincronizarDragonPage.routName);
  }

  _procesarSincronizarEcommerce(BuildContext context) {
    Navigator.pushNamed(context, SincronizarECommercePage.routName);
  }

  _procesarAccionBotonSettings(BuildContext context) {
    Navigator.pushNamed(context, SettingsPage.routName);
  }
}
