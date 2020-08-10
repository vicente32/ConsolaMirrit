import 'dart:convert';

String recepcionModelToJson(RecepcionModel data) => json.encode(data.toJson());

class RecepcionModel {
  String _operacion;
  bool _existe;
  String _mensaje;

  static final RecepcionModel _recepcionModel = RecepcionModel._internal();

  RecepcionModel._internal() {
    _operacion = "";
    _existe = false;
    _mensaje = "";
  }

  static RecepcionModel get instance {
    return _recepcionModel;
  }

  void limpiarValores() {
    _operacion = "";
    _existe = false;
    _mensaje = "";
  }

  get operacion {
    return _operacion;
  }

  set operacion(String operacion) {
    this._operacion = operacion;
  }

  get existe {
    return _existe;
  }

  set existe(bool existe) {
    this._existe = existe;
  }

  get mensaje {
    return _mensaje;
  }

  set mensaje(String mensaje) {
    this._mensaje = mensaje;
  }

  Map<String, dynamic> toJson() => {};
}

/* --------- Request ---------- */

String recepcionRequestToJson(RecepcionRequest data) =>
    json.encode(data.toJson());

class RecepcionRequest {
  final String entorno;
  final String codigo;
  final String sociedad;

  RecepcionRequest(this.entorno, this.codigo, this.sociedad);

  Map<String, dynamic> toJson() =>
      {'entorno': entorno, 'codigo': codigo, 'sociedad': sociedad};
}

/* --------- Response ---------- */

class Operacion {
  bool result;
  Operacion.fromJsonMap(Map<String, dynamic> json) {
    result = json['result'];
  }
}

class GetOperacionResponse {
  Operacion operacion;
  GetOperacionResponse();
  GetOperacionResponse.fromJsonMap(dynamic jsonObject) {
    if (jsonObject == null) return;
    operacion = new Operacion.fromJsonMap(jsonObject);
  }
}
