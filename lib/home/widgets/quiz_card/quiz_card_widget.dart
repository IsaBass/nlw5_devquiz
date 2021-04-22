import 'package:devquiz/challenge/challenge_page.dart';
import 'package:flutter/material.dart';

import 'package:devquiz/core/core.dart';
import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:devquiz/shared/widgets/progress_indicator_widget.dart';

class QuizCardWidget extends StatelessWidget {
  final QuizModel quiz;

  const QuizCardWidget({
    Key? key,
    required this.quiz,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("clicou ${quiz.title}");
        Navigator.push(context,
            MaterialPageRoute(builder: (ctx) => ChallengePage(quiz: quiz)));
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              child: Image.asset(AppImages.data),
              //Image.asset(quiz.imagem),
            ),
            SizedBox(height: 24),
            Text(
              quiz.title,
              style: AppTextStyles.heading15,
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Text(
                        "${quiz.questionsAwnsered} de ${quiz.questions.length}",
                        style: AppTextStyles.body11)),
                Expanded(
                  flex: 2,
                  child: ProgressIndicatorWidget(
                    value: quiz.questionsAwnsered > 0
                        ? quiz.questionsAwnsered / quiz.questions.length
                        : 0.0,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
