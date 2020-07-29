import 'package:flutter/material.dart';
import '../pages/general/menuppal_page.dart';
import '../pages/general/settings_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    //--------------------- GENERAL --------------------------


    /* MENU PRINCIPAL */ 
    MenuPrincipalPage.routName: (BuildContext context) => MenuPrincipalPage(),

    /* SETTINGS */
    SettingsPage.routName: (BuildContext context) => SettingsPage(),



  };
}
