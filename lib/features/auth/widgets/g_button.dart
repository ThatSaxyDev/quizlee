import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizlee/features/auth/controller/auth_controller.dart';

import '../../../theme/palette.dart';

class GButton extends ConsumerWidget {
  // final double height;
  // final double width;
  final double padding;
  // final double radius;
  // final void Function()? onTap;

  final Widget item;
  final bool isFromLogin;
  const GButton({
    Key? key,
    // required this.height,
    // required this.width,
    this.padding = 30,
    this.isFromLogin = true,
    // required this.radius,
    // required this.onTap,

    required this.item,
  }) : super(key: key);

  void signInWithGoogle(BuildContext context, WidgetRef ref) {
    ref.read(authControllerProvider.notifier).signInWithGoogle(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeNotifierProvider);
    return SizedBox(
      height: 50.h,
      // width: width,
      child: ElevatedButton(
        onPressed: () {
          // showGeneralDialog(
          //     context: context,
          //     //!SHADOW EFFECT
          //     barrierColor: Pallete.blackColor.withOpacity(0.2),
          //     transitionBuilder: (context, a1, a2, widget) =>
          //         ChooseUserTypePopUp(
          //           a1: a1,
          //           a2: a2,
          //         ),

          //     //! ANIMATION DURATION
          //     transitionDuration: const Duration(milliseconds: 200),

          //     //! STILL DON'T KNOW WHAT THIS DOES, BUT IT'S REQUIRED
          //     pageBuilder: (context, animation1, animation2) => const Text(""));
          signInWithGoogle(context, ref);
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 0.5.w),
            borderRadius: BorderRadius.all(
              Radius.circular(35.r),
            ),
          ),
          elevation: 0,
          shadowColor: Colors.transparent,
          backgroundColor: Pallete.buttonBlue,
          padding: EdgeInsets.symmetric(horizontal: padding),
        ),
        child: Center(
          child: item,
        ),
      ),
    );
  }
}
