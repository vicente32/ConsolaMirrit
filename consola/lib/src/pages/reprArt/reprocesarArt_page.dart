import 'package:flutter/material.dart';
import 'package:jmc_hh/src/blocs/provider.dart';
import '../../blocs/articulo_bloc.dart';
import '../../providers/reprArt/rep_provider.dart';


class ReprocesarArticuloPage extends StatefulWidget {
  @override
  ReprocesarArticuloState createState() => ReprocesarArticuloState();
  static final String routName = 'reprocesarArt';
}

class ReprocesarArticuloState extends State<ReprocesarArticuloPage> with TickerProviderStateMixin {

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
        title: Text('Reprocesar Artículo'),
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
    final  blocAart = Provider.articuloBloc(context);
    return Column(children: <Widget>[
      SizedBox(height: 30),
      _crearInputArt(context, blocAart),
      _crearTextoResultado(context, blocAart),
    ]);
  }

  /* ------------Input verison---------------- */
Widget _crearTextoResultado(BuildContext context, ArticuloBloc blocArt){
    return StreamBuilder(
      stream: blocArt.articuloStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
            child: TextField(
                autofocus: true,
                //controller: _controller,
                textCapitalization: TextCapitalization.characters,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    helperText: 'Artículo',
                    errorText: snapshot.error),
                onChanged: (value) {
                  blocArt.changeArticulo(value);
                },
                onSubmitted: (value) {
                  ReprocesarArticuloProvider provider = new ReprocesarArticuloProvider();
                  provider.getArt(value);
                  //_controller.clear();
                }));
      },
    );
}

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
                onSubmitted: (value) {
                  ReprocesarArticuloProvider provider = new ReprocesarArticuloProvider();
                  provider.getArt(value);
                  _controller.clear();
                }));
      },
    );
  }

}