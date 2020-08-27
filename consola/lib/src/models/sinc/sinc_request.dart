import 'dart:convert';

String sincRequestToJson(SincRequest data) => json.encode(data.toJson());

class SincRequest {
  final String transaccion;

  SincRequest(this.transaccion);

  Map<String, dynamic> toJson() => { 'Transaccion': transaccion };
}
