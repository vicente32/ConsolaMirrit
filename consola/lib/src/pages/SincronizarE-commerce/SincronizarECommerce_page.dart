import 'package:flutter/material.dart';
import 'package:jmc_hh/src/widgets/menu_widgets.dart';
import '../../share_prefs/preferencia_usuario.dart';

class SincronizarECommercePage extends StatefulWidget {
  static final String routName = 'sincronizarECommercer';

  @override
  _SinECommercePageState createState() => _SinECommercePageState();
}

@override
class _SinECommercePageState extends State<SincronizarECommercePage> {
  //TextEditingController _textControllerIp;
  bool valorTodos = false;
  bool valorWoo = false;
  bool valorShopify = false;

  /* PREFERENCIAS */
  final prefs = new PreferenciasUsuario();
  String radioItem;

  /* --------- initState ---------- */
  @override
  void initState() {
    super.initState();
    //_textControllerIp = new TextEditingController(text: prefs.ip);
  }

  /* --------- build ---------- */
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _crearAppBar(),
      drawer: MenuWidget(),
      body: _crearBody(),
    );
  }

  /* --------- appBar ---------- */
  Widget _crearAppBar() {
    return AppBar(
        title: Text('Sincronizar E-Commerce'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.backspace),
            onPressed: () => Navigator.pop(context),
          )
        ]);
  }

  /* --------- form principal ---------- */
  Widget _crearBody() {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(height: 30),
          _crearlista(context),
          SizedBox(height: 200),
          _crearbotonSincronizar(context),
        ],
      ),
    );
  }

  /* ----------- Boton Sincronizar ---------*/
  Widget _crearlista(BuildContext context) {
    return Column(
      children: <Widget>[
        CheckboxListTile(
          value: valorTodos,
          onChanged: (bool newValue) {
            setState(() {
              valorTodos = newValue;
              valorWoo = newValue;
              valorShopify = newValue;
            });
          },
          title: Text('Todos'),
        ),
        CheckboxListTile(
          value: valorWoo,
          onChanged: (bool newValue) {
            setState(() {
              valorWoo = newValue;
            });
          },
          title: Text('Woo'),
        ),
        CheckboxListTile(
          value: valorShopify,
          onChanged: (bool newValue) {
            setState(() {
              valorShopify = newValue;
            });
          },
          title: Text('Shopify'),
        ),
      ],
    );
  }

  /* ----------- Boton Sincronizar ---------*/
  Widget _crearbotonSincronizar(BuildContext context) {
    return RaisedButton(
      child: Text("Sincronizar"),
      shape: StadiumBorder(),
      onPressed: () {},
    );
  }
}
