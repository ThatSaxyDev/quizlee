// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizlee/theme/palette.dart';
import 'package:quizlee/utils/app_extensions.dart';

class TextInputBox extends StatelessWidget {
  final bool? isExtended;
  final double? height;
  final double? overallheight;
  final double? width;
  final int? maxLines;
  final String hintText;
  final String inputTitle;
  final TextEditingController controller;
  final bool obscuretext;
  final bool readOnly;
  final FormFieldValidator<String>? validator;
  final Widget? suffixIcon;
  final void Function(String)? onFieldSubmitted;
  final Widget? suffix;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final Color? titleColor;
  final Color? borderColor;
  final FontWeight? titleFontWeight;
  final void Function()? onTap;
  final void Function(PointerDownEvent)? onTapOutside;
  final Widget? iconn;
  final int? maxLength;
  final void Function()? onEditingComplete;
  final TextCapitalization textCapitalization;
  const TextInputBox({
    super.key,
    this.isExtended,
    this.maxLines,
    this.height,
    this.overallheight,
    this.width,
    required this.hintText,
    required this.inputTitle,
    required this.controller,
    this.obscuretext = false,
    this.readOnly = false,
    this.validator,
    this.suffixIcon,
    this.onFieldSubmitted,
    this.suffix,
    this.focusNode,
    this.keyboardType,
    this.onChanged,
    this.inputFormatters,
    this.titleColor,
    this.borderColor,
    this.titleFontWeight,
    this.onTap,
    this.onTapOutside,
    this.iconn,
    this.maxLength,
    this.onEditingComplete,
    this.textCapitalization = TextCapitalization.none,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: overallheight ?? 68.h,
      width: width ?? double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: 8.padH,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  inputTitle,
                  style: TextStyle(
                      color: titleColor ?? Pallete.textGrey,
                      fontSize: 12.sp,
                      fontWeight: titleFontWeight ?? FontWeight.w500),
                ),
                iconn ?? const SizedBox.shrink(),
              ],
            ),
          ),
          SizedBox(
            height: height ?? 44.h,
            width: width ?? double.infinity,
            child: TextFormField(
              maxLines: maxLines ?? 1,
              textCapitalization: textCapitalization,
              onEditingComplete: onEditingComplete,
              readOnly: readOnly,
              maxLength: maxLength,
              onTap: onTap,
              onTapOutside: onTapOutside,
              keyboardType: keyboardType,
              focusNode: focusNode,
              onFieldSubmitted: onFieldSubmitted,
              onChanged: onChanged,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              controller: controller,
              inputFormatters: inputFormatters,
              obscureText: obscuretext,
              obscuringCharacter: '*',
              cursorColor: Pallete.buttonBlue,
              decoration: InputDecoration(
                // isDense: true,
                suffix: suffix,
                filled: true,
                fillColor: Pallete.darkBlueGrey,
                contentPadding: isExtended == true
                    ? EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 12.h,
                      )
                    : EdgeInsets.only(left: 16.w),
                helperText: " ",
                helperStyle: const TextStyle(fontSize: 0.0005),
                errorStyle: const TextStyle(fontSize: 0.0005),
                suffixIcon: suffixIcon,
                hintText: hintText,
                hintStyle: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Pallete.textHintGrey,
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Pallete.borderBlueGrey),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Pallete.borderBlueGrey),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Pallete.buttonBlue),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
              ),
              validator: validator,
            ),
          ),
        ],
      ),
    );
  }
}

//! 2
class TextInputBox2 extends StatelessWidget {
  // final double? height;
  final double? width;
  final String hintText;
  // final String inputTitle;
  final TextEditingController controller;
  final bool obscuretext;
  final bool readOnly;
  final FormFieldValidator<String>? validator;
  final Widget? suffixIcon;
  final void Function(String)? onFieldSubmitted;
  final Widget? suffix;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final Color? titleColor;
  final Color? borderColor;
  final FontWeight? titleFontWeight;
  final void Function()? onTap;
  final void Function(PointerDownEvent)? onTapOutside;
  final Widget? iconn;
  final int? maxLength;
  final void Function()? onEditingComplete;
  final TextCapitalization textCapitalization;
  const TextInputBox2({
    super.key,
    // this.height,
    this.width,
    required this.hintText,
    // required this.inputTitle,
    required this.controller,
    this.obscuretext = false,
    this.readOnly = false,
    this.validator,
    this.suffixIcon,
    this.onFieldSubmitted,
    this.suffix,
    this.focusNode,
    this.keyboardType,
    this.onChanged,
    this.inputFormatters,
    this.titleColor,
    this.borderColor,
    this.titleFontWeight,
    this.onTap,
    this.onTapOutside,
    this.iconn,
    this.maxLength,
    this.onEditingComplete,
    this.textCapitalization = TextCapitalization.none,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.h,
      width: width ?? double.infinity,
      child: TextFormField(
        textCapitalization: textCapitalization,
        onEditingComplete: onEditingComplete,
        readOnly: readOnly,
        maxLength: maxLength,
        onTap: onTap,
        onTapOutside: onTapOutside,
        keyboardType: keyboardType,
        focusNode: focusNode,
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        controller: controller,
        inputFormatters: inputFormatters,
        obscureText: obscuretext,
        obscuringCharacter: '*',
        cursorColor: Pallete.buttonBlue,
        decoration: InputDecoration(
          // isDense: true,
          suffix: suffix,
          filled: true,
          fillColor: Pallete.darkBlueGrey,
          contentPadding: EdgeInsets.only(left: 16.w),
          helperText: " ",
          helperStyle: const TextStyle(fontSize: 0.0005),
          errorStyle: const TextStyle(fontSize: 0.0005),
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: Pallete.textHintGrey,
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Pallete.borderBlueGrey),
            borderRadius: BorderRadius.circular(12.r),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Pallete.borderBlueGrey),
            borderRadius: BorderRadius.circular(12.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Pallete.borderBlueGrey),
            borderRadius: BorderRadius.circular(12.r),
          ),
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
        ),
        validator: validator,
      ),
    );
  }
}

// class TextInputBoxBio extends StatelessWidget {
//   // final double? height;
//   final double? width;
//   final String hintText;
//   final String inputTitle;
//   final TextEditingController controller;
//   final bool obscuretext;
//   final bool readOnly;
//   final FormFieldValidator<String>? validator;
//   final Widget? suffixIcon;
//   final void Function(String)? onFieldSubmitted;
//   final Widget? suffix;
//   final FocusNode? focusNode;
//   final TextInputType? keyboardType;
//   final void Function(String)? onChanged;
//   final List<TextInputFormatter>? inputFormatters;
//   final Color? titleColor;
//   final Color? borderColor;
//   final FontWeight? titleFontWeight;
//   final void Function()? onTap;
//   final void Function(PointerDownEvent)? onTapOutside;
//   final Widget? iconn;
//   final int? maxLength;
//   final void Function()? onEditingComplete;
//   final TextCapitalization textCapitalization;
//   final int? maxLines;
//   const TextInputBoxBio({
//     Key? key,
//     // this.height,
//     this.width,
//     required this.hintText,
//     required this.inputTitle,
//     required this.controller,
//     this.obscuretext = false,
//     this.readOnly = false,
//     this.validator,
//     this.suffixIcon,
//     this.onFieldSubmitted,
//     this.suffix,
//     this.focusNode,
//     this.keyboardType,
//     this.onChanged,
//     this.inputFormatters,
//     this.titleColor,
//     this.borderColor,
//     this.titleFontWeight,
//     this.onTap,
//     this.onTapOutside,
//     this.iconn,
//     this.maxLength,
//     this.onEditingComplete,
//     this.textCapitalization = TextCapitalization.none,
//     this.maxLines,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       maxLines: maxLines,
//       textCapitalization: textCapitalization,
//       onEditingComplete: onEditingComplete,
//       readOnly: readOnly,
//       maxLength: maxLength,
//       onTap: onTap,
//       onTapOutside: onTapOutside,
//       keyboardType: keyboardType,
//       focusNode: focusNode,
//       onFieldSubmitted: onFieldSubmitted,
//       onChanged: onChanged,
//       style: TextStyle(
//         fontSize: 14.sp,
//         fontWeight: FontWeight.w500,
//         color: Pallete.ash,
//       ),
//       controller: controller,
//       inputFormatters: inputFormatters,
//       obscureText: obscuretext,
//       obscuringCharacter: '*',
//       cursorColor: Colors.black,
//       decoration: InputDecoration(
//         // isDense: true,
//         suffix: suffix,
//         // filled: true,
//         // fillColor: Pallete.greey,
//         contentPadding: EdgeInsets.all(7.w),
//         helperText: " ",
//         helperStyle: const TextStyle(fontSize: 0.0005),
//         errorStyle: const TextStyle(fontSize: 0.0005),
//         suffixIcon: suffixIcon,
//         hintText: hintText,
//         hintStyle: TextStyle(
//           fontSize: 15.sp,
//           fontWeight: FontWeight.w500,
//           color: Pallete.greey,
//         ),
//         border: OutlineInputBorder(
//           borderSide: const BorderSide(color: Pallete.greyGreen),
//           borderRadius: BorderRadius.circular(8.r),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderSide: const BorderSide(color: Pallete.greyGreen),
//           borderRadius: BorderRadius.circular(8.r),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: const BorderSide(color: Pallete.greyGreen),
//           borderRadius: BorderRadius.circular(8.r),
//         ),
//         errorBorder: InputBorder.none,
//         focusedErrorBorder: InputBorder.none,
//       ),
//       validator: validator,
//     );
//   }
// }

// class EmailTextInputBox extends StatelessWidget {
//   // final double? height;
//   final double? width;
//   final String hintText;
//   final String inputTitle;
//   final TextEditingController controller;
//   final bool obscuretext;
//   final bool readOnly;
//   final FormFieldValidator<String>? validator;
//   final Widget? suffixIcon;
//   final void Function(String)? onFieldSubmitted;
//   final Widget? suffix;
//   final FocusNode? focusNode;
//   final TextInputType? keyboardType;
//   final void Function(String)? onChanged;
//   final List<TextInputFormatter>? inputFormatters;
//   final Color? titleColor;
//   final Color? borderColor;
//   final FontWeight? titleFontWeight;
//   final void Function()? onTap;
//   final void Function(PointerDownEvent)? onTapOutside;
//   final Widget? iconn;
//   final int? maxLength;
//   final void Function()? onEditingComplete;
//   final TextCapitalization textCapitalization;
//   const EmailTextInputBox({
//     Key? key,
//     // this.height,
//     this.width,
//     required this.hintText,
//     required this.inputTitle,
//     required this.controller,
//     this.obscuretext = false,
//     this.readOnly = false,
//     this.validator,
//     this.suffixIcon,
//     this.onFieldSubmitted,
//     this.suffix,
//     this.focusNode,
//     this.keyboardType,
//     this.onChanged,
//     this.inputFormatters,
//     this.titleColor,
//     this.borderColor,
//     this.titleFontWeight,
//     this.onTap,
//     this.onTapOutside,
//     this.iconn,
//     this.maxLength,
//     this.onEditingComplete,
//     this.textCapitalization = TextCapitalization.none,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 78.h,
//       width: width ?? double.infinity,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 inputTitle,
//                 style: TextStyle(
//                     color: titleColor ?? Pallete.textBlack.withOpacity(0.75),
//                     fontSize: 14.sp,
//                     fontWeight: titleFontWeight ?? FontWeight.w500),
//               ),
//               iconn ?? const SizedBox.shrink(),
//             ],
//           ),
//           SizedBox(
//             height: 51.h,
//             child: Row(
//               children: [
//                 Container(
//                   height: 51.h,
//                   width: 47.w,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(4.r),
//                       bottomLeft: Radius.circular(4.r),
//                     ),
//                     border: Border.all(
//                       color: Pallete.borderGrey,
//                       // width: 1,
//                     ),
//                   ),
//                   child: Center(
//                     child: SvgPicture.asset('mail'.svg),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 51.h,
//                   width: 300.w,
//                   child: TextFormField(
//                     textCapitalization: textCapitalization,
//                     onEditingComplete: onEditingComplete,
//                     readOnly: readOnly,
//                     maxLength: maxLength,
//                     onTap: onTap,
//                     onTapOutside: onTapOutside,
//                     keyboardType: keyboardType,
//                     focusNode: focusNode,
//                     onFieldSubmitted: onFieldSubmitted,
//                     onChanged: onChanged,
//                     style:
//                         TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
//                     controller: controller,
//                     inputFormatters: inputFormatters,
//                     obscureText: obscuretext,
//                     obscuringCharacter: '*',
//                     cursorColor: Colors.black,
//                     decoration: InputDecoration(
//                       // isDense: true,
//                       suffix: suffix,
//                       suffixIconConstraints: BoxConstraints(maxHeight: 28.h),
//                       // filled: true,
//                       // fillColor: Pallete.greey,
//                       contentPadding: EdgeInsets.only(left: 16.w, right: 10.w),
//                       helperText: " ",
//                       helperStyle: const TextStyle(fontSize: 0.0005),
//                       errorStyle: const TextStyle(fontSize: 0.0005),
//                       suffixIcon: suffixIcon,
//                       hintText: hintText,
//                       hintStyle: TextStyle(
//                         fontSize: 15.sp,
//                         fontWeight: FontWeight.w500,
//                         color: Pallete.greey,
//                       ),
//                       border: OutlineInputBorder(
//                         borderSide: const BorderSide(color: Pallete.borderGrey),
//                         borderRadius: BorderRadius.only(
//                           topRight: Radius.circular(4.r),
//                           bottomRight: Radius.circular(4.r),
//                         ),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: const BorderSide(color: Pallete.borderGrey),
//                         borderRadius: BorderRadius.only(
//                           topRight: Radius.circular(4.r),
//                           bottomRight: Radius.circular(4.r),
//                         ),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: const BorderSide(color: Pallete.borderGrey),
//                         borderRadius: BorderRadius.only(
//                           topRight: Radius.circular(4.r),
//                           bottomRight: Radius.circular(4.r),
//                         ),
//                       ),
//                       errorBorder: InputBorder.none,
//                       focusedErrorBorder: InputBorder.none,
//                     ),
//                     validator: validator,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
