import 'package:flutter/material.dart';
import '../pages/estadoDr/sincronizarDragon_page.dart';
import '../pages/estadoSistema/estadosistema_page.dart';
import '../pages/general/menuppal_page.dart';
import '../pages/general/settings_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    //--------------------- GENERAL --------------------------

    /* MENU PRINCIPAL */
    MenuPrincipalPage.routName: (BuildContext context) => MenuPrincipalPage(),

    /* SINCRONIZACION DRAGON */
    SincronizarDragonPage.routName: (BuildContext context) => SincronizarDragonPage(),

    /* ESTADO SISTEMA */
    EstadoSistemaPage.routName: (BuildContext context) => EstadoSistemaPage(),

    /* SETTINGS */
    SettingsPage.routName: (BuildContext context) => SettingsPage(),
  };
}
