import 'package:devquiz/challenge/challenge_controller.dart';
import 'package:devquiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:devquiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:devquiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  final QuizModel quiz;

  const ChallengePage({Key? key, required this.quiz}) : super(key: key);
  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final ChallengeController _controller = ChallengeController();

  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
      _controller.currentPage = pageController.page!.toInt();
    });
  }

  void nextPage() {
    if (_controller.currentPage < widget.quiz.questions.length - 1)
      pageController.nextPage(
        duration: Duration(milliseconds: 100),
        curve: Curves.linear,
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(86),
        child: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButton(),
              ValueListenableBuilder<int>(
                valueListenable: _controller.currentPageNotifier,
                builder: (ctx, value, _) => QuestionIndicatorWidget(
                  totQuestions: widget.quiz.questions.length,
                  questionAtual: value + 1,
                ),
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        controller: pageController,
        // physics: NeverScrollableScrollPhysics(),
        children: widget.quiz.questions
            .map((e) => QuizWidget(
                  question: e,
                  onChange: nextPage,
                ))
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ValueListenableBuilder<int>(
              valueListenable: _controller.currentPageNotifier,
              builder: (ctx, value, _) =>
                  //value == widget.quiz.questions.length
                  //?
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      if (value != widget.quiz.questions.length - 1)
                        Expanded(
                            child: NextButtonWidget.white(
                          label: "Pular",
                          onTap: nextPage,
                        )),
                      if (value == widget.quiz.questions.length - 1)
                        SizedBox(width: 7),
                      if (value == widget.quiz.questions.length - 1)
                        Expanded(
                            child: NextButtonWidget.green(
                          label: "Confirmar",
                          onTap: () {},
                        ))
                    ],
                  )
              // : Container(),
              ),
        ),
      ),
    );
  }
}
