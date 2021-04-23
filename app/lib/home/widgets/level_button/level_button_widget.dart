import 'package:app/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelButtonWidget extends StatelessWidget {
final String label;

LevelButtonWidget({
  Key? key,
  required this.label
}) : assert(['Médio','Fácil', 'Difícil','Períto'].contains(label)) , super(key: key);

final config = {
  'Médio':{
    'color': AppColors.levelButtonBorderMedio,
    'borderColor' : AppColors.levelButtonBorderMedio,
    'fontColor' : AppColors.levelButtonTextMedio 
  },
  'Fácil':{
    'color': AppColors.levelButtonBorderFacil,
    'borderColor' : AppColors.levelButtonBorderFacil,
    'fontColor' : AppColors.levelButtonTextFacil 
  },
  'Difícil':{
    'color': AppColors.levelButtonBorderDificil,
    'borderColor' : AppColors.levelButtonBorderDificil,
    'fontColor' : AppColors.levelButtonTextDificil 
  },
  'Períto':{
    'color': AppColors.levelButtonBorderPerito,
    'borderColor' : AppColors.levelButtonBorderPerito,
    'fontColor' : AppColors.levelButtonTextPerito 
  },
};

//pego a cor baseado na variavel config
Color get color => config[label]!['color']!; 
Color get borderColor => config[label]!['borderColor']!; 
Color get fontColor => config[label]!['fontColor']!; 

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        border: Border.fromBorderSide(BorderSide(
            color: borderColor
          )),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 6),
        child: Text(
          label, style: GoogleFonts.notoSans(
          color: fontColor, fontSize: 13)
        ),
      ),
    );
  }
}