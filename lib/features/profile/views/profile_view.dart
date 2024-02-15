import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizlee/features/auth/controller/auth_controller.dart';
import 'package:quizlee/features/profile/widgets/statistics_card.dart';
import 'package:quizlee/models/user_model.dart';
import 'package:quizlee/utils/app_constants.dart';
import 'package:quizlee/utils/app_extensions.dart';
import 'package:quizlee/utils/widgets/myicon.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserModel user = ref.watch(userProvider)!;
    List<String> names = user.name.split(' ');
    String firstName = names[0];
    return SizedBox(
      height: height(context),
      width: width(context),
      child: Padding(
        padding: 20.padH,
        child: Column(
          children: [
            56.sbH,
            'Account'.txt16(fontWeight: FontWeight.w600).alignCenterLeft(),
            32.sbH,
            Row(
              children: [
                CircleAvatar(
                  radius: 32.w,
                ),
                16.sbW,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    firstName.txt16(fontWeight: FontWeight.w600),
                    user.email.txt12(),
                  ],
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios_outlined,
                )
              ],
            ),
            32.sbH,
            const StatisticsCard(),
            36.sbH,
            Row(
              children: [
                MyIcon(
                  icon: 'notiff',
                  height: 40.h,
                ),
                12.sbW,
                'Enable Push Notifications'.txt14(fontWeight: FontWeight.w500),
                const Spacer(),
                SizedBox(
                  width: 60.w,
                  height: 32.h,
                  child: Switch(
                    value: true,
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
            20.sbH,
            Padding(
              padding: 16.padV,
              child: Row(
                children: [
                  MyIcon(
                    icon: 'logout',
                    height: 40.h,
                  ),
                  12.sbW,
                  'Log Uut'.txt14(
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFFEF4444)),
                ],
              ),
            ).tap(onTap: () {}),
          ],
        ),
      ),
    );
  }
}
