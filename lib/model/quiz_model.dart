// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class QuizModel {
  String id;
  String question;
  QuizModel({
    required this.id,
    required this.question,
  });

  QuizModel copyWith({
    String? id,
    String? question,
  }) {
    return QuizModel(
      id: id ?? this.id,
      question: question ?? this.question,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'question': question,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      id: map['id'] as String,
      question: map['question'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) => QuizModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'QuizModel(id: $id, question: $question)';

  @override
  bool operator ==(covariant QuizModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.question == question;
  }

  @override
  int get hashCode => id.hashCode ^ question.hashCode;
}
