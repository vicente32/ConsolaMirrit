import 'package:jmc_hh/src/providers/estadoDr/dragon_provider.dart';
import 'package:rxdart/rxdart.dart';

class StatusBloc {
  final _estadoDragonController = BehaviorSubject<bool>();

  // Provider
  final _statusProvider = new StatusProvider();

  // Recuperar datos del stream
  Stream<bool> get estadoDragonStream =>
      _estadoDragonController.stream;
  
  // Insertar valores al stream
  Function(bool) get changeEstadoDragon =>
      _estadoDragonController.sink.add;
  
  // Obtener ultimo valor ingresado a los streams
  bool get estadoDragon => _estadoDragonController.value;
  
  dispose() {
    _estadoDragonController?.close();
  }

  // eventos
  void getStatusDragon() async {
    final estadoDragon =
        await _statusProvider.getStatus();
      _estadoDragonController.sink.add(estadoDragon);
  }

}