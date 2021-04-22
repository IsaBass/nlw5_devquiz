import 'package:flutter/material.dart';

import 'package:devquiz/core/core.dart';
import 'package:devquiz/shared/widgets/progress_indicator_widget.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int totQuestions;
  final int questionAtual;
  const QuestionIndicatorWidget({
    Key? key,
    required this.totQuestions,
    required this.questionAtual,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Questão $questionAtual",
                style: AppTextStyles.body,
              ),
              Text(
                "de $totQuestions",
                style: AppTextStyles.body,
              ),
            ],
          ),
          SizedBox(height: 16),
          ProgressIndicatorWidget(value: questionAtual / totQuestions),
        ],
      ),
    );
  }
}
