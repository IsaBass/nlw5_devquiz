import 'package:flutter/material.dart';

import 'package:devquiz/core/core.dart';
import 'package:devquiz/shared/models/awnser_model.dart';

class AwnserWidget extends StatelessWidget {
  final AwnserModel awnser;
  final bool isSelected;
  final ValueChanged<bool> onTap;
  final bool disable;

  const AwnserWidget({
    Key? key,
    required this.awnser,
    this.isSelected = false,
    required this.onTap,
    required this.disable,
  }) : super(key: key);

  Color get _selectedColorRight => isSelected
      ? awnser.isRight
          ? AppColors.darkGreen
          : AppColors.darkRed
      : AppColors.white;
  Color get _selectedBorderRight => isSelected
      ? awnser.isRight
          ? AppColors.lightGreen
          : AppColors.lightRed
      : AppColors.border;
  Color get _selectedColorCardRight => isSelected
      ? awnser.isRight
          ? AppColors.lightGreen
          : AppColors.lightRed
      : AppColors.white;
  Color get _selectedBorderCardRight => isSelected
      ? awnser.isRight
          ? AppColors.green
          : AppColors.red
      : AppColors.border;

  TextStyle get _selectedTextStyleRight => isSelected
      ? awnser.isRight
          ? AppTextStyles.bodyDarkGreen
          : AppTextStyles.bodyDarkRed
      : AppTextStyles.body;

  IconData get _selectedIconRight => awnser.isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: disable,
      child: GestureDetector(
        onTap: () {
          onTap(awnser.isRight);
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: _selectedColorCardRight,
            borderRadius: BorderRadius.circular(10),
            border: Border.fromBorderSide(
              BorderSide(
                color: _selectedBorderCardRight,
              ),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  awnser.title,
                  style: _selectedTextStyleRight,
                ),
              ),
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: _selectedColorRight,
                  borderRadius: BorderRadius.circular(500),
                  border: Border.fromBorderSide(BorderSide(
                    color: _selectedBorderRight,
                  )),
                ),
                child: isSelected
                    ? Icon(
                        _selectedIconRight,
                        size: 16,
                        color: AppColors.white,
                      )
                    : null,
              )
            ],
          ),
        ),
      ),
    );
  }
}
