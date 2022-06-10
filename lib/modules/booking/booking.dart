import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zarnikyawtest/modules/booking/controller/booking_controller.dart';
import 'package:zarnikyawtest/utils/components/card_view.dart';
import 'package:zarnikyawtest/utils/dimens.dart';

class Booking extends StatefulWidget {
  const Booking({Key? key}) : super(key: key);

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  final controller = Get.put(BookingController());

  @override
  Widget build(BuildContext context) {
    controller.getBooking();
    return Obx(() {
      return SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(dPaddingDefault),
        child: SizedBox(
          child:controller.bookingList.isNotEmpty ?  GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 2,
            children: controller.bookingList.map((value) {
              return CardView(
                borderRadius: dBorderRadiusNormal,
                child: Column(
                  children: [
                    Flexible(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(top: dPaddingDefault),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                "Date : ${controller.bookingDate}",
                                maxLines: 2,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                "StartTime :   ${controller.getTime(value.startTime.toString())}",
                                maxLines: 2,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                "EndTime : ${controller.getTime(value.endTime.toString())}",
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              value.available == true ? "Available" : "Taken"),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ):const Center(
            child: SizedBox(
              width: dCircleAvatorRadius,
              height: dCircleAvatorRadius,
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ));
    });
  }
}
