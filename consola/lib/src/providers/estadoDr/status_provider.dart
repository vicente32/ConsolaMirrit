import 'package:http/http.dart';
import '../../share_prefs/preferencia_usuario.dart';
import 'dart:convert';

class StatusProvider {
  final prefs = new PreferenciasUsuario();

  getStatus() async {
    String username = prefs.user;
    String password = prefs.password;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    print(basicAuth);

    Response r = await get('https://${prefs.ip}/api/dragon/status',
        headers: <String, String>{'Authorization': basicAuth});
  }
}

/* --------- servicios ---------- */
// Future<bool> getStatus() async {
//   RecepcionRequest recepcionRequest =
//       new RecepcionRequest(prefs.ip, prefs.user, prefs.password);

//   final url = 'https://${prefs.ip}/api/dragon/status';

//   final response =
//       await http.post(url, body: recepcionRequestToJson(recepcionRequest));

//   final decodedData = json.decode(response.body);
//   print(decodedData);

//   if (response.statusCode == 200) {
//     final operacionresponse =
//         new GetOperacionResponse.fromJsonMap(decodedData);
//     return operacionresponse.operacion.result;
//   } else {
//     return false;
//   }
// }
