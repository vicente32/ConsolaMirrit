import 'package:flutter/material.dart';
import 'package:jmc_hh/src/blocs/system_bloc.dart';
import 'package:jmc_hh/src/models/system/system_response.dart';
import '../../providers/system/system_provider.dart';
import '../../blocs/provider.dart';

class SystemPage extends StatefulWidget {
  static final String routName = 'systemPage';

  @override
  _SystemPageState createState() => _SystemPageState();
}

class _SystemPageState extends State<SystemPage> {
  final response = new SystemResponse();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'System',
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w300),
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
        _makeButtons(context),
      ])),
    );
  }

  /*---------BUTTONS-----------*/

  Widget _makeButtons(BuildContext context) {
    final blocSyst = Provider.systemBloc(context);
    return Column(children: [
      SizedBox(height: 150,),
      _startButton(blocSyst),
      SizedBox(height: 50),
      _stopButton(blocSyst)
    ]);
  }

  /*---------BUTTONS---------*/

  Widget _startButton(SystemBloc blocSyst) {
    return ButtonTheme(
        minWidth: 250.0,
        height: 60.0,
        child: RaisedButton(
            elevation: 1.0,
            child: Text('Start'),
            color: Colors.white,
            textColor: Colors.blue,
            shape: StadiumBorder(),
            onPressed: () {
              _makeStartSystem(blocSyst);
              print(blocSyst);
            }));
  }
  Widget _stopButton(SystemBloc blocSyst) {
    return ButtonTheme(
        minWidth: 250.0,
        height: 60.0,
        child: RaisedButton(
            elevation: 1.0,
            child: Text('Stop'),
            color: Colors.white,
            textColor: Colors.blue,
            shape: StadiumBorder(),
            onPressed: () {
              _makeStoptSystem(blocSyst);
              print(blocSyst);
            }));
  }

  /*-----ACTIONS-----*/
  _makeStartSystem(SystemBloc blocSyst) async {
    SystemProvider provider = new SystemProvider();
    final res = await provider.systemStart();
    print(res);
    if (res.status == 'Done') {
      blocSyst.systemStart();
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Capa de sistema inicializada'),
            );
          });
    }else { blocSyst.systemStart();
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error al inicializar la capa de sistema'),
            );
          });

    }
  }
  _makeStoptSystem(SystemBloc blocSyst) async {
    SystemProvider provider = new SystemProvider();
    final res = await provider.systemStop();
    print(res);
    if (res.status == 'Done') {
      blocSyst.systemStop();
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: StadiumBorder(),
              title: Text('Capa de sistema detenida'),
            );
          });
    }else { blocSyst.systemStop();
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: StadiumBorder(),
              title: Text('Error al detener la capa de sistema'),
            );
          });

    }
  }
}
