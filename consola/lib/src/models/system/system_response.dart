class SystemResponse {
  final String status;

  SystemResponse({this.status});

  factory SystemResponse.fromJsonMap(Map<String, dynamic> json) {
    return SystemResponse(status: json['status']);
  }
}
