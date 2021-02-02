import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'src/blocs/provider.dart';
import 'src/pages/general/settings_page.dart';
import 'src/routes/routes.dart';
import 'src/share_prefs/preferencia_usuario.dart';


const BE_HOST = 'https://api.dev';

class AppConfig {
  static String BE_ENDPOINT;
}

void main() async {
  if (kIsWeb) {
    AppConfig.BE_ENDPOINT = '$BE_HOST/web/';
  } else if (Platform.isAndroid) {
    AppConfig.BE_ENDPOINT = '$BE_HOST/android/';
  }
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
        initialRoute: SettingsPage.routName,
        routes: getApplicationRoutes(),
        theme: ThemeData(primarySwatch: Colors.blue)
      )
    );
  }
}
