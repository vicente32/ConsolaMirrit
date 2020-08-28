import 'package:flutter/material.dart';
import '../../share_prefs/preferencia_usuario.dart';
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

  TextEditingController _textControllerDate;

  final prefs = new PreferenciasUsuario();
  final sincProvider = new SincronizarProvider();

  /* --------- build ---------- */
  @override

    void initState() {
    super.initState();
    _textControllerDate = new TextEditingController(text: prefs.date);

  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Sincronizar Dragonfish',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.w300,
          ),
          ),
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
                SizedBox(height: 25),
                _crearInputDate(),
                SizedBox(height: 30),
                _desdeUltimoProceso(bloc),
                SizedBox(height: 20),
                _desdeFecha(bloc),
                SizedBox(height: 20),
              ]),
        ),
      ]),
    );
  }

  /* --------- componentes del form ---------- */

  Widget _crearInputDate() {
    return TextField(
      autofocus: true,
      controller: _textControllerDate,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          helperText: 'Date (formato: 2019-08-31T00:00:00)',
          icon: Icon(Icons.calendar_today)), 
      onChanged: (value) {
        prefs.date = value;
      },
    );
  }


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

  _desdeFecha( SincronizarBloc bloc ) {
    return StreamBuilder(
      stream: bloc.sincStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ButtonTheme(
          minWidth: 250.0,
          height: 60.0,
          child: RaisedButton(
            child: Text('Desde fecha definida'),
            color: Colors.blue,
            textColor: Colors.white,
            shape: StadiumBorder(),
            onPressed: () => _accionSincFecha(bloc)
          ));
      }
    );
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


  _accionSincFecha(SincronizarBloc bloc) async {
    final respuesta = await sincProvider.sincDate(bloc.cod);
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