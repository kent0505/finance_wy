import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../core/widgets/texts/text_m.dart';
import '../widgets/day_chart.dart';
import '../widgets/month_chart.dart';
import '../widgets/week_chart.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key});

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  int index = 1;

  void onTabChange(int value) {
    setState(() {
      index = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const SizedBox(height: 80),
        const Center(
          child: TextM(
            'Settings',
            fontSize: 32,
          ),
        ),
        const SizedBox(height: 30),
        SizedBox(
          height: 42,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _Tab(
                id: 1,
                title: 'Day',
                current: index,
                onPressed: onTabChange,
              ),
              const SizedBox(width: 8),
              _Tab(
                id: 2,
                title: 'Week',
                current: index,
                onPressed: onTabChange,
              ),
              const SizedBox(width: 8),
              _Tab(
                id: 3,
                title: 'Month',
                current: index,
                onPressed: onTabChange,
              ),
            ],
          ),
        ),
        const SizedBox(height: 38),
        if (index == 1)
          const DayChart()
        else if (index == 2)
          const WeekChart()
        else
          const MonthChart(),
        const SizedBox(height: 15),
        Center(
          child: SizedBox(
            width: 316,
            child: Row(
              children: [
                Container(
                  height: 26,
                  width: 26,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.main,
                    border: Border.all(
                      width: 4,
                      color: Colors.white,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 4,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 44),
                const TextM('Income', fontSize: 17),
                const Spacer(),
                Container(
                  height: 26,
                  width: 26,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                    border: Border.all(
                      width: 4,
                      color: Colors.white,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 4,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 44),
                const TextM('Expense', fontSize: 17),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        const _Tile(title: 'Income', amount: 300),
        const SizedBox(height: 6),
        const _Tile(title: 'Expense', amount: 200),
        const SizedBox(height: 6),
        const _Tile(title: 'Total', amount: 300),
        const SizedBox(height: 38 + 78),
      ],
    );
  }
}

class _Tab extends StatelessWidget {
  const _Tab({
    required this.id,
    required this.title,
    required this.current,
    required this.onPressed,
  });

  final int id;
  final int current;
  final String title;
  final void Function(int) onPressed;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: identical(id, current) ? 42 : 38,
      width: identical(id, current) ? 116 : 106,
      child: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 42,
          width: 116,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              if (identical(id, current))
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                ),
            ],
          ),
          child: CuperButton(
            onPressed: () {
              onPressed(id);
            },
            child: Center(
              child: TextM(
                title,
                fontSize: identical(id, current) ? 18 : 17,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile({
    required this.title,
    required this.amount,
  });

  final String title;
  final int amount;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 56,
        width: 316,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            const SizedBox(width: 8),
            if (title == 'Income')
              SvgPicture.asset('assets/income.svg')
            else if (title == 'Expense')
              SvgPicture.asset('assets/expense.svg')
            else
              const SizedBox(width: 20),
            const SizedBox(width: 16),
            TextM(
              title,
              fontSize: 18,
              fontFamily: Fonts.light,
            ),
            const Spacer(),
            TextM(
              '\$$amount',
              fontSize: 18,
              fontFamily: Fonts.light,
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}
