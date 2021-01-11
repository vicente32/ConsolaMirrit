import '../../share_prefs/preferencia_usuario.dart';
import '../../models/general/login_response.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginProvider {
  final prefs = new PreferenciasUsuario();

  Future<LoginResponse> getLogin() async {
    String username = prefs.user;
    String password = prefs.password;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    print(basicAuth);

    final response = await http.get('${prefs.process}/api/system/login',
        headers: <String, String>{'Authorization': basicAuth});

    final decodedData = json.decode(response.body);
    print(decodedData);

    if (response.statusCode == 200) {
      var res = LoginResponse.fromJsonMap(decodedData);
      res.statusCode = response.statusCode;
      print(res);
      print("Conexión exitosa");

      return res;
    } else {
      print("Conexión fallida");
      var res = new LoginResponse();
      res.statusCode = response.statusCode;
      res.status = "Error con Login";
      return res;
    }
  }
}
