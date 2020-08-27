class SincResponse {
  final int transaccion;

  SincResponse({this.transaccion});

  factory SincResponse.fromJsonMap(Map<String, dynamic> json) {
    return SincResponse(transaccion: json['Transaccion']);
  }
}