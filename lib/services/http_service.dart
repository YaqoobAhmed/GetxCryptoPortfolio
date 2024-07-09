import 'package:dio/dio.dart';
import 'package:getx_crypto_portfolio/consts.dart';

class HTTPServise {
  final Dio _dio = Dio();

  HTTPServise() {
    _configureDio();
  }

  void _configureDio() {
    _dio.options =
        BaseOptions(baseUrl: 'https://api.cryptorank.io/v1/', queryParameters: {
      'api_key': CRYPTO_RANK_API_KEY,
    });
  }

  Future<dynamic> get(String path) async {
    try {
      Response response = await _dio.get(path);
      return response.data;
    } catch (e) {
      print(e);
    }
  }
}