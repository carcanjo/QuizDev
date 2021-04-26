import 'package:app/challenge/challenge_controller.dart';
import 'package:app/challenge/next_button/next_button_widget.dart';
import 'package:app/challenge/quiz/quiz_widget.dart';
import 'package:app/home/widgets/question_indicator/question_indicator.dart';
import 'package:app/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;

const ChallengePage({Key? key, required this.questions}) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
final controller = ChallengeController();

  @override
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
              //BackButton(), // ou usando BackButton para voltar na navegação
              QuestionIndicatorWidget(
                currentPage: controller.currentPage,
                lenght: widget.questions.length,
              ),
            ],
          ),
        ),
      ),
      body: QuizWidget(
        questionModel: widget.questions[0],
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround, // coloco o espaço entre os botões
            children: [
              Expanded(child: NextButtinWidget.white(label: 'Fácil', onTap: () {})),
              SizedBox(width: 10),
              Expanded(child: NextButtinWidget.green(label: 'Confirmar', onTap: () {} )),
            ],
          ),
        ),
      ),
    );
  }
}