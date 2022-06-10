import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zarnikyawtest/modules/prices/component/prices_card.dart';
import 'package:zarnikyawtest/modules/prices/controller/prices_controller.dart';

class PricesList extends StatefulWidget {
  const PricesList({Key? key}) : super(key: key);

  @override
  State<PricesList> createState() => _PricesListState();
}

class _PricesListState extends State<PricesList> {
  final controller = Get.put(PricesController());

  @override
  Widget build(BuildContext context) {
    controller.getPriceList();
    return SafeArea(child: Obx(() {
      var ounce= controller.pricesList.value.ounce;
      var gram = controller.pricesList.value.gram;
      var hundredGram= controller.pricesList.value.hundredGram;
      var thousandGram=controller.pricesList.value.thousandGram;
      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children:[ PricesCard(
            silver: ounce != null ? ounce.silver.toString() : "",
            gold: ounce != null ? ounce.gold.toString() : "",
            platinum: ounce != null ? ounce.platinum.toString() : "",
            pricesUnit: 'Ounce',
          ),
            PricesCard(
              silver: gram != null ? gram.silver.toString() : "",
              gold: gram != null ? gram.gold.toString() : "",
              platinum: gram != null ? gram.platinum.toString() : "",
              pricesUnit: 'Gram',
            ),
            PricesCard(
              silver: hundredGram != null ? hundredGram.silver.toString() : "",
              gold: hundredGram != null ? hundredGram.gold.toString() : "",
              platinum: hundredGram != null ? hundredGram.platinum.toString() : "",
              pricesUnit: 'HundredGram',
            ),
            PricesCard(
              silver: thousandGram != null ? thousandGram.silver.toString() : "",
              gold: thousandGram != null ? thousandGram.gold.toString() : "",
              platinum: thousandGram != null ? thousandGram.platinum.toString() : "",
              pricesUnit: 'ThousandGram',
            )
          ]
        ),
      );
    }));
  }
}
