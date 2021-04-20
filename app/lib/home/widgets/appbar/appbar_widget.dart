import 'package:app/core/app_gradients.dart';
import 'package:app/core/app_text_styles.dart';
import 'package:app/home/widgets/score_card/score_card_widget.dart';
import 'package:flutter/material.dart';

class AppBarWidGet extends PreferredSize {
  AppBarWidGet() : super(
    preferredSize: Size.fromHeight(250),
    child: Container(
      height: 250,
      decoration: BoxDecoration(gradient: AppGradients.linear), // pega a cor roxa de funco e coloca no card
      child: Stack(
        children: [      
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 161,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.maxFinite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(TextSpan(
                    text: "Olá, ",
                    style: AppTextStyles.title,
                    children: [
                      TextSpan(
                        text: "Cleiton Arcanjo",
                        style: AppTextStyles.titleBold
                      ),
                    ])),
                  Container(
                    width: 58,
                    height: 58,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), // deixar a borda arredondada
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://avatars.githubusercontent.com/u/60898489?v=4"
                        ),
                      ),
                    ),
                  ),],
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.0,1.0),
            child: ScoreCardWidGet()) // widget feito em outro card alinhado ao centro
        ],
      ),
    ),
  );
}