import 'package:jmc_hh/src/providers/SincDr/sincronizar_provider.dart';
import 'package:rxdart/rxdart.dart';

class SincronizarBloc {

  final _sincController = BehaviorSubject<String>();

  SincronizarProvider provider = new SincronizarProvider();


  Stream<String> get sincStream => _sincController.stream;
  
  Function(String) get changeSinc => _sincController.sink.add;

  String get cod => _sincController.value;

  dispose() {
      _sincController?.close();
  }
}