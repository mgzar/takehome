
import 'package:flutter/material.dart';
import 'package:zarnikyawtest/utils/components/card_view.dart';
import '../colors.dart';
import '../dimens.dart';
import '../style.dart';

class ElevatedInputField extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();

  final TextEditingController textEditingController;
  final Color borderColor;
  final bool validation;
  final String? errorText, hint;
  final EdgeInsetsGeometry? padding;
  final bool? enabled;

  ElevatedInputField(
      {required this.textEditingController,
      required this.borderColor,
      required this.validation,
      this.errorText,
      this.hint,
      this.padding,
      this.enabled});
}

class _BodyState extends State<ElevatedInputField> {
  var reasonErrorVisibility = false;
  Color? borderColor;

  @override
  void initState() {
    borderColor = widget.borderColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding == null ? EdgeInsets.all(0) : widget.padding!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Stack(
                children: [
                  CardView(
                    borderRadius: dBorderRadiusNormal,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: borderColor!),
                          borderRadius:
                              BorderRadius.circular(dBorderRadiusNormal)),
                      height: 50,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: dPaddingDefault, right: dPaddingDefault),
                    child: TextFormField(
                      enabled: widget.enabled,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: widget.hint),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      controller: widget.textEditingController,
                      validator: (_) {
                        if (widget.validation) {
                          setState(() {
                            borderColor = kRedColor;
                            reasonErrorVisibility = true;
                          });
                          return widget.errorText;
                        } else {
                          setState(() {
                            borderColor = kSelectedChipColor;
                            reasonErrorVisibility = false;
                          });
                          return null;
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
