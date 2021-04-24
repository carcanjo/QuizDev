import 'dart:convert';

import 'package:app/shared/models/question_model.dart';

enum Level{facil, medio, dificil, perito}

// criando uma extensão do Level pois no enum não conseguimos usar o MAP
// key acesso o valor do map
extension LeveStringlExt on String{
  Level get levelParse => {
    "facil" : Level.facil,
    "medio" : Level.medio,
    "dificil" : Level.dificil,
    "perito" : Level.perito
    }[this]!;
}

extension LevelExt on Level{
  String get parse => {   
    Level.facil: "facil",
    Level.medio: "medio",
    Level.dificil : "dificil",
    Level.perito : "perito"
  }[this]!;
}

class QuizModel {
  final String title;
  final List<QuestionModel> questions;
  final int questionAnswered;
  final String imagen;
  final Level level;
  
  QuizModel({
    required this.title,
    required this.questions,
    this.questionAnswered = 0,
    required this.imagen,
    required this.level
  });
  // quando coloco chaves no contrutor falo para ele que são parâmetros nomeados

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questions': questions.map((x) => x.toMap()).toList(),
      'questionAnswered': questionAnswered,
      'imagen': imagen,
      'level': level.parse
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      title: map['title'],
      questions: List<QuestionModel>.from(map['questions']?.map((x) => QuestionModel.fromMap(x))),
      questionAnswered: map['questionAnswered'],
      imagen: map['imagen'],
      level: map['level'].toString().levelParse,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) => QuizModel.fromMap(json.decode(source));
}
