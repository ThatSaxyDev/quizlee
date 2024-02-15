import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizlee/features/auth/controller/auth_controller.dart';
import 'package:quizlee/features/auth/widgets/g_button.dart';
import 'package:quizlee/utils/loader.dart';
import 'package:quizlee/utils/app_extensions.dart';

import '../../../theme/palette.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(authControllerProvider);
    final currentTheme = ref.watch(themeNotifierProvider);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: isLoading
            ? const Loader()
            : Column(
                children: [
                  130.sbH,
                  150.sbH,
                  GButton(
                    padding: 10.h,
                    item: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Continue With Google',
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: currentTheme.textTheme.bodyMedium!.color,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  150.sbH,
                ],
              ),
      ),
    );
  }
}
