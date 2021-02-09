import 'package:flutter/material.dart';
import 'package:jmc_hh/src/blocs/provider.dart';
import 'package:jmc_hh/src/pages/reprArt/detailArt_page.dart';
import '../../blocs/articulo_bloc.dart';
import '../../providers/reprArt/rep_provider.dart';
import 'package:jmc_hh/src/utils/utils.dart' as utils;


class ConsultaArticuloPage extends StatefulWidget {
  @override
  ConsultaArticuloState createState() => ConsultaArticuloState();
  static final String routName = 'consultarArt';
}

class ConsultaArticuloState extends State<ConsultaArticuloPage> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
      child: Icon(Icons.cached),
      onPressed: () {
        
      },  
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Consultar',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.w300
          )
        )
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
    final  blocAart = Provider.articuloBloc(context);
    return Column(children: <Widget>[
      SizedBox(height: 30),
      _crearInputArt(context, blocAart),
    ]);
  }

  /* ------------Input verison---------------- */
Widget _crearInputArt(BuildContext context, ArticuloBloc blocArt) {
    final TextEditingController _controller = new TextEditingController();
    return StreamBuilder(
      stream: blocArt.articuloStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
            child: TextField(
                autofocus: true,
                controller: _controller,
                textCapitalization: TextCapitalization.characters,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    helperText: 'Artículo',
                    errorText: snapshot.error),
                  onChanged: (value) {
                  blocArt.changeArticulo(value);
                },
                onSubmitted: (value) async {
                  ReprocesarArticuloProvider provider = new ReprocesarArticuloProvider();
                  final res = await provider.getArt(value);
                  Navigator.pushNamed(context, DetailArtPage().routName);
                  _controller.clear();
                }));
      },
    );
  }

}