import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zarnikyawtest/modules/prices/prices_list.dart';

class DashboardController extends GetxController {
  int tabIndex = 0;

  final List<Widget> viewContainer = [
    const PricesList(),
    const PricesList()];

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

}
