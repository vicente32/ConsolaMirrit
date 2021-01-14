import 'package:flutter/material.dart';
import '../pages/reprArt/reprocesarArt_page.dart';
import '../pages/SincronizarE-commerce/SincronizarECommerce_page.dart';
import '../pages/estadoDr/sincronizarDragon_page.dart';
import '../pages/estadoSistema/estadosistema_page.dart';
import '../pages/general/menuppal_page.dart';
import '../pages/general/settings_page.dart';
import '../pages/system/system_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    //--------------------- GENERAL --------------------------

    /* MENU PRINCIPAL */
    MenuPrincipalPage.routName: (BuildContext context) => MenuPrincipalPage(),

    /* SYSTEM START/STOP */
    SystemPage.routName: (BuildContext context) => SystemPage(),

    /* SINCRONIZACION DRAGON */
    SincronizarDragonPage.routName: (BuildContext context) => SincronizarDragonPage(),

    /* ESTADO SISTEMA */
    EstadoSistemaPage.routName: (BuildContext context) => EstadoSistemaPage(),

    /* REPROCESAR ARTÍCLO */
    ReprocesarArticuloPage.routName: (BuildContext context) => ReprocesarArticuloPage(),

    /* SINCRONIZAR E-COMMERCE */
    SincronizarECommercePage.routName: (BuildContext context) => SincronizarECommercePage(),

    /* SETTINGS */
    SettingsPage.routName: (BuildContext context) => SettingsPage(),
  };
}
   