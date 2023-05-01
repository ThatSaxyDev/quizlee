// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:pinput/pinput.dart';
// import 'package:spowse/theme/palette.dart';

// class PinInputBox extends StatelessWidget {
//   final void Function(String)? onCompleted;
//   final TextEditingController? controller;
//   const PinInputBox({
//     Key? key,
//     this.onCompleted,
//     this.controller,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Pinput(
//       length: 6,
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       // obscuringCharacter: '*',
//       obscureText: false,
//       useNativeKeyboard: true,
//       defaultPinTheme: PinTheme(
//         width: 51.h,
//         height: 57.h,
//         textStyle: TextStyle(
//           fontSize: 32.sp,
//           color: Pallete.primaryGreen,
//           fontWeight: FontWeight.w900,
//         ),
//         decoration: BoxDecoration(
//           color: Pallete.pinGrey,
//           borderRadius: BorderRadius.circular(4.r),
//         ),
//       ),
//       focusedPinTheme: PinTheme(
//         width: 51.h,
//         height: 57.h,
//         textStyle: TextStyle(
//           fontSize: 32.sp,
//           color: Pallete.primaryGreen,
//           fontWeight: FontWeight.w900,
//         ),
//         decoration: BoxDecoration(
//           border: Border.all(color: Pallete.primaryGreen),
//           color: Pallete.whiteColor,
//           borderRadius: BorderRadius.circular(4.r),
//         ),
//       ),
//       submittedPinTheme: PinTheme(
//         width: 51.h,
//         height: 57.h,
//         textStyle: TextStyle(
//           fontSize: 32.sp,
//           color: Pallete.primaryGreen,
//           fontWeight: FontWeight.w900,
//         ),
//         decoration: BoxDecoration(
//           color: Pallete.pinGrey,
//           borderRadius: BorderRadius.circular(4.r),
//         ),
//       ),
//       controller: controller,
//       onCompleted: onCompleted,
//     );
//   }
// }
