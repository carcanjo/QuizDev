import 'package:app/home/widgets/appbar/appbar_widget.dart';
import 'package:app/home/widgets/level_button/level_button_widget.dart';
import 'package:app/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidGet(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 24,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // espaçamento entre os botões
              children: [
                LevelButtonWidget(
                  label: 'Fácil',
                ),
                  LevelButtonWidget(
                  label: 'Médio',
                ),
                  LevelButtonWidget(
                  label: 'Difícil',
                ),
                  LevelButtonWidget(
                  label: 'Períto',
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),

            Expanded(
              child: GridView.count(
                crossAxisSpacing: 16,
                mainAxisSpacing: 16, // AQUI CONFIGURO O ESPAÇAMENTO ENTRE OS ITENS
                crossAxisCount: 2, // AQUI FALO PRO COMPONENTE QUE SÓ VAI COLOCAR DOIS POR LINHA
                children: [
                  QuizCardWidget(),
                  QuizCardWidget(),
                  QuizCardWidget(),
                ]),
              ),
          ],
        ),
      ),
      
    );
  }
}