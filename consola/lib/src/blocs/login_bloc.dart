import '../providers/login/login_provider.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc {
  final _loginController = BehaviorSubject<String>();

  LoginProvider _loginProvider = new LoginProvider();

  Stream<String> get loginStream => _loginController.stream;

  Function(String) get loginSinc => _loginController.sink.add;

  String get login => _loginController.value;

  dispose() {
    _loginController?.close();
  }

  // eventos
  void getLogin() async {
    final loginGral = await _loginProvider.getLogin();
    _loginController.sink.add(loginGral.toString());
  }
}
