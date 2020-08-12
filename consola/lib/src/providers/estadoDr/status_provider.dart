import 'package:http/http.dart';
import '../../share_prefs/preferencia_usuario.dart';
import 'dart:convert';

class StatusProvider {
  final prefs = new PreferenciasUsuario();

  Future<String> getStatus() async {
    String username = prefs.user;
    String password = prefs.password;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    print(basicAuth);

    final response = await get('https://${prefs.ip}:8083/api/dragon/status',
        headers: <String, String>{'Authorization': basicAuth});
    final decodedData = json.decode(response.body);
    print(decodedData);

    if (response.statusCode == 200) {
      return "Conexión exitosa";
    } else {
      return "Conexión fallida";
    }
  }
}

/* --------- servicios ---------- */
// Future<bool> getStatus() async {
//   RecepcionRequest recepcionRequest =
//       new RecepcionRequest(prefs.ip, prefs.user, prefs.password);

//   final url = 'https://${prefs.ip}/api/dragon/status';

//   final response =
//       await http.post(url, body: recepcionRequestToJson(recepcionRequest));
