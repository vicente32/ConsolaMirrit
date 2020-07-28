import 'package:flutter/material.dart';
import 'package:jmc_hh/src/blocs/provider.dart';
import 'package:jmc_hh/src/pages/general/menuppal_page.dart';
import 'package:jmc_hh/src/routes/routes.dart';
import 'package:jmc_hh/src/share_prefs/preferencia_usuario.dart';

void main() async {
  /* Se cargan preferencias */
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();

  /* Se inicia aplicación */
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  /* build */
  @override
  Widget build(BuildContext context) {
    return Provider(
        child: MaterialApp(
      title: 'Consola MIRRIT',
      debugShowCheckedModeBanner: false,
      initialRoute: MenuPrincipalPage.routName,
      routes: getApplicationRoutes(),
    ));
  }
}
