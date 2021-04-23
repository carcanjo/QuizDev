import 'package:app/challenge/awser/awser_widget.dart';
import 'package:app/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  final String title;
const QuizWidget({Key? key , required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            title,
            style: AppTextStyles.heading,
          ),
          SizedBox(
            height: 24,
          ),
          AwnserWidget(isRight: true ,isSelected: true, title: 'Possibilita criação de aplicativos compilados nativamente'),
          AwnserWidget(title: 'Possibilita criação de aplicativos compilados nativamente'),
          AwnserWidget(title: 'Possibilita criação de aplicativos compilados nativamente'),
          AwnserWidget(isRight: true ,isSelected: true, title: 'Possibilita criação de aplicativos compilados nativamente'),
        ],
      ),
    );
  }
}