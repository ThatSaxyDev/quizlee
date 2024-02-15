import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizlee/theme/palette.dart';
import 'package:quizlee/utils/app_extensions.dart';
import 'package:quizlee/utils/custom_flex.dart';

class StatisticsCard extends ConsumerWidget {
  const StatisticsCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF090912),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              'Statistics'.txt16(fontWeight: FontWeight.w600),
              const Spacer(),
              Row(
                children: [
                  const Icon(Icons.keyboard_arrow_down_rounded),
                  4.sbW,
                  'All Time'.txt12(fontWeight: FontWeight.w500),
                ],
              ),
            ],
          ),
          22.sbH,
          CustomizableRow(
            flexValues: const [1, 1, 1],
            children: List.generate(
              3,
              (index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  (switch (index) {
                    0 => 'Total Quiz',
                    1 => 'First Place',
                    _ => 'Top 3',
                  })
                      .txt12(
                    fontWeight: FontWeight.w500,
                    color: Pallete.textHintGrey,
                  ),
                  2.sbH,
                  (switch (index) {
                    0 => '25',
                    1 => '5',
                    _ => '10',
                  })
                      .txt14(fontWeight: FontWeight.w600),
                ],
              ),
            ),
          ),
          20.sbH,
          CustomizableRow(
            flexValues: const [1, 1, 1],
            children: List.generate(
              3,
              (index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  (switch (index) {
                    0 => 'Total Pts',
                    1 => 'Global Rank',
                    _ => 'Local Rank',
                  })
                      .txt12(
                    fontWeight: FontWeight.w500,
                    color: Pallete.textHintGrey,
                  ),
                  2.sbH,
                  (switch (index) {
                    0 => '12,000 pts',
                    1 => '1000',
                    _ => '40',
                  })
                      .txt14(fontWeight: FontWeight.w600),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
