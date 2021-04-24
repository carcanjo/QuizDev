import 'package:app/challenge/quiz/quiz_widget.dart';
import 'package:app/home/widgets/question_indicator/question_indicator.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
const ChallengePage({Key? key}) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SafeArea(
          top: true,
          child: QuestionIndicatorWidget(),
        ),
      ),
      body: QuizWidget(
        title: 'O que o flutter faz em sua totalidade?',
      ),
    );
  }
}