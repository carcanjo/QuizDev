import 'package:app/home/widgets/appbar/appbar_widget.dart';
import 'package:app/home/widgets/level_button/level_button_widget.dart';
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
      body: LevelButtonWidget(
        label: 'Facil',
      ),
    );
  }
}