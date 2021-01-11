import 'dart:io';
import '../../share_prefs/preferencia_usuario.dart';
import '../../models/estadoDr/status_response.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class StatusProvider {
  final prefs = new PreferenciasUsuario();

  Future<GetStatusResponseBloc> getStatus() async {
    String username = prefs.user;
    String password = prefs.password;
    String html = 'text/html';
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    print(basicAuth);

    final response =
        await http.get('${prefs.process}/api/dragon/status', headers: {
      HttpHeaders.authorizationHeader: basicAuth,
      HttpHeaders.acceptCharsetHeader: html
    });

    final decodedData = json.decode(response.body);
    print(decodedData);

    if (response.statusCode == 200) {
      final res = GetStatusResponseBloc.fromJson(decodedData);
      print(res);
      print("Conexión exitosa");
      return res;
    } else {
      print("Conexión fallida");
      return null;
    }
  }
}
