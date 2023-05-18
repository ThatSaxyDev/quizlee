// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class QuestionModel {
  final String quizId;
  final String questionId;
  final String questionTitle;
  final List<String> answerOptions;
  final int correctAnswerIndex;
  final int points;
  final int timeToAnswer;
  const QuestionModel({
    required this.quizId,
    required this.questionId,
    required this.questionTitle,
    required this.answerOptions,
    required this.correctAnswerIndex,
    required this.points,
    required this.timeToAnswer,
  });

  QuestionModel copyWith({
    String? quizId,
    String? questionId,
    String? questionTitle,
    List<String>? answerOptions,
    int? correctAnswerIndex,
    int? points,
    int? timeToAnswer,
  }) {
    return QuestionModel(
      quizId: quizId ?? this.quizId,
      questionId: questionId ?? this.questionId,
      questionTitle: questionTitle ?? this.questionTitle,
      answerOptions: answerOptions ?? this.answerOptions,
      correctAnswerIndex: correctAnswerIndex ?? this.correctAnswerIndex,
      points: points ?? this.points,
      timeToAnswer: timeToAnswer ?? this.timeToAnswer,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'quizId': quizId,
      'questionId': questionId,
      'questionTitle': questionTitle,
      'answerOptions': answerOptions,
      'correctAnswerIndex': correctAnswerIndex,
      'points': points,
      'timeToAnswer': timeToAnswer,
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      quizId: (map["quizId"] ?? '') as String,
      questionId: (map["questionId"] ?? '') as String,
      questionTitle: (map["questionTitle"] ?? '') as String,
      answerOptions: List<String>.from(
        ((map['answerOptions'] ?? const <String>[])),
      ),
      correctAnswerIndex: (map["correctAnswerIndex"] ?? 0) as int,
      points: (map["points"] ?? 0) as int,
      timeToAnswer: (map["timeToAnswer"] ?? 0) as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) =>
      QuestionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'QuestionModel(quizId: $quizId, questionId: $questionId, questionTitle: $questionTitle, answerOptions: $answerOptions, correctAnswerIndex: $correctAnswerIndex, points: $points, timeToAnswer: $timeToAnswer)';
  }

  @override
  bool operator ==(covariant QuestionModel other) {
    if (identical(this, other)) return true;

    return other.quizId == quizId &&
        other.questionId == questionId &&
        other.questionTitle == questionTitle &&
        listEquals(other.answerOptions, answerOptions) &&
        other.correctAnswerIndex == correctAnswerIndex &&
        other.points == points &&
        other.timeToAnswer == timeToAnswer;
  }

  @override
  int get hashCode {
    return quizId.hashCode ^
        questionId.hashCode ^
        questionTitle.hashCode ^
        answerOptions.hashCode ^
        correctAnswerIndex.hashCode ^
        points.hashCode ^
        timeToAnswer.hashCode;
  }
}
