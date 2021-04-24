import 'package:app/core/app_colors.dart';
import 'package:app/home/home_controller.dart';
import 'package:app/home/home_state.dart';
import 'package:app/home/widgets/appbar/appbar_widget.dart';
import 'package:app/home/widgets/level_button/level_button_widget.dart';
import 'package:app/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //inicializo meu controller
  final controller = HomeController();
  
  //função carrega antes de iniciar qualquer coisa, tudo que esta dentro dela é chamado
  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.getQuizzes();

    // fica ouvindo todas alterações de estado que vai acontecer durante o uso do app
    controller.stateNotifier.addListener(() {
      //toda vez que tiver uma atualização vai chamar o setState para atualizar o status
      setState(() {});
    });

  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.success){
        return Scaffold(
        appBar: AppBarWidGet(user: controller.user!,),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // espaçamento entre os botões
                children: [
                  LevelButtonWidget(label: 'Fácil'),
                  LevelButtonWidget(label: 'Médio'),
                  LevelButtonWidget(label: 'Difícil'),
                  LevelButtonWidget(label: 'Períto'),
                ],
              ),
              SizedBox(
                height: 24,
              ),

              Expanded(
                child: GridView.count(
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16, // AQUI CONFIGURO O ESPAÇAMENTO ENTRE OS ITENS
                  crossAxisCount: 2, // AQUI FALO PRO COMPONENTE QUE SÓ VAI COLOCAR DOIS POR LINHA
                  children: 
                  //map converte uma lista de um tipo em outra lista
                  controller.quizzes!.map((e) => QuizCardWidget(
                    title: e.title,
                    completed: '${e.questionAnswered}/${e.questions.length}',
                    percent: e.questionAnswered / e.questions.length
                  )).toList()),
                ),
            ],
          ),
        ),
        
      );
    }else{
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              AppColors.darkGreen,
            ),
          ),
        ),
      );
    } 
  }
}