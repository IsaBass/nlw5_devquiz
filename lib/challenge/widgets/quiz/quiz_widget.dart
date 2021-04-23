import 'package:flutter/material.dart';

import 'package:devquiz/challenge/widgets/awnser/awnser_widget.dart';
import 'package:devquiz/core/core.dart';
import 'package:devquiz/shared/models/awnser_model.dart';
import 'package:devquiz/shared/models/question_model.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final ValueChanged<bool> onSelected;
  const QuizWidget({
    Key? key,
    required this.question,
    required this.onSelected,
  }) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;

  AwnserModel awnser(int index) => widget.question.awnsers[index];

  @override
  Widget build(BuildContext context) {
    // widget.question.awnsers.shuffle(Random(5));
    return Container(
      child: Column(
        children: [
          SizedBox(height: 30),
          Text(
            widget.question.title,
            style: AppTextStyles.heading.copyWith(fontSize: 20),
          ),
          SizedBox(height: 24),
          for (var i = 0; i < widget.question.awnsers.length; i++)
            AwnserWidget(
              awnser: awnser(i),
              isSelected: indexSelected == i,
              disable: indexSelected != -1,
              onTap: (value) {
                setState(() {
                  indexSelected = i;
                });
                Future.delayed(Duration(seconds: 2))
                    .then((_) => widget.onSelected(value));
              },
            ),
        ],
      ),
    );
  }
}
