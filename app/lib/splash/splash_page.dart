import 'package:app/core/app_gradients.dart';
import 'package:app/core/app_images.dart';
import 'package:flutter/material.dart';

//como é uma classe que nunca vai ser alterada usamos StatelessWidget
class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppGradients.linear),
        child: Center(
          child: Image.asset(AppImages.logo)),
      ),
    );
  }
}