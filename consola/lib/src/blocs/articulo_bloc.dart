
import 'package:jmc_hh/src/providers/reprArt/rep_provider.dart';
import 'package:rxdart/rxdart.dart';

class ArticuloBloc {

  final _articuloController = BehaviorSubject<String>();
  final _resultadoController = BehaviorSubject<String>();

  ReprocesarArticuloProvider provider = new ReprocesarArticuloProvider();


  Stream<String> get articuloStream => _articuloController.stream;
  Stream<String> get resultadoStream => _resultadoController.stream;
  
  Function(String) get changeArticulo => _articuloController.sink.add;
  Function(String) get changeResultado => _resultadoController.sink.add;

  String get articulo => _articuloController.value;
  String get resultado => _resultadoController.value;

  dispose() {
      _articuloController?.close();
      _resultadoController?.close();
  }

  void getArt(String articulo) async {
    final res =  await provider.getArt(articulo);
    _resultadoController.sink.add(res);
  }


}