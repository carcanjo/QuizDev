import 'package:app/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButtinWidget extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color fontColor;
  final Color borderColor;
  final VoidCallback onTap;

  //Construtor da classe 
   NextButtinWidget({ 
     required this.label,
     required this.backgroundColor,
     required this.fontColor,
     required this.borderColor,
     required this.onTap
  }); 

  //Contrutor nomeado para usar as cores no button
  NextButtinWidget.green({ required String label, required VoidCallback onTap })
    : this.backgroundColor = AppColors.darkGreen,
      this.fontColor = AppColors.white,
      this.label = label,
      this.onTap = onTap,
      this.borderColor = AppColors.green;
      
  //Contrutor nomeado para usar as cores no button
  NextButtinWidget.white({required String label , required VoidCallback onTap })
    : this.backgroundColor = AppColors.white,
      this.fontColor = AppColors.grey,
      this.label = label,
      this.onTap = onTap,
      this.borderColor = AppColors.black;

  //Contrutor nomeado para usar as cores no button
  NextButtinWidget.purple({required String label , required VoidCallback onTap })
    : this.backgroundColor = AppColors.purple,
      this.fontColor = AppColors.white,
      this.borderColor = AppColors.green,
      this.label = label,
      this.onTap = onTap;


  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            backgroundColor
          ),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10))),
          
          side: MaterialStateProperty.all(BorderSide(color: borderColor))
          
        ),
        onPressed: onTap,
        child: Text(label,
        style: GoogleFonts.notoSans(
          fontWeight: FontWeight.w600,
          fontSize: 15, // tamanho da letra
          color: fontColor // cor da letra
        ))),
    );
  }
}
