import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizlee/core/providers/storage_repository_provider.dart';
import 'package:quizlee/features/auth/controller/auth_controller.dart';
import 'package:quizlee/features/quiz/repositories/quiz_repository.dart';
import 'package:quizlee/models/question_model.dart';
import 'package:quizlee/models/quiz_model.dart';
import 'package:quizlee/router.dart';
import 'package:quizlee/utils/nav.dart';
import 'package:quizlee/utils/snack_bar.dart';
import 'package:uuid/uuid.dart';

class QuizController extends StateNotifier<bool> {
  final QuizRepository _quizRepository;
  final StorageRepository _storageRepository;
  final Ref _ref;
  QuizController({
    required QuizRepository quizRepository,
    required StorageRepository storageRepository,
    required Ref ref,
  })  : _quizRepository = quizRepository,
        _storageRepository = storageRepository,
        _ref = ref,
        super(false);

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
    // _ref.read(loadingStateControllerProvider.notifier).loading();
    final user = _ref.watch(userProvider)!;
    String quizId = const Uuid().v1();
    String imageUrl = '';

    final res = await _storageRepository.storeFile(
      path: 'quizzes/images',
      id: user.uid,
      file: image,
    );
    res.fold(
      (l) => showSnackBar(context, l.message),
      (r) => imageUrl = r,
    );

    QuizModel quiz = QuizModel(
      uid: user.uid,
      quizId: quizId,
      image: imageUrl,
      title: title,
      description: description,
      date: date,
      time: time,
      questionIds: [],
      isPublic: isPublic,
      createdAt: DateTime.now(),
      isCreationComplete: false,
    );

    final ress = await _quizRepository.createQuiz(quiz: quiz);

    // _ref.read(loadingStateControllerProvider.notifier).stop();

    ress.fold(
      (l) => showSnackBar(context, l.message),
      (r) {
        showSnackBar(context, 'Quiz created');
        nav(
            destination: '/create-quiz/quiz-questions/$quizId',
            context: context);
      },
    );
  }

  //! confirm quiz creation
  void confirmQuizCreation({
    required BuildContext context,
    required QuizModel quiz,
  }) async {
    final res = await _quizRepository.confirmQuizCreation(quiz: quiz);

    res.fold(
      (l) => showSnackBar(context, l.message),
      (r) => showSnackBar(context, 'done'),
    );
  }

  //! get quiz by Id
  Stream<QuizModel> getQuizById({required quizId}) {
    return _quizRepository.getQuizById(quizId: quizId);
  }

  //! add question to quiz
  void addQuestionToQuiz({
    required BuildContext context,
    required QuizModel quiz,
    required String questionTitle,
    required int correctAnswerIndex,
    required List<String> answerOptions,
    required int timeToAnswer,
    required int points,
  }) async {
    state = true;
    String questionId = const Uuid().v1();
    QuestionModel question = QuestionModel(
      quizId: quiz.quizId,
      questionId: questionId,
      questionTitle: questionTitle,
      answerOptions: answerOptions,
      correctAnswerIndex: correctAnswerIndex,
      points: points,
      timeToAnswer: timeToAnswer,
    );

    final res = await _quizRepository.addQuestionToQuiz(question: question);
    state = false;

    res.fold(
      (l) => showSnackBar(context, l.message),
      (r) {
        showSnackBar(context, 'Question added');
        goBack(context);
      },
    );
  }

  //! get all quizzes
  Stream<List<QuizModel>> getAllQuizzes() {
    return _quizRepository.getAllQuizzes();
  }

  //! get all questions in a quiz
  Stream<List<QuestionModel>> getAllQuestionsInAQuiz({required quizId}) {
    return _quizRepository.getAllQuestionsInAQuiz(quizId: quizId);
  }

  //! edit question
  void editQuestion({
    required BuildContext context,
    required String quizId,
    required String questionTitle,
    required int correctAnswerIndex,
    required List<String> answerOptions,
    required int timeToAnswer,
    required int points,
    required String questionId,
  }) async {
    state = true;

    QuestionModel question = QuestionModel(
      quizId: quizId,
      questionId: questionId,
      questionTitle: questionTitle,
      answerOptions: answerOptions,
      correctAnswerIndex: correctAnswerIndex,
      points: points,
      timeToAnswer: timeToAnswer,
    );

    final res = await _quizRepository.editAQuestion(question: question);
    state = false;

    res.fold(
      (l) => showSnackBar(context, l.message),
      (r) {
        showSnackBar(context, 'Edited');
        goBack(context);
      },
    );
  }

  //! delete question
  void deleteQuestion({
    required BuildContext context,
    required QuestionModel question,
  }) async {
    final res = await _quizRepository.deleteQuestion(question: question);
    res.fold(
      (l) => showSnackBar(context, l.message),
      (r) {
        showSnackBar(context, 'Deleted');
        goBack(context);
      },
    );
  }
}
