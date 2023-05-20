import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizlee/core/providers/firebase_provider.dart';
import 'package:quizlee/core/providers/storage_repository_provider.dart';
import 'package:quizlee/features/quiz/controllers/quiz_controller.dart';
import 'package:quizlee/features/quiz/repositories/quiz_repository.dart';

//! the quiz repository provider
final quizRepositoryProvider = Provider((ref) {
  return QuizRepository(firestore: ref.watch(firestoreProvider));
});

//! the quiz controller provider
final quizControllerProvider =
    StateNotifierProvider<QuizController, bool>((ref) {
  final quizRepository = ref.watch(quizRepositoryProvider);
  final storageRepository = ref.watch(storageRepositoryProvider);
  return QuizController(
    quizRepository: quizRepository,
    storageRepository: storageRepository,
    ref: ref,
  );
});

//! the get quiz by ID provider
final getQuizByIdProvider =
    StreamProvider.family.autoDispose((ref, String quizId) {
  final quizController = ref.watch(quizControllerProvider.notifier);
  return quizController.getQuizById(quizId: quizId);
});

//! the get quiz by Room ID provider
final getQuizByRoomIdProvider =
    StreamProvider.family.autoDispose((ref, String quizRoomId) {
  final quizController = ref.watch(quizControllerProvider.notifier);
  return quizController.getQuizByRoomId(quizRoomId: quizRoomId);
});

//! the get all quizzes provider
final getAllQuizzesProvider = StreamProvider((ref) {
  final quizController = ref.watch(quizControllerProvider.notifier);
  return quizController.getAllQuizzes();
});

//! the get confirmed quizzes provider
final getConfirmedQuizzesProvider = StreamProvider((ref) {
  final quizController = ref.watch(quizControllerProvider.notifier);
  return quizController.getConfirmedQuizzes();
});

//! the get ALL QUESTions in a quiz provider
final getAllQuestionsInAQuizProvider =
    StreamProvider.family.autoDispose((ref, String quizId) {
  final quizController = ref.watch(quizControllerProvider.notifier);
  return quizController.getAllQuestionsInAQuiz(quizId: quizId);
});
