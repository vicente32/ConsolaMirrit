class LoginResponse {
  int statusCode;
  String status;

  LoginResponse({this.statusCode, this.status});

  factory LoginResponse.fromJsonMap(Map<String, dynamic> json) {
    return LoginResponse(status: json['status']);
  }
}
