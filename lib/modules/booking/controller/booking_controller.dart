import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:zarnikyawtest/model/booking/booking_response.dart';
import 'package:zarnikyawtest/network/provider/bookingProvider.dart';

class BookingController extends GetxController {
  var bookingList = <Slots>[].obs;
  var bookingDate= "".obs;

  getBooking() {
    BookingProvider().getBooking(onSuccess: (resp) {
      var response = BookingResponse.fromJson(resp.data[0]);
      // List allDateResponse = resp.data as List;
      // List<BookingResponse>bookingResponse=<BookingResponse>[] ;
      // for (var e in allDateResponse) {
      //   bookingResponse.add(BookingResponse.fromJson(e));
      // }  // for all date get
      if (response.slots != null) {
        bookingList.value = response.slots!;
        bookingDate.value =response.date!;
        update();
      }
    }, onError: (error) {
      if (kDebugMode) print(error);
    });
  }

  String getTime(String time){
    var parts =time.split(" ");
    return parts[1];
  }

}
