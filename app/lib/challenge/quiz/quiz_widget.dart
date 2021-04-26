import 'package:app/challenge/awser/awser_widget.dart';
import 'package:app/core/app_text_styles.dart';
import 'package:app/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  final QuestionModel questionModel;

const QuizWidget({Key? key , required this.questionModel  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 64,),
          Text(
            questionModel.title,
            style: AppTextStyles.heading,
          ),
          SizedBox(
            height: 24,
          ),
          ...questionModel.awnsers.map((e) => AwnserWidget(
            isRight: e.isRight,
            title: e.title),
          ).toList(),
        ],
      ),
    );
  }
}