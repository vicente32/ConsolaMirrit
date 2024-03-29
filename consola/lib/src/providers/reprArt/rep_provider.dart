import 'package:jmc_hh/src/models/estadoDr/reprart_response.dart';

import '../../share_prefs/preferencia_usuario.dart';
import '../../pages/reprArt/consultarArt_page.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ReprocesarArticuloProvider {
  final prefs = new PreferenciasUsuario();
  //final items = new ConsultaArticuloPage();

  Future<String> getArt(String articulo) async {
    String username = prefs.user;
    String password = prefs.password;
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));
    print(basicAuth); 
  
    final response = await http.get('${prefs.ip}/api/dragon/articulo/'+articulo,
      headers: <String, String>{'Authorization': basicAuth});

    final decodedData = json.decode(response.body);
    print(decodedData);
  
  
    if (response.statusCode == 200) {
        final res = RepArtResponse.fromJsonMap(decodedData);
        print(res);
        print ("Conexión exitosa");
        return decodedData;
    } 
      else {
        print ("Conexión fallida");
        return "error";
    }
  
  }
}
