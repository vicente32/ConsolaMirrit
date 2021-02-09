
/* --------- Modelo ---------- */
class RepArtResponse {
  String basesAdicionales;

  RepArtResponse(this.basesAdicionales);

  RepArtResponse.fromJsonMap(Map<String, dynamic> json) {
    basesAdicionales = json['colorDescripcion'];
  }

}

