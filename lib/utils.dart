import 'package:get/get.dart';
import 'package:getx_crypto_portfolio/services/http_service.dart';

Future<void> registerServices() async {
  Get.put(HTTPService());
}
