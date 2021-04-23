import 'package:app/core/core.dart';
import 'package:flutter/material.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  final double value; 
  const ProgressIndicatorWidget({Key? key , required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  LinearProgressIndicator(
          value: value,
          backgroundColor: AppColors.chartSecondary,
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary) 
          //Como LinearProgressIndicator é uma animação temos que usar AlwaysStoppedAnimation para ficar statico    
        );
  }
}