import '../../share_prefs/preferencia_usuario.dart';
import '../../pages/reprArt/reprocesarArt_page.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ReprocesarArticuloProvider {
  final prefs = new PreferenciasUsuario();
  final items = new ReprocesarArticuloPage();

  Future<String> getArt(String articulo) async {
    String username = prefs.user;
    
    String password = prefs.password;
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));
    print(basicAuth); 
  
    final response = await http.get('${prefs.ip}/api/dragon/refresh-articulo/'+articulo,
      headers: <String, String>{'Authorization': basicAuth});

    final decodedData = json.decode(response.body);
    print(decodedData);
  
  
    if (response.statusCode == 200) {
        //final res = String.fromJson(decodedData);
        //print(res);
      print ("Conexión exitosa");
      return "done";
    } 
      else {
        print ("Conexión fallida");
        return "error";
    }
  
  }
}
