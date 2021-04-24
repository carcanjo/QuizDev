import 'dart:convert';

import 'package:app/shared/models/quiz_model.dart';
import 'package:app/shared/models/user_model.dart';
import 'package:flutter/services.dart';

class HomeRepositoty{

  Future<UserModel> getUser() async {
    //recurso para acessar arquivos no dart
     final response = await rootBundle.loadString("assets/database/user.json");
     final user = UserModel.fromJson(response);
     return user;
   }

  Future<List<QuizModel>> getQuizzes() async { 
    final response = await rootBundle.loadString("assets/database/quizzes.json");
    final list = jsonDecode(response) as List;
    final quizzes = list.map((e) => QuizModel.fromMap(e)).toList();

    return quizzes;
  }

}