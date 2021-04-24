
import 'package:app/core/app_gradients.dart';
import 'package:app/core/app_text_styles.dart';
import 'package:app/home/widgets/score_card/score_card_widget.dart';
import 'package:app/shared/models/user_model.dart';
import 'package:flutter/material.dart';

class AppBarWidGet extends PreferredSize {
  //vou passar um user para essa classe para redenrizar dinamicamente
  final UserModel user;

  AppBarWidGet({ required this.user }) : super(
    preferredSize: Size.fromHeight(250),
    child: Container(
      height: 250,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.1),
        child: Stack(
          children: [      
            Container(
              height: 161,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(gradient: AppGradients.linear),
              width: double.maxFinite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(TextSpan(
                    text: "Olá, ",
                    style: AppTextStyles.title,
                    children: [
                      TextSpan(
                        text:user.name,
                        style: AppTextStyles.titleBold
                      ),
                    ])),
                  Container(
                    width: 58,
                    height: 58,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), // deixar a borda arredondada
                      image: DecorationImage(
                        image: NetworkImage(user.photoUrl),
                      ),
                    ),
                  ),],
              ),
            ),
            Align(
              alignment: Alignment(0.0,1.0),
              child: ScoreCardWidGet()) // widget feito em outro card alinhado ao centro
          ],
        ),
      ),
    ),
  );
}