import 'package:flutter/material.dart';
import 'package:jmc_hh/src/pages/general/menuppal_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    //--------------------- GENERAL --------------------------
    MenuPrincipalPage.routName: (BuildContext context) => MenuPrincipalPage(),
  };
}
