import 'package:flutter/material.dart';

class SizeBoxSmall extends StatelessWidget {
  const SizeBoxSmall({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: size.height * 0.02);
  }
}
