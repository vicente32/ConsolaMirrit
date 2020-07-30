import 'package:flutter/material.dart';

class EstadoSistemaPage extends StatelessWidget {
  static final String routName = 'estadoSistema';

  /* --------- build ---------- */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Estado Sistema'),
      ),
      body: Center(
          child: Stack(children: <Widget>[
        _crearMenuForm(context),
      ])),
    );
  }

  /* --------- form principal ---------- */
  Widget _crearMenuForm(BuildContext context) {
    return SingleChildScrollView(child: _crearTabla(context));
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
        DataCell(Text("EstadoRojo")),
        DataCell(Text("DETALLE"))
      ]),
      DataRow(cells: [
        DataCell(Text("Woo")),
        DataCell(Text("EstadoRojo")),
        DataCell(Text("DETALLE"))
      ]),
      DataRow(cells: [
        DataCell(Text("Shopify")),
        DataCell(Text("EstadoRojo")),
        DataCell(Text("DETALLE"))
      ]),
      DataRow(cells: [
        DataCell(Text("DragonFish")),
        DataCell(Text("EstadoRojo")),
        DataCell(Text("DETALLE"))
      ])
    ]);
  }
}
