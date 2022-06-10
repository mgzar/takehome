import 'package:dio/dio.dart';
import 'package:zarnikyawtest/network/api_services.dart';

class BookingProvider {
  void getBooking({
    required Function(Response<dynamic> response) onSuccess,
    Function(dynamic error)? onError,
  }) {
    ApiService(
            'https://406860e9-1877-4509-a313-3e050c0b704c.mock.pstmn.io/appointments/getSlots?date=2022-06-15')
        .apiCall(
      onSuccess: (response) => onSuccess(response),
      onError: (error) => {
        if (onError != null) {onError(error)}
      },
      requestType: RequestType.get,
    );
  }
}
