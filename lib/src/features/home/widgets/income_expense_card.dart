import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/widgets/texts/text_m.dart';

class IncomeExpenseCard extends StatelessWidget {
  const IncomeExpenseCard({
    super.key,
    required this.amount,
    this.income = false,
  });

  final int amount;
  final bool income;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: 143,
      decoration: BoxDecoration(
        color: const Color(0xffFFD600),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Center(
            child: Column(
              children: [
                const SizedBox(height: 6),
                TextM(
                  income ? 'Income' : 'Expense',
                  fontSize: 16,
                ),
                TextM(
                  '\$ $amount',
                  fontSize: 22,
                  fontFamily: Fonts.bold,
                ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            left: 15,
            child: SvgPicture.asset(
              income ? 'assets/income.svg' : 'assets/expense.svg',
              height: 12,
            ),
          ),
        ],
      ),
    );
  }
}
