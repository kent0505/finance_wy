import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../core/widgets/texts/text_m.dart';

class AddIncomeButton extends StatelessWidget {
  const AddIncomeButton({
    super.key,
    this.income = false,
    this.history = false,
    this.active = false,
    required this.title,
    required this.onPressed,
  });

  final bool income;
  final bool history;
  final bool active;
  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64,
      height: 64,
      child: Center(
        child: Container(
          height: active ? 64 : 56,
          width: active ? 64 : 56,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              if (active)
                BoxShadow(
                  blurRadius: 4,
                  color: Colors.black.withOpacity(0.25),
                  offset: const Offset(0, 4),
                ),
            ],
          ),
          child: CuperButton(
            onPressed: onPressed,
            child: Column(
              children: [
                const SizedBox(height: 4),
                SizedBox(
                  height: active ? 27 : 24,
                  child: SvgPicture.asset(
                    history
                        ? 'assets/history.svg'
                        : income
                            ? 'assets/income_add.svg'
                            : 'assets/expense_add.svg',
                  ),
                ),
                const SizedBox(height: 4),
                TextM(
                  title,
                  fontSize: 12,
                  fontFamily: Fonts.regular,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
