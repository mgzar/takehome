import 'package:flutter/material.dart';
import 'package:zarnikyawtest/utils/colors.dart';
import 'package:zarnikyawtest/utils/components/card_view.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color? color, textColor, borderColor;
  final double? borderRadius, width;

  const RoundedButton(
      {Key? key,
      required this.text,
      required this.press,
      required this.color,
      required this.textColor,
      this.borderRadius,
      this.width,
      this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardView(
      borderRadius: borderRadius,
      child: Container(
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(borderRadius == null ? 0 : borderRadius!),
        ),
        width: width,
        height: 45,
        child: newElevatedButton(),
      ),
    );
  }

  //Used:ElevatedButton as FlatButton is deprecated.
  //Here we have to apply customizations to Button by inheriting the styleFrom

  Widget newElevatedButton() {
    return ElevatedButton(
      onPressed: () {
        press();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(color!),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              borderRadius == null ? 0 : borderRadius!,
            ),
            side: BorderSide(
              color: borderColor == null ? kPrimaryDark : borderColor!,
            ),
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
