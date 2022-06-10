import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:zarnikyawtest/model/prices/prices_server_response.dart';
import 'package:zarnikyawtest/model/prices/unit_model.dart';
import 'package:zarnikyawtest/network/provider/PricesProvider.dart';

class PricesController extends GetxController {
  var pricesList = PricesModel().obs;
  PricesModel? lar;

  getPriceList() {
    PricesProvider().getPrices(onSuccess: (resp) {
      var response = PricesServerResponse.fromJson(resp.data);
      if (response.data != null) {
        pricesList.value = response.data!;
        update();
      }
    }, onError: (error) {
      if (kDebugMode) {
        print(error);
      }
    });
  }
}
