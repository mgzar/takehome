import 'package:equatable/equatable.dart';
import 'package:zarnikyawtest/model/prices/unit_model.dart';

class PricesServerResponse extends Equatable {
  late final PricesModel? data;
  late final String? currentTime;

  PricesServerResponse({required this.data, required this.currentTime});

  PricesServerResponse.fromJson(
      Map<String, dynamic> json) {
    data =
        (json["prices"] != null ? PricesModel.fromJson(json["prices"]) : null)!;
    currentTime = json["current_time"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data["prices"] = this.data!.toJson();
    }
    data["current_time"] = currentTime;
    return data;
  }

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => throw UnimplementedError();
}
