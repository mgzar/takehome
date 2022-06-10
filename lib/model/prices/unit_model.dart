import 'package:equatable/equatable.dart';
import 'package:zarnikyawtest/model/prices/precious_metal_model.dart';

class PricesModel extends Equatable {
  PreciousMetalModel? ounce;
  PreciousMetalModel? gram;
  PreciousMetalModel? hundredGram;
  PreciousMetalModel? thousandGram;

  PricesModel(
      { this.ounce,
       this.gram,
       this.hundredGram,
       this.thousandGram});

  PricesModel.fromJson(Map<String, dynamic> json) {
    ounce =
        json['ounce'] != null ? PreciousMetalModel.fromJson(json['ounce']) : null;
    gram =
        json['gram'] != null ? PreciousMetalModel.fromJson(json['gram']) : null;
    hundredGram = json['hundred_gram'] != null
        ? PreciousMetalModel.fromJson(json['hundred_gram'])
        : null;
    thousandGram = json['thousand_gram'] != null
        ? PreciousMetalModel.fromJson(json['thousand_gram'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (ounce != null) {
      data['ounce'] = ounce!.toJson();
    }
    if (gram != null) {
      data['gram'] = gram!.toJson();
    }
    if (hundredGram != null) {
      data['hundred_gram'] = hundredGram!.toJson();
    }
    if (thousandGram != null) {
      data['thousand_gram'] = thousandGram!.toJson();
    }
    return data;
  }

  @override
  List<Object?> get props => [
        ounce,
        gram,
        hundredGram,
        thousandGram,
      ];

  @override
  bool? get stringify => true;
}
