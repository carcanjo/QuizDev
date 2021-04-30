import 'package:app/core/app_gradients.dart';
import 'package:app/core/app_images.dart';
import 'package:app/home/home_page.dart';
import 'package:flutter/material.dart';

//como é uma classe que nunca vai ser alterada usamos StatelessWidget
class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
      // coloco um delay de 2 segundos e envio para homePage
      // pushReplacement substitui ao invés de empilhar
      Future.delayed(Duration(seconds: 3))
      .then((value) => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage())));

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppGradients.linear
        ),
        child: Center(
          child: Image.asset(AppImages.logo)
        ),
      ),
    );
  }
}