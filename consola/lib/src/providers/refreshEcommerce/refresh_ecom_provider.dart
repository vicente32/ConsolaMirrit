import 'package:jmc_hh/src/models/sinc/sinc_response.dart';
import '../../share_prefs/preferencia_usuario.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SincronizarProvider {
  final prefs = new PreferenciasUsuario();
  //final items = new ReprocesarArticuloPage();

  // ignore: missing_return
  Future<SincResponse> sincEcommerce(String codigo) async {

    String username = prefs.user;
    String password = prefs.password;
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));
    print(basicAuth); 
  
    final response = await http.get('${prefs.ip}/api/dragon/refresh-articulos/',
      headers: <String, String>{'Authorization': basicAuth});

    final decodedData = json.decode(response.body);
    print(decodedData);
  
  
    if (response.statusCode == 200) {
        final res = SincResponse.fromJsonMap(decodedData);
        print(res);
        print ("Conexión exitosa");
        return res;
    } 
      else {
        print ("Conexión fallida");
        return null;
    }
  } 
}