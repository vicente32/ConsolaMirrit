import '../../models/system/system_response.dart';
import '../../share_prefs/preferencia_usuario.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SystemProvider {
  final prefs = new PreferenciasUsuario();

  
  Future<SystemResponse> systemStart() async {
    String username = prefs.user;
    String password = prefs.password;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    print(basicAuth);

    final response = await http.put('${prefs.process}/api/system/start',
        headers: <String, String>{'Authorization': basicAuth});

    final decodedData = json.decode(response.body);
    print(decodedData);

    if (response.statusCode == 200) {
      final res = SystemResponse.fromJsonMap(decodedData);
      print(res);
      print("Conexión exitosa");
      return res;
    } else {
      print("Conexión fallida");
      return null;
    }
  }

  Future<SystemResponse> systemStop() async {
    String username = prefs.user;
    String password = prefs.password;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    print(basicAuth);

    final response = await http.put('${prefs.process}/api/system/stop',
        headers: <String, String>{'Authorization': basicAuth});

    final decodedData = json.decode(response.body);
    print(decodedData);

    if (response.statusCode == 200) {
      final res = SystemResponse.fromJsonMap(decodedData);
      print(res);
      print("Conexión exitosa");
      return res;
    } else {
      print("Conexión fallida");
      return null;
    }
  }
}
