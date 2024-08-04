// import 'package:file_picker/file_picker.dart';
// import 'package:connect/shared/nee_extensions.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:quizlee/core/type_defs.dart';

void showBanner({
  required BuildContext context,
  required String theMessage,
  required NotificationType theType,
}) {
  Flushbar(
    message: theMessage,
    messageSize: 15.sp,
    duration: const Duration(seconds: 3),
    flushbarPosition: FlushbarPosition.TOP,
    flushbarStyle: FlushbarStyle.FLOATING,
    margin: EdgeInsets.symmetric(horizontal: 10.w),
    borderRadius: BorderRadius.circular(7.r),
    reverseAnimationCurve: Curves.decelerate,
    forwardAnimationCurve: Curves.linearToEaseOut,
    messageColor: Colors.white,
    icon: Icon(
      theType == NotificationType.failure
          ? PhosphorIcons.warning(PhosphorIconsStyle.bold)
          : theType == NotificationType.success
              ? PhosphorIcons.checks(PhosphorIconsStyle.bold)
              : PhosphorIcons.warningCircle(PhosphorIconsStyle.bold),
      color: Colors.white,
    ),
    backgroundColor: theType == NotificationType.failure
        ? Colors.red
        : theType == NotificationType.success
            ? Colors.green
            : Colors.orange,
  ).show(context);
}
