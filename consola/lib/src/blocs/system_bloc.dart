import '../providers/system/system_provider.dart';
import 'package:rxdart/rxdart.dart';

class SystemBloc {
  final _systemController = BehaviorSubject<String>();

  //provider

  final _systemProvider = new SystemProvider();

  // Recuperar datos del stream

  Stream<String> get systemStream => _systemController.stream;

  // Insertar valores al stream

  Function(String) get changesystem => _systemController.sink.add;

  // Obtener ultimo valor ingresado a los streams

  String get syst => _systemController.value;

  dispose() {
    _systemController?.close();
  }

  //eventos
  void systemStart() async {
    final systemStart = await _systemProvider.systemStart();
    _systemController.sink.add(systemStart.status);
  }
  void systemStop() async {
    final systemStart = await _systemProvider.systemStop();
    _systemController.sink.add(systemStart.status);
  }
}
