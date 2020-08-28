import 'package:jmc_hh/src/providers/refreshEcommerce/refresh_ecom_provider.dart';
import 'package:rxdart/rxdart.dart';

class RefreshEcommerceBloc {

  final _ecommerceController = BehaviorSubject<String>();
  

  RefreshProvider provider = new RefreshProvider();


  Stream<String> get ecommerceStream => _ecommerceController.stream;
  
  Function(String) get ecommerceSinc => _ecommerceController.sink.add;

  String get ecommerce => _ecommerceController.value;

  dispose() {
      _ecommerceController?.close();
  }

  // void getEcom(String ecommerce) async {
  //   final eco =  await provider.sincEcom(ecommerce);
  //   _ecommerceController.sink.add("codigo");
  // }
}