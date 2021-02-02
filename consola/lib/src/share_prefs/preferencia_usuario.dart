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

/*-------PROCESS LAYER IP NGROK-------*/
  String _process = "https://a9802e8d477e.ngrok.io";

  String get process => _process;

  set process(String value) => _process = value;

  /* Configuracion */
  get ip {
    return _prefs.getString('ip') ?? '';
  }

  set ip(String value) {
    _prefs.setString('ip', value);
  }

  /* Login */
  get user {
    return _prefs.getString('user') ?? '';
  }

  set user(String value) {
    _prefs.setString('user', value);
  }

  get password {
    return _prefs.getString('password') ?? '';
  }

  set password(String value) {
    _prefs.setString('password', value);
  }

  get date {
    return _prefs.getString('date') ?? '';
  }

  set date(String value) {
    _prefs.setString('date', value);
  }

  get ecommerce {
    return _prefs.getString('ecommerce') ?? '';
  }

  set ecommerce(String value) {
    _prefs.setString('ecommerce', value);
  }
}
