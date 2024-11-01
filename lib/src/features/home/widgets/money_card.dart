import 'package:finance_wy/src/core/models/extra_model.dart';
import 'package:finance_wy/src/core/widgets/buttons/cuper_button.dart';
import 'package:finance_wy/src/core/widgets/texts/text_m.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/models/money.dart';
import '../../../core/utils.dart';

class MoneyCard extends StatelessWidget {
  const MoneyCard({
    super.key,
    required this.money,
  });

  final Money money;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 56,
        width: 316,
        margin: const EdgeInsets.only(top: 22),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: CuperButton(
          onPressed: () {
            context.push(
              '/add',
              extra: ExtraModel(
                income: money.income,
                add: false,
                money: money,
              ),
            );
          },
          child: Row(
            children: [
              const SizedBox(width: 14),
              SvgPicture.asset(
                money.income ? 'assets/income.svg' : 'assets/expense.svg',
                height: 20,
              ),
              const SizedBox(width: 20),
              SvgPicture.asset(
                getCategoryAsset(money.category),
                height: 20,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 7),
                    TextM(
                      money.title,
                      fontSize: 16,
                      fontFamily: Fonts.regular,
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Container(
                          height: 20,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            color: const Color(0xffFEDD2D),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: TextM(
                              money.category,
                              fontSize: 14,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                        Container(
                          height: 20,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            color: const Color(0xffFEDD2D),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: TextM(
                              money.income ? 'Income' : 'Expense',
                              fontSize: 14,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              TextM(
                '\$ ${money.amount}',
                fontSize: 12,
                fontFamily: Fonts.bold,
              ),
              const SizedBox(width: 14),
            ],
          ),
        ),
      ),
    );
  }
}
