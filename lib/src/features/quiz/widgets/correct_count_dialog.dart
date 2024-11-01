import 'package:flutter/material.dart';

import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../core/widgets/texts/text_m.dart';

class CorrectCountDialog extends StatelessWidget {
  const CorrectCountDialog({
    super.key,
    required this.correctAnswers,
    required this.onPressed,
  });

  final int correctAnswers;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.main,
      child: SizedBox(
        height: 150,
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextM(
              'Correct answers: $correctAnswers',
              fontSize: 24,
              fontFamily: Fonts.heavy,
            ),
            const Spacer(),
            CuperButton(
              padding: 0,
              onPressed: onPressed,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextM(
                    'CLOSE',
                    fontSize: 14,
                    fontFamily: Fonts.medium,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
