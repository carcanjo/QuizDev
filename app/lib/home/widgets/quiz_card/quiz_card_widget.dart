import 'package:app/core/app_colors.dart';
import 'package:app/core/app_text_styles.dart';
import 'package:app/core/core.dart';
import 'package:app/shared/widgets/progress_indicator/progress_indicator.widget.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final String completed;
  final double percent;

  QuizCardWidget({
    Key? key,
    required this.title,
    required this.completed,
    required this.percent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          border: Border.fromBorderSide(BorderSide(
            color: AppColors.border)),
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              width: 40,
              child: Image.asset(AppImages.blocks),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              title,
               style: AppTextStyles.heading15,
            ),
            SizedBox(
              height: 24, //espeço entre os cards
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    completed,
                     style: AppTextStyles.body11
                  ),
                ),

              Expanded(
                  flex: 4,
                  child: ProgressIndicatorWidget(
                    value: percent,
                  ),
                ),
          ],
        ),
      ])
      ),
    );
  }
}
