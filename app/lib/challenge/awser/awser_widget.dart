import 'package:app/core/app_colors.dart';
import 'package:app/core/app_text_styles.dart';
import 'package:app/shared/models/awnser_model.dart';
import 'package:flutter/material.dart';

class AwnserWidget extends StatelessWidget {
  final AwnserModel awnserModel;
  final bool isSelected;
  final bool disabled;
  final ValueChanged<bool> onTap;

  const AwnserWidget({
    Key? key,
    required this.awnserModel,
    this.isSelected = false,
    this.disabled = false,
    required this.onTap
    }) : super(key: key);


  // ignore: unused_element
  Color get _selectedColorRight =>
      awnserModel.isRight ? AppColors.darkGreen : AppColors.darkRed;
  // ignore: unused_element
  Color get _selectedBorderRight =>
      awnserModel.isRight ? AppColors.lightGreen : AppColors.lightRed;
  // ignore: unused_element
  Color get _selectedColorCardRight =>
      awnserModel.isRight ? AppColors.lightGreen : AppColors.lightRed;
  // ignore: unused_element
  Color get _selectedBorderCardRight =>
      awnserModel.isRight ? AppColors.green : AppColors.red;
  // ignore: unused_element
  TextStyle get _selectedTextStyleRight =>
      awnserModel.isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;
  // ignore: unused_element
  IconData get _selectedIconRight => 
      awnserModel.isRight ? Icons.check : Icons.close;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16 , vertical: 8),
      child: IgnorePointer( 
        ignoring: disabled,
              child: GestureDetector(
                onTap: (){
                  onTap(awnserModel.isRight);
                },
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
                awnserModel.title,
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
                  _selectedIconRight,
                  size: 16,
                  color: Colors.white,
                  )
                  : null,
              ),
            ]),
            
          ),
        ),
      ),
    );
  }
}