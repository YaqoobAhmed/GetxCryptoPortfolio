import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_crypto_portfolio/models/api_response.dart';
import 'package:getx_crypto_portfolio/services/http_service.dart';

class AddAssetDialogController extends GetxController {
  RxBool loading = false.obs;
  RxList<String> assets = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    _getAsset();
  }

  Future<void> _getAsset() async {
    loading.value = true;
    HTTPService httpService = Get.find<HTTPService>();
    var responseData = await httpService.get('currencies');
    CurrenciesListAPIResponse currenciesListAPIResponse =
        CurrenciesListAPIResponse.fromJson(responseData);
    currenciesListAPIResponse.data?.forEach(
      (coin) {
        assets.add(coin.name!);
      },
    );
    print(assets);
    loading.value = false;
  }
}

class AddAssetDialog extends StatelessWidget {
  final controller = Get.put(
    AddAssetDialogController(),
  );
  AddAssetDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Center(
        child: Material(
          child: Container(
            height: MediaQuery.sizeOf(context).height * 0.40,
            width: MediaQuery.sizeOf(context).width * 0.80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.white),
            child: _buildUI(),
          ),
        ),
      ),
    );
  }

  Widget _buildUI() {
    if (controller.loading.isTrue) {
      return Center(
        child:
            SizedBox(height: 30, width: 30, child: CircularProgressIndicator()),
      );
    } else {
      return Column(
        children: [],
      );
    }
  }
}
