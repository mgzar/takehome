import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    return SafeArea(
        child: controller.pricesList != null
            ? Text(controller.pricesList!.ounce!.platinum.toString())
            : const Text("data null"));
  }
}
