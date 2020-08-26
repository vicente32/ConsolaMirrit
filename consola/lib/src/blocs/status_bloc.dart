import 'package:jmc_hh/src/providers/estadoDr/dragon_provider.dart';
import 'package:rxdart/rxdart.dart';

class StatusBloc {
  final _estadoDragonController = BehaviorSubject<bool>();
  final _estadoActiveController = BehaviorSubject<bool>();
  final _estadoWooController =    BehaviorSubject<bool>();

  // Provider
  final _statusProvider = new StatusProvider();

  // Recuperar datos del stream
  Stream<bool> get estadoDragonStream =>  _estadoDragonController.stream;
  Stream<bool> get estadoActiveStream =>  _estadoActiveController.stream;
  Stream<bool> get estadoWooStream =>     _estadoWooController.stream;
  
  // Insertar valores al stream
  Function(bool) get changeEstadoDragon =>  _estadoDragonController.sink.add;
  Function(bool) get changeEstadoActive =>  _estadoActiveController.sink.add;
  Function(bool) get changeEstadoWoo =>     _estadoWooController.sink.add;
  
  // Obtener ultimo valor ingresado a los streams
  bool get estadoDragon =>  _estadoDragonController.value;
  bool get estadoActive =>  _estadoActiveController .value;
  bool get estadoWoo =>   _estadoWooController .value;
  
  dispose() {
    _estadoActiveController?.close();
    _estadoDragonController?.close();
    _estadoWooController?.close();
  }

  // eventos
  void getStatus() async {
    final estadoGral =  await _statusProvider.getStatus();
      _estadoDragonController.sink.add(estadoGral.dragonFish.flagDragonOK);
      _estadoActiveController.sink.add(estadoGral.activeMQ.flagActiveMQOK);
            _estadoWooController.sink.add(estadoGral.woo.flagWooOK);
  }

}