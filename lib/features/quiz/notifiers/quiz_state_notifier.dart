// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizlee/features/quiz/providers/quiz_providers.dart';

class QuizStateNotifier extends Notifier<QuizState> {
  @override
  build() {
    return const QuizState();
  }

  void startLoading() {
    state = state.copyWith(isLoading: true);
  }

  void stopLoading() {
    state = state.copyWith(isLoading: false);
  }

  //! create a quiz
  void createQuiz({
    required BuildContext context,
    required String title,
    required String description,
    required DateTime date,
    required String time,
    required File? image,
    required bool isPublic,
  }) async {
    startLoading();

    await ref.read(quizControllerProvider.notifier).createQuiz(
          context: context,
          title: title,
          description: description,
          date: date,
          time: time,
          image: image,
          isPublic: isPublic,
          onError: (p0) {
            stopLoading();
          },
          onSuccess: (p0) {
            stopLoading();
          },
        );
  }
}

class QuizState {
  final bool isLoading;

  const QuizState({
    this.isLoading = false,
  });

  QuizState copyWith({
    bool? isLoading,
  }) {
    return QuizState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
