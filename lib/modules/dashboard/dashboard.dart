import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:zarnikyawtest/modules/dashboard/controller/dashboard_controller.dart';
import 'package:zarnikyawtest/utils/colors.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<MyTabItem> items = [
      MyTabItem('Prices', Icons.home),
      MyTabItem('Booking', Icons.price_change_outlined),
    ];
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: kPrimaryLightColor,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            items: getBottomTabs(items),
            currentIndex: controller.tabIndex,
            selectedItemColor: kPrimaryColor,
            unselectedItemColor: kMiddleGrey,
            type: BottomNavigationBarType.fixed,
            onTap: controller.changeTabIndex,
          ),
          body: controller.viewContainer[controller.tabIndex],
        );
      },
    );
  }

  List<BottomNavigationBarItem> getBottomTabs(List<MyTabItem> tabs) {
    return tabs
        .map(
          (item) => BottomNavigationBarItem(
            activeIcon: Icon(
              item.icon,
              color: kPrimaryDark,
            ),
            icon: Icon(item.icon),
            label: item.title.tr,
          ),
        )
        .toList();
  }
}

class MyTabItem {
  String title;
  IconData icon;

  MyTabItem(this.title, this.icon);
}

class FabButton extends StatelessWidget {
  final Function onPressed;

  const FabButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        onPressed();
      },
      label: Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(right: 4.0),
            child: Icon(Icons.add),
          ),
          Text("Day off")
        ],
      ),
      backgroundColor: kPrimaryDark,
    );
  }
}
