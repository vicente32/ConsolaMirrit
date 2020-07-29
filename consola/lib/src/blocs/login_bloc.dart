import 'dart:async';
import 'package:rxdart/rxdart.dart';
import '../blocs/validators.dart';

class LoginBloc with Validators {
  final _usuarioController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  // Recuperar datos del stream
  Stream<String> get usuarioStream =>
      _usuarioController.stream.transform(validarUsuario);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(validarPassword);

  // Validator
  Stream<bool> get formValidStream =>
      Observable.combineLatest2(usuarioStream, passwordStream, (u, p) => true);

  // Insertar valores al stream
  Function(String) get changeUsuario => _usuarioController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  // Obtener ultimo valor ingresado a los streams
  String get usuario => _usuarioController.value;
  String get password => _passwordController.value;

  dispose() {
    _usuarioController?.close();
    _passwordController?.close();
  }
}
