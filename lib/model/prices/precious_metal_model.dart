import 'package:equatable/equatable.dart';

class PreciousMetalModel extends Equatable {
  final double silver;
  final double gold;
  final double platinum;

  const PreciousMetalModel({
    required this.silver,
    required this.gold,
    required this.platinum,
  });

  factory PreciousMetalModel.fromJson(Map<String, dynamic> json) => PreciousMetalModel(
    silver: json["silver"],
    gold: json["gold"],
    platinum: json["platinum"]
  );

  Map<String, dynamic> toJson() => {
    "silver": silver,
    "gold":gold,
    "platinum":platinum
  };

  @override
  List<Object?> get props => [
    silver,
    gold,
    platinum
  ];

  @override
  bool? get stringify => true;
}