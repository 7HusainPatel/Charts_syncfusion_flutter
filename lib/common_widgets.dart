import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget WidthSizedBox(double width) {
  return SizedBox(
    width: width.w,
  );
}

Widget HeightSizedBox(double height) {
  return SizedBox(
    height: height.h,
  );
}

Widget SymmetricPadding(Widget child, {double? vertical, double? horizontal}) {
  return Padding(
    child: child,
    padding: EdgeInsets.symmetric(
      horizontal: horizontal?.w ?? 0.0,
      vertical: vertical?.h ?? 0.0,
    ),
  );
}

Widget LTRBPadding({
  required Widget child,
  double? left,
  double? top,
  double? right,
  double? bottom,
  double? all,
}) {
  if (all != null) {
    return Padding(
      child: child,
      padding: EdgeInsets.fromLTRB(
        all.w,
        all.h,
        all.w,
        all.h,
      ),
    );
  } else {
    return Padding(
      child: child,
      padding: EdgeInsets.fromLTRB(
        left?.w ?? 0.0,
        top?.h ?? 0.0,
        right?.w ?? 0.0,
        bottom?.h ?? 0.0,
      ),
    );
  }
}

EdgeInsetsGeometry symmetric({double? vertical, double? horizontal}) {
  return EdgeInsets.symmetric(
    horizontal: horizontal?.w ?? 0.0,
    vertical: vertical?.h ?? 0.0,
  );
}

EdgeInsetsGeometry ltrb({
  double? left,
  double? top,
  double? right,
  double? bottom,
  double? all,
}) {
  if (all != null) {
    return EdgeInsets.fromLTRB(
      all.w,
      all.h,
      all.w,
      all.h,
    );
  } else {
    return EdgeInsets.fromLTRB(
      left?.w ?? 0.0,
      top?.h ?? 0.0,
      right?.w ?? 0.0,
      bottom?.h ?? 0.0,
    );
  }
}
