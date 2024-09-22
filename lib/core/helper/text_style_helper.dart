import 'package:flutter/material.dart';
import 'package:tasketo/core/helper/color_helper.dart';

abstract class AppTextStyleHelper{
  static const TextStyle font22BoldPrimary = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: AppColorHelper.primary,
  );

  static const TextStyle font20RegularBlack = TextStyle(
    fontSize: 20,
    color: AppColorHelper.black,
  );

  static const TextStyle font18SemiBoldWhite = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColorHelper.white,
  );
}