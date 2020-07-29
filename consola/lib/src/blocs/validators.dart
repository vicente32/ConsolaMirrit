import 'dart:async';

class Validators {
  final validarUsuario = StreamTransformer<String, String>.fromHandlers(
      handleData: (usuario, sink) {
    if (usuario.length >= 4) {
      sink.add(usuario);
    } else {
      sink.addError('Ingrese el usuario');
    }
  });

  final validarPassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length >= 4) {
      sink.add(password);
    } else {
      sink.addError('Ingrese la password');
    }
  });
}
