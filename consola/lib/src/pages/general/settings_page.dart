import 'package:flutter/material.dart';
import 'package:jmc_hh/src/pages/general/menuppal_page.dart';
import '../../share_prefs/preferencia_usuario.dart';
import '../../providers/login/login_provider.dart';

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
  final getLogin = new LoginProvider();

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
      body: _crearBody(),
    );
  }

  /* --------- appBar ---------- */
  Widget _crearAppBar() {
    return AppBar(
        title: Text('Login',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.w300,
            )),
        centerTitle: true);
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
          _loginButton(context),
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
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
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
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            helperText: 'Password',
            errorText: snapshot.error,
            icon: Icon(Icons.lock)),
        onChanged: (value) {
          prefs.password = value;
        },
      ));
    });
  }

  _loginButton(BuildContext context) {
    return ButtonTheme(
        minWidth: 100.0,
        height: 35.0,
        child: RaisedButton(
            child: Text('Login'),
            color: Colors.white,
            textColor: Colors.blue,
            shape: StadiumBorder(),
            onPressed: () {
              _accionLogin(context);
              print('boton login');
            }));
  }

  _accionLogin(BuildContext context) async {
    LoginProvider provider = new LoginProvider();
    final res = await provider.getLogin();
    print(res);
    print(getLogin);
    if (res.statusCode == 200) {
      Navigator.pushNamed(context, MenuPrincipalPage.routName);
    } else if (res.statusCode != 200) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error con Login"),
              shape: StadiumBorder(),
            );
          });
    }
  }
}
