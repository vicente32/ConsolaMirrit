  import 'package:flutter/material.dart';

class ReprocesarArticuloPage extends StatelessWidget {
  static final String routName = 'reprocesarArt';

  /* --------- build ---------- */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Reprocesar Artículo'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.backspace),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
      resizeToAvoidBottomPadding: false,
      body: Align(
        alignment: Alignment.topLeft,
          child: Stack(children: <Widget>[
        _crearMenuForm(context),
      ])),
    );
  }

  /* --------- form principal ---------- */
  Widget _crearMenuForm(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
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
    return DataTable(
     columns:[
       DataColumn(
         label: Text("código"),
         numeric:true
       )
     ],
     rows: [
       DataRow(
         cells: [
           DataCell(
            Text("código"),
            placeholder: true,
            showEditIcon: true 
           ),
         ]
      ),
      DataRow(
         cells: [
           DataCell(
            Text("código"),
            placeholder: true,
           ),
         ]
      ),
      DataRow(
         cells: [
           DataCell(
            Text("código"),
            placeholder: true,
           ),
         ]
      ),
      DataRow(
         cells: [
           DataCell(
            Text("código"),
            placeholder: true,
           ),
         ]
      ),
      DataRow(
         cells: [
           DataCell(
            Text("código"),
            placeholder: true,
           ),
         ]
      ),
     ]
    
    );

  }
}