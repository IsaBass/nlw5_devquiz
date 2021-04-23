import 'package:flutter/material.dart';

import 'package:devquiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String titleQuiz;
  final int acertos;
  final int total;
  const ResultPage({
    Key? key,
    required this.titleQuiz,
    required this.acertos,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.trophy),
            SizedBox(height: 24),
            Text(
              "Parabéns!",
              style: AppTextStyles.heading40,
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: Text.rich(
                TextSpan(
                    text: "Você concluiu",
                    style: AppTextStyles.body20,
                    children: [
                      TextSpan(
                        text: "\no $titleQuiz",
                        style: AppTextStyles.bodyBold.copyWith(fontSize: 20),
                      ),
                      TextSpan(
                        text: "\n com $acertos de $total questões.",
                        style: AppTextStyles.body.copyWith(fontSize: 20),
                      ),
                    ]),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(horizontal: 68),
              child: NextButtonWidget.purple(
                label: "Compartilhar",
                onTap: () {
                  Share.share('DevQuiz NLW 5 - Flutter:'
                      '\n Resultado do Quiz: $titleQuiz '
                      '\n Obtive $acertos acertos de $total questões.');
                },
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Voltar ao Início",
                style: AppTextStyles.bodyBold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
