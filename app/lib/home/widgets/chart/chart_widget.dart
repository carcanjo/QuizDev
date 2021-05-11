import 'package:app/core/app_colors.dart';
import 'package:app/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatefulWidget {
  final double percent;
  ChartWidget({
    Key? key,
    required this.percent,
  }) : super(key: key);

  @override
  _ChartWidgetState createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget> with SingleTickerProviderStateMixin {

  //late para ser iniciado depois
  late AnimationController _controller;
  late Animation<double> _animation;

  void initAnimation(){
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animation = Tween<double>(begin: 0.0,end: widget.percent).animate(_controller);

    _controller.forward(); //start na animação
  }

  @override
  void initState() {
    initAnimation();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Container( 
      height: 80,
      width: 80,
      child: AnimatedBuilder(
        animation:  _animation,
        builder: (context, _) =>  
          Stack(
            children: [
              Center(
                child: Container(
                  height: 80,
                  width: 80,
                  child: CircularProgressIndicator(
                    strokeWidth: 10, //largura do progresso do grafico
                    value: _animation.value,
                    backgroundColor: AppColors.chartSecondary,
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
                  ), 
                ),
              ),
              Center(
                child: Text("${(_animation.value * 100).toInt()}%", 
                style: AppTextStyles.heading
                ),
              ),
            ],
          ),   
        ),
    );
  }
}
