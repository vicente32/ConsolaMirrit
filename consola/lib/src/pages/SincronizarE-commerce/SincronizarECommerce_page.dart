import 'package:flutter/material.dart';
import 'package:jmc_hh/src/blocs/provider.dart';
import 'package:jmc_hh/src/blocs/refreshEcom_bloc.dart';
import 'package:jmc_hh/src/providers/refreshEcommerce/refresh_ecom_provider.dart';
import '../../share_prefs/preferencia_usuario.dart';
import 'package:jmc_hh/src/utils/utils.dart' as utils;

class SincronizarECommercePage extends StatefulWidget {
  static final String routName = 'sincronizarECommercer';

  @override
  _SinECommercePageState createState() => _SinECommercePageState();
}

@override
class _SinECommercePageState extends State<SincronizarECommercePage> {
  TextEditingController _textControllerEcommerce;


  /* PREFERENCIAS */
  final prefs = new PreferenciasUsuario();
    final refreshProvider = new RefreshProvider();
  String radioItem;

  /* --------- initState ---------- */
  @override
  void initState() {
    super.initState();
    _textControllerEcommerce = new TextEditingController(text: prefs.ecommerce);
  }

  /* --------- appBar ---------- */
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Sincronizar Ecommerce',
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
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 30),
                _crearInputEcommerce(),
                SizedBox(height: 30),
                _crearbotonSincronizar(context)
              ]),
        ),
      ]),
    );
  }


Widget _crearInputEcommerce() {
    return TextField(
      autofocus: true,
      controller: _textControllerEcommerce,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          helperText: 'woo/shopify',
          icon: Icon(Icons.shop)), 
      onChanged: (value) {
        prefs.ecommerce = value;
      },
    );
  }

  /* ----------- Boton Sincronizar ---------*/
  Widget _crearbotonSincronizar(BuildContext context) {
    final bloc = Provider.refresEcommercehBloc(context);
    return RaisedButton(
      elevation: 1.0,
      child: Text("Sincronizar"),
      color: Colors.white,
      textColor: Colors.blue,
      shape: StadiumBorder(),
      onPressed: () {
        _accionBotonSincronizar(bloc);
      },
    );
  }

/* --------- acciones --------- */

  void _accionBotonSincronizar(RefreshEcommerceBloc bloc) async {

    final respuesta = await refreshProvider.sincEcom(bloc.ecommerce);
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
