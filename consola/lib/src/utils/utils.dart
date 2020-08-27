import 'package:flutter/material.dart';
void mostrarMensaje(
    {BuildContext context, String mensaje, Function() onBtnOkPressed}) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text('Consola Mirrit'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[Text(mensaje)],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                onBtnOkPressed();
              },
            ),
          ],
        );
      });
}