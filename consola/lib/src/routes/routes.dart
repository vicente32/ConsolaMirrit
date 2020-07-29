import 'package:flutter/material.dart';
import '../pages/general/menuppal_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    //--------------------- GENERAL --------------------------
    MenuPrincipalPage.routName: (BuildContext context) => MenuPrincipalPage(),
  };
}
