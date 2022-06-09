import 'package:dio/dio.dart';
import 'package:zarnikyawtest/network/api_services.dart';

class PricesProvider{
  void getPrices({
    required Function(Response<dynamic> response) onSuccess,
    Function(dynamic error)? onError,
  }) {
    ApiService('home/getPrices').apiCall(
      onSuccess: (response) => onSuccess(response),
      onError: (error) => {if (onError != null) {onError(error)}},
      requestType: RequestType.get,
    );
  }
}