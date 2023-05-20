import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:quizlee/core/constants/firebase_constants.dart';
import 'package:quizlee/core/failure.dart';
import 'package:quizlee/core/type_defs.dart';
import 'package:quizlee/models/question_model.dart';
import 'package:quizlee/models/quiz_model.dart';

class QuizRepository {
  final FirebaseFirestore _firestore;
  QuizRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;

  //! create a quiz
  FutureVoid createQuiz({required QuizModel quiz}) async {
    try {
      Future<void> res = _quizzes.doc(quiz.quizId).set(quiz.toMap());
      return right(res);
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  //! check if room exists
  FutureEither<bool> checkIfQuizRoomExists({required String quizRoomId}) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
          .collection('quizzes')
          .where('quizRoomId', isEqualTo: quizRoomId)
          .limit(1)
          .get();

      return right(snapshot.docs.isNotEmpty);
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  //! confirm quiz creation
  FutureVoid confirmQuizCreation({
    required QuizModel quiz,
    required String quizRoomId,
  }) async {
    try {
      Future<void> res = _quizzes.doc(quiz.quizId).update({
        'isCreationComplete': true,
        'quizRoomId': quizRoomId,
      });
      return right(res);
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  //! join quiz room
  FutureVoid joinQuizRoom({
    required QuizModel quiz,
    required String uid,
  }) async {
    try {
      Future<void> res = _quizzes.doc(quiz.quizId).update({
        'participantsIds': FieldValue.arrayUnion([uid]),
      });
      return right(res);
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  //! get quiz by Id
  Stream<QuizModel> getQuizById({required String quizId}) {
    return _quizzes.doc(quizId).snapshots().map(
        (event) => QuizModel.fromMap(event.data() as Map<String, dynamic>));
  }

  //! get quiz by quiz room id
  Stream<QuizModel> getQuizByRoomId({required String quizRoomId}) {
    return _quizzes
        .where('quizRoomId', isEqualTo: quizRoomId)
        .limit(1)
        .snapshots()
        .map((querySnapshot) {
      return QuizModel.fromMap(
          querySnapshot.docs.first.data() as Map<String, dynamic>);
    });
  }

  //! add question to quiz
  FutureVoid addQuestionToQuiz({required QuestionModel question}) async {
    try {
      await _questions.doc(question.questionId).set(question.toMap());
      return right(_quizzes.doc(question.quizId).update({
        'questionIds': FieldValue.arrayUnion([question.questionId]),
      }));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  //! get all created quizzes
  Stream<List<QuizModel>> getAllQuizzes() {
    return _quizzes.snapshots().map((event) => event.docs
        .map(
          (e) => QuizModel.fromMap(e.data() as Map<String, dynamic>),
        )
        .toList());
  }

  //! get quizzes that areconfirmed
  Stream<List<QuizModel>> getConfirmedQuizzes() {
    return _quizzes
        .where('isCreationComplete', isEqualTo: true)
        .snapshots()
        .map((event) => event.docs
            .map(
              (e) => QuizModel.fromMap(e.data() as Map<String, dynamic>),
            )
            .toList());
  }

  //! get questions in a quiz
  Stream<List<QuestionModel>> getAllQuestionsInAQuiz({required String quizId}) {
    return _questions
        .where('quizId', isEqualTo: quizId)
        .snapshots()
        .map((event) => event.docs
            .map(
              (e) => QuestionModel.fromMap(e.data() as Map<String, dynamic>),
            )
            .toList());
  }

  //! edit a question
  FutureVoid editAQuestion({required QuestionModel question}) async {
    try {
      return right(
          _questions.doc(question.questionId).update(question.toMap()));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  //! delete a question
  FutureVoid deleteQuestion({required QuestionModel question}) async {
    try {
      await _questions.doc(question.questionId).delete();
      return right(_quizzes.doc(question.quizId).update({
        'questionIds': FieldValue.arrayRemove([question.questionId]),
      }));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  CollectionReference get _quizzes =>
      _firestore.collection(FirebaseConstants.quizzesCollection);

  CollectionReference get _questions =>
      _firestore.collection(FirebaseConstants.questionsCollection);
}
