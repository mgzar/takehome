import 'dart:convert';

import 'package:get/get.dart';
import 'package:zarnikyawtest/model/prices/precious_metal_model.dart';
import 'package:zarnikyawtest/model/prices/prices_server_response.dart';
import 'package:zarnikyawtest/model/prices/unit_model.dart';
import 'package:zarnikyawtest/network/provider/PricesProvider.dart';

class PricesController extends GetxController {
  PricesModel? pricesList;
  PricesModel? lar;

  getPriceList() {
    PricesProvider().getPrices(
      onSuccess: (resp) {
        var response = PricesServerResponse.fromJson(jsonDecode(resp.data));
        if(response.data != null){
          pricesList = response.data;
          update();
        }
        pricesList = PricesModel(ounce: const PreciousMetalModel(gold: 1.0,silver: 2.0,platinum: 1.0), gram: const PreciousMetalModel(gold: 1.0,silver: 2.0,platinum: 1.0), hundredGram: const PreciousMetalModel(gold: 1.0,silver: 2.0,platinum: 1.0), thousandGram: const PreciousMetalModel(gold: 1.0,silver: 2.0,platinum: 1.0));
        update();
        print("heee");
      },
      onError:(error){
        print("onEEEEEE"+error);
        pricesList = PricesModel(ounce: const PreciousMetalModel(gold: 1.0,silver: 2.0,platinum: 1.0), gram: const PreciousMetalModel(gold: 1.0,silver: 2.0,platinum: 1.0), hundredGram: const PreciousMetalModel(gold: 1.0,silver: 2.0,platinum: 1.0), thousandGram: const PreciousMetalModel(gold: 1.0,silver: 2.0,platinum: 1.0));
        update();
      }
    );
  }
}
