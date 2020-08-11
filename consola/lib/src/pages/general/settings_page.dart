import 'package:flutter/material.dart';
import 'package:jmc_hh/src/widgets/menu_widgets.dart';
import '../../share_prefs/preferencia_usuario.dart';

class SettingsPage extends StatefulWidget {
  static final String routName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

@override
class _SettingsPageState extends State<SettingsPage> {
  TextEditingController _textControllerIp;
  TextEditingController _textControllerUser;
  TextEditingController _textControllerPass;

  /* PREFERENCIAS */
  final prefs = new PreferenciasUsuario();
  String radioItem;

  /* --------- initState ---------- */
  @override
  void initState() {
    super.initState();
    _textControllerIp = new TextEditingController(text: prefs.ip);
    _textControllerUser = new TextEditingController(text: prefs.user);
    _textControllerPass = new TextEditingController(text: prefs.password);
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
    return AppBar(title: Text('Settings'), actions: <Widget>[
      // action button
      IconButton(
        icon: Icon(Icons.save),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Datos Registrados"),
                  shape: StadiumBorder(),
                );
              });
        },
      ),
      IconButton(
        icon: Icon(Icons.backspace),
        onPressed: () => Navigator.pop(context),
      )
    ]);
  }

  /* --------- form principal ---------- */
  Widget _crearBody() {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInputIp(),
          SizedBox(height: 30),
          _crearInputUser(),
          SizedBox(height: 30),
          _crearInputPassword(),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  /* --------- componentes del form ---------- */
  Widget _crearInputIp() {
    return TextField(
      autofocus: true,
      controller: _textControllerIp,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          helperText: 'IP',
          icon: Icon(Icons.data_usage)),
      onChanged: (value) {
        prefs.ip = value;
      },
    );
  }

  Widget _crearInputUser() {
    return StreamBuilder(
      initialData: prefs.user,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
            child: TextField(
              controller: _textControllerUser,
              decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
              helperText: 'User',
              errorText: snapshot.error,
              icon: Icon(Icons.account_circle)),
          onChanged: (value) {
            prefs.user = value;
          },
        ));
      },
    );
  }

  Widget _crearInputPassword() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
          child: TextField(
            controller: _textControllerPass,
            obscureText: true,
            decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            helperText: 'Password',
            errorText: snapshot.error,
            icon: Icon(Icons.lock)),
        onChanged: (value) {
          prefs.password = value;
        },
      ));
    });
  }
}
