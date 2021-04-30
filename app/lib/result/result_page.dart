import 'package:app/challenge/next_button/next_button_widget.dart';
import 'package:app/core/app_images.dart';
import 'package:app/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int lenght;

  const ResultPage({Key? key, required this.title, required this.lenght }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //colocar o text dentro de uma coluna pois vou add varios itens 
    return Scaffold(
      body: Container(
        width: double.maxFinite, // forço os componentes a ficarem todos no centro
        padding: EdgeInsets.only(top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImages.trophy),
            Column(
              children: [
                 Text(
                "Parabéns!",
                style: AppTextStyles.heading40
                ),

                SizedBox(
                  height: 16
                ),
                
                Text.rich(
                  TextSpan(
                    text: "Você concluiu ",
                    style: AppTextStyles.body,
                    children: [
                      TextSpan( text: "\n $title",style: AppTextStyles.bodyBold,),
                      TextSpan( text: "\ncom seis de $lenght acertos", style: AppTextStyles.body,),

                    ]),
                    textAlign: TextAlign.center,
                )],
            ),

            Column(
              children: [
                Row(
                  children: [
                    Expanded(child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 68),
                      child: NextButtinWidget.purple(label: "Compartilhar", onTap: (){}),
                    )),
                  ],
                ),

                SizedBox(
                  height: 24,
                ),// espaço entre os botões de 24 pixels
                Row(
                  children: [
                  Expanded(child:  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 68),
                    child: NextButtinWidget.white(label: "Voltar ao inicio", onTap: (){
                      Navigator.pop(context);
                    }),
                  )),
                  ]),
              ],
            ),
          ],
        ),
      ),

    );
  }
}