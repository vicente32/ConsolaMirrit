import 'package:http/http.dart' as http;
import '../../share_prefs/preferencia_usuario.dart';
import 'dart:convert';
import '../../models/estadoDr/estadoDr_model.dart';

class RecepcionProvider {
  final prefs = new PreferenciasUsuario();

  /* --------- servicios ---------- */
  Future<bool> getRecepcion(String operacion, String sociedad) async {
    RecepcionRequest recepcionRequest =
        new RecepcionRequest(prefs.ip, prefs.user, prefs.password);

    final url = 'https://${prefs.ip}/api/dragon/status';

    final response =
        await http.post(url, body: recepcionRequestToJson(recepcionRequest));

    final decodedData = json.decode(response.body);
    print(decodedData);

    if (response.statusCode == 200) {
      final operacionresponse =
          new GetOperacionResponse.fromJsonMap(decodedData);
      return operacionresponse.operacion.result;
    } else {
      return false;
    }
  }
}
