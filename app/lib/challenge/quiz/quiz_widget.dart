import 'package:app/challenge/awser/awser_widget.dart';
import 'package:app/core/app_text_styles.dart';
import 'package:app/shared/models/awnser_model.dart';
import 'package:app/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel questionModel;
  final VoidCallback onChange;

const QuizWidget({Key? key , required this.questionModel , required this.onChange }) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;

  // uso essa função retornar a awser
  AwnserModel awsers(int index) => widget.questionModel.awnsers[index];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 64,),
          Text(
            widget.questionModel.title,
            style: AppTextStyles.heading,
          ),
          SizedBox(
            height: 24,
          ),
          for(var i = 0; i < widget.questionModel.awnsers.length; i++ )
           AwnserWidget(
             awnserModel: awsers(i),
             disabled: indexSelected != -1,
             isSelected: indexSelected == i,
             onTap: (){
               indexSelected = i;
               setState(() {});
               //coloco um tempo de tres segundos antes de executar a troca de página
               Future.delayed(Duration(seconds: 1)).then((value) =>  widget.onChange());
             },
          ),
        ],
      ),
    );
  }
}