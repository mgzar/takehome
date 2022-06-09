import 'package:flutter/material.dart';
import 'package:zarnikyawtest/utils/colors.dart';

import 'dimens.dart';

TextStyle stBlackBoldNormalText() =>
    const TextStyle(color: kBlackColor, fontWeight: FontWeight.bold);

TextStyle stGreyBodyText() => const TextStyle(color: kHighGrey);

TextStyle stWhiteText() => const TextStyle(color: kPrimaryLightColor);

TextStyle stGreenText() => const TextStyle(color: kGreenColor);

TextStyle stRedText() => const TextStyle(color: kRedColor);

TextStyle stPrimaryDarkText() => TextStyle(color: kPrimaryDark);


TextStyle stLargeTitle() => const TextStyle(
    color: kTextColorBlack,
    fontSize: dTextSizeLarge,
    fontWeight: FontWeight.w600);


TextStyle appBarTitle() => const TextStyle(
    color: kTextColorBlack,
    fontSize: dTextSizeAppBarTitle,
    fontWeight: FontWeight.w600,
    fontFamily: 'Poppins');

TextStyle stGrey() => TextStyle(
    color: Colors.grey.shade600,
    fontSize: dTextSizeMedium,
    fontWeight: FontWeight.w500,
    fontFamily: 'poppins');
