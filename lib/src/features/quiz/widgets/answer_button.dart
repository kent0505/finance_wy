import 'package:flutter/material.dart';

import '../../../core/models/quiz.dart';
import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../core/widgets/texts/text_m.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.id,
    required this.answer,
    required this.onPressed,
  });

  final String id;
  final Answer answer;
  final void Function(Answer) onPressed;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 56,
      width: 316,
      decoration: BoxDecoration(
        color: answer.color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: CuperButton(
        onPressed: () {
          onPressed(answer);
        },
        child: Row(
          children: [
            const SizedBox(width: 16),
            Container(
              height: 26,
              width: 26,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(
                  width: 1,
                  color: Colors.black,
                ),
              ),
              child: Center(
                child: TextM(
                  id,
                  fontSize: 18,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: TextM(
                  answer.title,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(width: 42),
          ],
        ),
      ),
    );
  }
}
