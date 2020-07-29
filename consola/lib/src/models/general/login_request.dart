import 'dart:convert';

String loginRequestToJson(LoginRequest data) => json.encode(data.toJson());

class LoginRequest {
  final String user;
  final String pass;

  LoginRequest( this.user, this.pass);

  Map<String, dynamic> toJson() => {
        'user': user,
        'pass': pass,
      };
}
