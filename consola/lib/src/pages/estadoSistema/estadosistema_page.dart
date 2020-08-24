import 'package:flutter/material.dart';
import '../../providers/estadoDr/dragon_provider.dart';

class EstadoSistemaPage extends StatelessWidget {
  static final String routName = 'estadoSistema';
  final getStatus = new StatusProvider();

  String estadoA = "No funciona";
  String estadoD = "No funciona";
  String estadoW = "No funciona";
  String estadoS = "No funciona";

  /* --------- build ---------- */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Estado Sistema'),
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
    return Column(children: <Widget>[
      SizedBox(height: 15),
      _crearInputVersion(),
      SizedBox(height: 15),
      _crearTabla(context),
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
  Widget _crearTabla(BuildContext context) {
    return DataTable(columns: [
      DataColumn(label: Text("Servicios")),
      DataColumn(label: Text("Estado")),
      DataColumn(label: Text("Informacion")),
    ], rows: [
      DataRow(cells: [
        DataCell(Text("ActiveMQ")),
        DataCell(Text(estadoA)),
        DataCell(_botonDetalleDragon("ActiveMQ"))
      ]),
      DataRow(cells: [
        DataCell(Text("Woo")),
        DataCell(Text(estadoW)),
        DataCell(_botonDetalleDragon("Woo"))
      ]),
      DataRow(cells: [
        DataCell(Text("Shopify")),
        DataCell(Text(estadoS)),
        DataCell(_botonDetalleDragon("Shopify"))
      ]),
      DataRow(cells: [
        DataCell(Text("DragonFish")),
        DataCell(Text(estadoD)),
        DataCell(_botonDetalleDragon("DragonFish"))
      ])
    ]);
  }

/* ----------------- BOTONES ----------------- */

  void _estadoDragon() {
    getStatus.getStatus();
  }


  Widget _botonDetalleDragon(String servicio) {
    return RaisedButton(
      shape: StadiumBorder(),
      color: Colors.indigo[50],
      child: Text("DETALLE"),
      onPressed: () => _estadoDragon(),
    );
  }

  /* -------------acciones------------- */
   
 

}
