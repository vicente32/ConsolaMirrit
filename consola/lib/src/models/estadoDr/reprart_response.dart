
/* --------- Modelo ---------- */
class RepArtResponse {
  String status;

  RepArtResponse();

  RepArtResponse.fromJsonMap(Map<String, dynamic> json) {
    status = json['status'];
  }

}

