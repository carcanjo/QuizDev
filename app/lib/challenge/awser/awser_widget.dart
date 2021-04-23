import 'package:app/core/app_colors.dart';
import 'package:app/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class AwnserWidget extends StatelessWidget {
  final String title;
  final bool isRight;
  final bool isSelected;

  const AwnserWidget({
    Key? key,
      required this.title,
      this.isRight = false,
      this.isSelected = false
    }) : super(key: key);


  // ignore: unused_element
  Color get _selectedColorRight =>
      isRight ? AppColors.darkGreen : AppColors.darkRed;
  // ignore: unused_element
  Color get _selectedBorderRight =>
      isRight ? AppColors.lightGreen : AppColors.lightRed;
  // ignore: unused_element
  Color get _selectedColorCardRight =>
      isRight ? AppColors.lightGreen : AppColors.lightRed;
  // ignore: unused_element
  Color get _selectedBorderCardRight =>
      isRight ? AppColors.green : AppColors.red;
  // ignore: unused_element
  TextStyle get _selectedTextStyleRight =>
      isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;
  // ignore: unused_element
  IconData get _selectedIconRight => isRight ? Icons.check : Icons.close;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16 , vertical: 8),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? _selectedColorCardRight : AppColors.white,
          borderRadius:  BorderRadius.circular(10),
          border: Border.fromBorderSide(BorderSide(
            color: isSelected ? _selectedBorderCardRight : AppColors.border,
          ),
         ),
        ),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Text(
            title,
            style: isSelected ? _selectedTextStyleRight : AppTextStyles.body,
            ),
          ),
          Container(
            height: 24,
            width: 24,
          decoration: BoxDecoration(
            color: isSelected ? _selectedColorRight : AppColors.white,
            borderRadius:  BorderRadius.circular(500),
            border: Border.fromBorderSide(BorderSide(
             color: isSelected ? _selectedBorderRight : AppColors.border
            ),
            ),
          ),
            child:
            isSelected ?
             Icon(
              Icons.check,
              size: 16,
              color: Colors.white,
              )
              : null,
          ),
        ]),
        
      ),
    );
  }
}