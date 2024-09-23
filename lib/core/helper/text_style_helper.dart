import 'package:flutter/material.dart';
import 'package:tasketo/core/helper/color_helper.dart';

abstract class AppTextStyleHelper{
  static const TextStyle font22BoldPrimary = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: AppColorHelper.primary,
  );

  static const TextStyle font24BoldBlack = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColorHelper.black,
  );

  static const TextStyle font20MediumPrimary = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColorHelper.primary,
  );

  static const TextStyle font20SemiBoldBlack = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColorHelper.black,
  );

  static const TextStyle font20MediumBlack = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColorHelper.black,
  );

  static const TextStyle font18RegularGrey = TextStyle(
    fontSize: 18,
    color: AppColorHelper.grey,
  );

  static const TextStyle font16BoldPrimary = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColorHelper.primary,
  );

  static const TextStyle font18MediumPrimary = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColorHelper.primary,
  );

  static const TextStyle font16MediumBlack = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColorHelper.black,
  );

  static const TextStyle font16MediumPrimary = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColorHelper.primary,
  );

  static const TextStyle font16MediumWhite = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColorHelper.white,
  );

  static const TextStyle font16MediumGrey = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColorHelper.grey,
  );

  static const TextStyle font16RegularGrey = TextStyle(
    fontSize: 16,
    color: AppColorHelper.grey,
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