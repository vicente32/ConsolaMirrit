import 'package:flutter/material.dart';
<<<<<<< HEAD
import '../pages/SincronizarE-commerce/SincronizarECommerce_page.dart';
=======
import '../pages/estadoDr/sincronizarDragon_page.dart';
>>>>>>> 623a0eec531ba33b1fe718112ca439ef5a3c6fed
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

    /* SINCRONIZAR E-COMMERCE */
    SincronizarECommercePage.routName: (BuildContext context) =>
        SincronizarECommercePage(),

    /* SETTINGS */
    SettingsPage.routName: (BuildContext context) => SettingsPage(),
  };
}
