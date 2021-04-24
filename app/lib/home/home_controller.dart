import 'package:app/home/home_repositoty.dart';
import 'package:app/home/home_state.dart';
import 'package:app/shared/models/quiz_model.dart';
import 'package:app/shared/models/user_model.dart';
import 'package:flutter/foundation.dart';

class HomeController{
  //esse controller vai gerenciae os usuarios e as perguntas
  // ValueNotifier é uma gerencia de estados nativa do
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  //declaro um set para poder usar a variavel no sclfold
  set state(HomeState state) => stateNotifier.value = state; 
  HomeState get state => stateNotifier.value;
  
  UserModel? user;
  List<QuizModel>? quizzes;

  final respository = HomeRepositoty();

//simulação de uma chamada de uma API
  void getUser() async {
    state =  HomeState.loading;
    user = await respository.getUser();
    state = HomeState.success;
  }

  void getQuizzes() async{
    state =  HomeState.loading;
    quizzes = await respository.getQuizzes();
    state = HomeState.success;
  }
}