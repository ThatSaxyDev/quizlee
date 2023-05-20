import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizlee/features/home/widgets/upcoming_game_card.dart';
import 'package:quizlee/features/quiz/providers/quiz_providers.dart';
import 'package:quizlee/theme/palette.dart';
import 'package:quizlee/utils/error_text.dart';
import 'package:quizlee/utils/loader.dart';

class TempQuizView extends ConsumerWidget {
  const TempQuizView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizzesStream = ref.watch(getAllQuizzesProvider);
    return Scaffold(
      backgroundColor: Pallete.backgroundBlue,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w).copyWith(top: 100.h),
          child: quizzesStream.when(
            data: (quizzes) {
              if (quizzes.isEmpty) {
                return const ErrorText(error: 'No quiz');
              }

              return Column(
                children: List.generate(
                  quizzes.length,
                  (index) => UpcomingGameCard(
                    quiz: quizzes[index],
                  ),
                ),
              );
            },
            error: (error, stactrace) => ErrorText(error: error.toString()),
            loading: () => const Loader(),
          ),
        ),
      ),
    );
  }
}
