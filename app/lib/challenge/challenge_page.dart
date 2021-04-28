import 'package:app/challenge/challenge_controller.dart';
import 'package:app/challenge/next_button/next_button_widget.dart';
import 'package:app/challenge/quiz/quiz_widget.dart';
import 'package:app/home/widgets/question_indicator/question_indicator.dart';
import 'package:app/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  const ChallengePage({Key? key, required this.questions }) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
final controller = ChallengeController();
final pageController = PageController();

  @override
    //altero o status no controller
  void initState(){
    //toda vez que tiver alguma notificação vou chamar o PageController (Nativo do Flutter) adicioanr uma lista ao meu controller
    //coloco o +1 para resolver o inicio de zero 
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });
    super.initState();
  }

  void nextPage(){
    if (controller.currentPage < widget.questions.length)
      pageController.nextPage(
          duration: Duration(milliseconds: 100),
            curve: Curves.linear, // para trocar de pagina coloco a animação
      );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(86),
        child: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(icon: Icon(Icons.close), onPressed: (){
                Navigator.pop(context);
                //posso fechar a pagina usando o Navigator.pop
              }),
              ValueListenableBuilder<int>
              //passo oque ele vai escutar no caso o controller >> contexto da pagina >> tipo
              (valueListenable: controller.currentPAgeNoetifier,
               builder: (context,value,_) => 
                QuestionIndicatorWidget(
                   currentPage: value,
                    lenght: widget.questions.length,
                ),
              ),
              //BackButton(), // ou usando BackButton para voltar na navegação
            ],
          ),
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(), // essa propriedade falo que não quero que aconteça o scroll vou fazer esse scroll usando o botão pular

        controller: pageController, //PageView aceita um controller 
        //uso PageView para acessar todas as listas nesse caso de perguntas efeito de passar pro lado
        children: widget.questions.map((e) => QuizWidget(questionModel: e, onChange:nextPage )).toList(),
        
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child:               ValueListenableBuilder<int>(
                valueListenable: controller.currentPAgeNoetifier,
                builder: (context,value,_) => 
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      if(value < widget.questions.length)
                        Expanded(child: NextButtinWidget.white(label: 'Pular', 
                          onTap: nextPage,
                        )), 

                      if(value == widget.questions.length)                     
                      Expanded(
                        child: NextButtinWidget.green(
                          label: 'Confirmar',
                           onTap: () {
                             Navigator.pop(context);
                           }
                        )),
                      ],
                    ),     
              ),
        ),
      ),
    );
  }
}