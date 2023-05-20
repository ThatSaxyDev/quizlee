// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class QuizModel {
  final String uid;
  final String quizId;
  final String image;
  final String title;
  final String description;
  final DateTime date;
  final String time;
  final List<dynamic> questionIds;
  final bool isPublic;
  final DateTime createdAt;
  final bool isCreationComplete;
  final String quizRoomId;
  final List<dynamic> participantsIds;
  const QuizModel({
    required this.uid,
    required this.quizId,
    required this.image,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.questionIds,
    required this.isPublic,
    required this.createdAt,
    required this.isCreationComplete,
    required this.quizRoomId,
    required this.participantsIds,
  });

  QuizModel copyWith({
    String? uid,
    String? quizId,
    String? image,
    String? title,
    String? description,
    DateTime? date,
    String? time,
    List<dynamic>? questionIds,
    bool? isPublic,
    DateTime? createdAt,
    bool? isCreationComplete,
    String? quizRoomId,
    List<dynamic>? participantsIds,
  }) {
    return QuizModel(
      uid: uid ?? this.uid,
      quizId: quizId ?? this.quizId,
      image: image ?? this.image,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      time: time ?? this.time,
      questionIds: questionIds ?? this.questionIds,
      isPublic: isPublic ?? this.isPublic,
      createdAt: createdAt ?? this.createdAt,
      isCreationComplete: isCreationComplete ?? this.isCreationComplete,
      quizRoomId: quizRoomId ?? this.quizRoomId,
      participantsIds: participantsIds ?? this.participantsIds,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'quizId': quizId,
      'image': image,
      'title': title,
      'description': description,
      'date': date.millisecondsSinceEpoch,
      'time': time,
      'questionIds': questionIds,
      'isPublic': isPublic,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'isCreationComplete': isCreationComplete,
      'quizRoomId': quizRoomId,
      'participantsIds': participantsIds,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      uid: (map["uid"] ?? '') as String,
      quizId: (map["quizId"] ?? '') as String,
      image: (map["image"] ?? '') as String,
      title: (map["title"] ?? '') as String,
      description: (map["description"] ?? '') as String,
      date: DateTime.fromMillisecondsSinceEpoch((map["date"]??0) as int),
      time: (map["time"] ?? '') as String,
      questionIds: List<dynamic>.from(((map['questionIds'] ?? const <dynamic>[]) as List<dynamic>),),
      isPublic: (map["isPublic"] ?? false) as bool,
      createdAt: DateTime.fromMillisecondsSinceEpoch((map["createdAt"]??0) as int),
      isCreationComplete: (map["isCreationComplete"] ?? false) as bool,
      quizRoomId: (map["quizRoomId"] ?? '') as String,
      participantsIds: List<dynamic>.from(((map['participantsIds'] ?? const <dynamic>[]) as List<dynamic>),),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'QuizModel(uid: $uid, quizId: $quizId, image: $image, title: $title, description: $description, date: $date, time: $time, questionIds: $questionIds, isPublic: $isPublic, createdAt: $createdAt, isCreationComplete: $isCreationComplete, quizRoomId: $quizRoomId, participantsIds: $participantsIds)';
  }

  @override
  bool operator ==(covariant QuizModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.uid == uid &&
      other.quizId == quizId &&
      other.image == image &&
      other.title == title &&
      other.description == description &&
      other.date == date &&
      other.time == time &&
      listEquals(other.questionIds, questionIds) &&
      other.isPublic == isPublic &&
      other.createdAt == createdAt &&
      other.isCreationComplete == isCreationComplete &&
      other.quizRoomId == quizRoomId &&
      listEquals(other.participantsIds, participantsIds);
  }

  @override
  int get hashCode {
    return uid.hashCode ^
      quizId.hashCode ^
      image.hashCode ^
      title.hashCode ^
      description.hashCode ^
      date.hashCode ^
      time.hashCode ^
      questionIds.hashCode ^
      isPublic.hashCode ^
      createdAt.hashCode ^
      isCreationComplete.hashCode ^
      quizRoomId.hashCode ^
      participantsIds.hashCode;
  }
}
