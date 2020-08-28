import 'package:flutter/material.dart';
import 'package:jmc_hh/src/blocs/provider.dart';
import 'package:jmc_hh/src/blocs/status_bloc.dart';
import '../../models/estadoDr/status_response.dart';
import '../../providers/estadoDr/dragon_provider.dart';

class EstadoSistemaPage extends StatefulWidget {
  static final String routName = 'estadoSistema';

  @override
  EstadoSistemaState  createState() => new EstadoSistemaState();

}

class EstadoSistemaState extends State<EstadoSistemaPage> {

  final getStatus = new StatusProvider();
  final dragonState = new DragonFishBloc();

  String estadoA = "No funciona";
  String estadoD = "No funciona";
  String estadoW = "No funciona";
  String estadoS = "No funciona";

  /* --------- build ---------- */    
  @override
  Widget build(BuildContext context) {
    //_estadoDragon();    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Estado Sistema',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.w300
          ),
        
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.backspace),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
      resizeToAvoidBottomPadding: false,
      body: Center(
          child: Stack(children: <Widget>[
        _crearMenuForm(context),
      ])),
    );
  }

  /* --------- form principal ---------- */
  Widget _crearMenuForm(BuildContext context) {
    final bloc = Provider.of(context);
    bloc.getStatus();
    return Column(children: <Widget>[
      SizedBox(height: 30),
      _crearInputVersion(),
      SizedBox(height: 30),
      _crearTabla(context, bloc),
    ]);
  }

  /* ------------Input verison---------------- */
  Widget _crearInputVersion() {
    return TextField(
      autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          helperText: 'Version',
          icon: Icon(Icons.arrow_right)),
    );
  }

  /* --------------Tabla----------*/
  Widget _crearTabla(BuildContext context, StatusBloc bloc) {

    return DataTable(columns: [
      DataColumn(label: Text("Servicios")),
      DataColumn(label: Text("Estado")),
      DataColumn(label: Text("Informacion")),
    ], rows: [
      DataRow(cells: [
        DataCell(Text("ActiveMQ")),
        DataCell(getEstadoActive(bloc)),
        DataCell(_botonDetalleServicio(bloc))
      ]),
      DataRow(cells: [
        DataCell(Text("Woo")),
        DataCell(getEstadoWoo(bloc)),
        DataCell(_botonDetalleServicio(bloc))
      ]),
      DataRow(cells: [
        DataCell(Text("Shopify")),
        DataCell(Text(estadoS)),
        DataCell(_botonDetalleServicio(bloc))
      ]),
      DataRow(cells: [
        DataCell(Text("DragonFish")),
        DataCell(getEstadoDragon(bloc)),
        DataCell(_botonDetalleServicio(bloc))
      ])
    ]);
  }

/* ----------------- BOTONES ----------------- */



  Widget _botonDetalleServicio(StatusBloc bloc) {
    return RaisedButton(
      shape: StadiumBorder(), 
      color: Colors.indigo[50],
      child: Text("DETALLLE"),
      onPressed: () => dragonState

    );
  }



  /* -------------acciones------------- */

  Widget getEstadoDragon(StatusBloc bloc){
      return StreamBuilder(
        stream: bloc.estadoDragonStream,
        builder: (BuildContext context,
          AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data) {
              return Text('OK',
                style: TextStyle(fontSize: 20));
            }
               else {
                return Text('Error',
                  style: TextStyle(fontSize: 20));
              }
            } else {
              return Text("Procesando");
            }
          });
  }

  Widget getEstadoActive(StatusBloc bloc){
      return StreamBuilder(
        stream: bloc.estadoActiveStream,
        builder: (BuildContext context,
          AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data) {
              return Text('OK',
                style: TextStyle(fontSize: 20));
            }
               else {
                return Text('Error',
                  style: TextStyle(fontSize: 20));
              }
            } else {
              return Text("Procesando");
            }
          });
  }


  Widget getEstadoWoo(StatusBloc bloc){
      return StreamBuilder(
        stream: bloc.estadoWooStream,
        builder: (BuildContext context,
          AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data) {
              return Text('OK',
                style: TextStyle(fontSize: 20));
            }
               else {
                return Text('Error',
                  style: TextStyle(fontSize: 20));
              }
            } else {
              return Text("Procesando");
            }
          });
  }

}
