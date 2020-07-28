import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia =
      new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  /* Configuracion */
  get url {
    return _prefs.getString('url') ?? '';
  }

  set url(String value) {
    _prefs.setString('url', value);
  }

  get entorno {
    return _prefs.getString('entorno') ?? '';
  }

  set entorno(String value) {
    _prefs.setString('entorno', value);
  }

  /* Login */
  get user {
    return _prefs.getString('user') ?? '';
  }

  set user(String value) {
    _prefs.setString('user', value);
  }
}
