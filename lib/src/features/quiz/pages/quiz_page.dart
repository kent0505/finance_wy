import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/models/quiz.dart';
import '../../../core/widgets/texts/text_m.dart';
import '../widgets/answer_button.dart';
import '../widgets/correct_count_dialog.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int index = 0;
  int correctAnswers = 0;
  bool buttonActive = true;

  void resetQuiz() {
    index = 0;
    correctAnswers = 0;
    quizesList.shuffle();
    for (Quiz quiz in quizesList) {
      quiz.answers.shuffle();
    }
  }

  void onAnswer(Answer answer) async {
    if (!buttonActive) return;
    setState(() {
      buttonActive = false;
      if (answer.isCorrect) {
        answer.color = Colors.greenAccent;
        correctAnswers++;
      } else {
        answer.color = Colors.redAccent;
      }
    });
    await Future.delayed(
      const Duration(seconds: 1),
      () {
        buttonActive = true;
        answer.color = Colors.white;
        if (index == 19) {
          if (mounted) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return CorrectCountDialog(
                  correctAnswers: correctAnswers,
                  onPressed: () {
                    context.pop();
                    resetQuiz();
                    setState(() {});
                  },
                );
              },
            );
          }
        } else {
          setState(() {
            index++;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    resetQuiz();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 230,
          width: double.infinity,
          color: Colors.white,
          child: SvgPicture.asset('assets/bg2.svg'),
        ),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              TextM(
                'Question ${index + 1}/20',
                fontSize: 32,
              ),
              const SizedBox(height: 20),
              Container(
                width: 316,
                height: 236,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    width: 3,
                    color: Colors.black,
                  ),
                ),
                child: Center(
                  child: TextM(
                    quizesList[index].question,
                    fontSize: 32,
                    color: const Color(0xff0F0F11),
                    maxLines: 4,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const Spacer(),
              AnswerButton(
                id: 'A',
                answer: quizesList[index].answers[0],
                onPressed: onAnswer,
              ),
              const SizedBox(height: 24),
              AnswerButton(
                id: 'B',
                answer: quizesList[index].answers[1],
                onPressed: onAnswer,
              ),
              const SizedBox(height: 24),
              AnswerButton(
                id: 'C',
                answer: quizesList[index].answers[2],
                onPressed: onAnswer,
              ),
              const SizedBox(height: 24),
              AnswerButton(
                id: 'D',
                answer: quizesList[index].answers[3],
                onPressed: onAnswer,
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ],
    );
  }
}
