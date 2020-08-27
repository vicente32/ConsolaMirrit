import 'package:flutter/material.dart';
import 'package:jmc_hh/src/blocs/provider.dart';
import 'package:jmc_hh/src/blocs/sincronizar_bloc.dart';
import '../../providers/SincDr/sincronizar_provider.dart';
import 'package:jmc_hh/src/utils/utils.dart' as utils;



class SincronizarDragonPage extends StatefulWidget {
  static final String routName = 'sincronizarDragon';

  @override
  SincronizarDragonState  createState() => new SincronizarDragonState();

}

class SincronizarDragonState extends State<SincronizarDragonPage> {

  final sincProvider = new SincronizarProvider();

  /* --------- build ---------- */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Sincronizar Dragonfish'),
      ),
      body: Center(
          child: Stack(children: <Widget>[
        _crearMenuForm(context),
      ])),
    );
  }

  /* --------- form principal ---------- */
  Widget _crearMenuForm(BuildContext context) {
    final bloc = Provider.sincronizarBloc(context);
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _desdeUltimoProceso(bloc),
                SizedBox(height: 20),
                _desdeFecha(),
                SizedBox(height: 20),
              ]),
        ),
      ]),
    );
  }

  /* --------- componentes del form ---------- */

  _desdeUltimoProceso(SincronizarBloc bloc) {
    return StreamBuilder(
      stream: bloc.sincStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ButtonTheme(
          minWidth: 250.0,
          height: 60.0,
          child: RaisedButton(
            child: Text('Desde ultimo proceso'),
            color: Colors.blue,
            textColor: Colors.white,
            shape: StadiumBorder(),
            onPressed: () => _accionBotonUltProceso(bloc)
          ));
      }
    );
  }

  _desdeFecha() {
    return ButtonTheme(
        minWidth: 250.0,
        height: 60.0,
        child: RaisedButton(
          child: Text('Desde fecha a definir'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () {
          } 
        ));
  }

/* ACCIONES DE BOTONES */

 void _accionBotonUltProceso(SincronizarBloc bloc) async {
    final respuesta = await sincProvider.sincUP(bloc.cod);
      if(respuesta != null){
          utils.mostrarMensaje(
            context: context,
            mensaje: "Transacción generada: " + respuesta.transaccion.toString(),
            onBtnOkPressed: () => Navigator.of(context).pop());          
      }
      else {
          utils.mostrarMensaje(
            context: context,
            mensaje: "Error al generar transacción",
            onBtnOkPressed: () => Navigator.of(context).pop());          
      }
  }


}