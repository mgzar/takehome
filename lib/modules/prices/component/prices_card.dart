import 'package:flutter/material.dart';
import 'package:zarnikyawtest/utils/components/card_view.dart';
import 'package:zarnikyawtest/utils/dimens.dart';

class PricesCard extends StatelessWidget {
  final String pricesUnit, silver, gold, platinum;

  const PricesCard({
    Key? key,
    required this.pricesUnit,
    required this.silver,
    required this.gold,
    required this.platinum,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: dPaddingNormal, right: dPaddingNormal, bottom: dPaddingNormal),
      child: CardView(
        borderRadius: dBorderRadiusNormal,
        child: Container(
          padding: const EdgeInsets.all(dPaddingNormal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                   "Unit : $pricesUnit" ,
                  ),
                ],
              ),
              const SizedBox(height: 2,),
              Text(
               "Silver : $silver" ,
              ),
              const SizedBox(height: 2,),
              Text(
                "Gold : $gold",
              ),
              const SizedBox(height: 2,),
              Text(
               "Platinum  :  $platinum",
              )
            ],
          ),
        ),
      ),
    );
  }
}
