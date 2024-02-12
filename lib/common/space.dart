import 'package:flutter/material.dart';
import 'color.dart';
import 'dimen_const.dart';

//For storing constant horizontal space
const Widget horizontalSpaceTiny = SizedBox(width: 5.0);
const Widget horizontalSpaceSmall = SizedBox(width: 10.0);
const Widget horizontalSpaceRegular = SizedBox(width: 18.0);
const Widget horizontalSpaceMedium = SizedBox(width: 25.0);
const Widget horizontalSpaceLarge = SizedBox(width: 50.0);
Widget horizontalSpaceCustom({required double width}) => SizedBox(width: width);

//For storing constant vertical space
const Widget verticalSpaceTiny = SizedBox(height: 5.0);
const Widget verticalSpaceSmall = SizedBox(height: 10.0);
const Widget verticalSpaceRegular = SizedBox(height: 18.0);
const Widget verticalSpaceMedium = SizedBox(height: 25);
const Widget verticalSpaceLarge = SizedBox(height: 50.0);
const Widget verticalSpaceGiant = SizedBox(height: 80.0);
const Widget verticalSpaceMassive = SizedBox(height: 120.0);
Widget verticalSpaceCustom({required double height}) =>
    SizedBox(height: height);

//Helper for getting screen width and height
double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenWidthPercentage(
  BuildContext context, {
  required double percentage,
}) {
  return screenWidth(context) * percentage;
}

double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
double screenHeightPercentage(
  BuildContext context, {
  required double percentage,
}) {
  return screenHeight(context) * percentage;
}

const EdgeInsetsGeometry paddingButton = EdgeInsets.only(
    left: Dimens.massivePadding,
    right: Dimens.massivePadding,
    bottom: Dimens.size8,
    top: Dimens.size8);

const EdgeInsetsGeometry paddingZero = EdgeInsets.all(0);

final borderSmall = BorderRadius.circular(Dimens.smallPadding);
final borderLarge = BorderRadius.circular(Dimens.size30);

final buttonRadius24 = BorderRadius.circular(Dimens.size24);
final buttonRadius5 = BorderRadius.circular(Dimens.size5);

RoundedRectangleBorder cardShape(
    {double? radius, double? borderWidth, Color? borderColor}) {
  return RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(
      radius ?? Dimens.size20,
    ),
    side: BorderSide(
      color:
          materialColor(borderColor ?? secondaryColor), // Set the border color
      width: borderWidth ?? 2.0, // Set the border width
    ),
  );
}
