import 'package:flutter/material.dart';
import 'package:zarnikyawtest/utils/components/card_view.dart';
import 'package:zarnikyawtest/utils/colors.dart';
import 'package:zarnikyawtest/utils/dimens.dart';

class ElevatedPasswordField extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();

  final TextEditingController textEditingController;
  final Color borderColor;
  final bool validation;
  final String? errorText, hint;
  final EdgeInsetsGeometry? padding;

   const ElevatedPasswordField({Key? key,
    required this.textEditingController,
    required this.borderColor,
    required this.validation,
    required this.errorText,
    this.hint,
    this.padding,
  }) : super(key: key);
}

class _BodyState extends State<ElevatedPasswordField> {
  var reasonErrorVisibility = false;
  Color? borderColor;
  bool _passwordVisible = false;

  @override
  void initState() {
    borderColor = widget.borderColor;
    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding == null ? const EdgeInsets.all(0) : widget.padding!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              CardView(
                borderRadius: dBorderRadiusNormal,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: borderColor!),
                    borderRadius: BorderRadius.circular(dBorderRadiusNormal),
                  ),
                  height: 50,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: dPaddingDefault, right: dPaddingDefault),
                    child: TextFormField(
                      obscureText: !_passwordVisible,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: widget.hint,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: kPrimaryDark,
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                      ),
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
              )
            ],
          ),
        ],
      ),
    );
  }
}
