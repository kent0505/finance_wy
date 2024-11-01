import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/db/db.dart';
import '../../../core/models/money.dart';
import '../../../core/widgets/texts/text_m.dart';

class MonthChart extends StatefulWidget {
  const MonthChart({super.key});

  @override
  State<MonthChart> createState() => _MonthChartState();
}

class _MonthChartState extends State<MonthChart> {
  List<int> weeklyExpenses = [0, 0, 0, 0];
  List<int> weeklyIncomes = [0, 0, 0, 0];
  List<int> normalizedIncomes = [0, 0, 0, 0];
  List<int> normalizedExpenses = [0, 0, 0, 0];

  void getWeeklyMoney() {
    DateTime today = DateTime.now();
    int currentMonth = today.month;

    for (Money money in moneyList) {
      DateTime date = DateTime.fromMillisecondsSinceEpoch(money.id * 1000);
      if (date.year == today.year && date.month == currentMonth) {
        int weekOfMonth = (date.day - 1) ~/ 7;
        if (money.income) {
          weeklyIncomes[weekOfMonth] += money.amount;
        } else {
          weeklyExpenses[weekOfMonth] += money.amount;
        }
      }
    }

    int maxWeekly = 0;
    for (int i = 0; i < 4; i++) {
      maxWeekly = max(maxWeekly, max(weeklyIncomes[i], weeklyExpenses[i]));
    }

    for (int i = 0; i < 4; i++) {
      if (maxWeekly > 0) {
        normalizedIncomes[i] = ((weeklyIncomes[i] / maxWeekly) * 210).round();
        normalizedExpenses[i] = ((weeklyExpenses[i] / maxWeekly) * 210).round();
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getWeeklyMoney();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 290,
        width: 340,
        padding: const EdgeInsets.only(left: 37, right: 13),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
        ),
        child: Stack(
          children: [
            Positioned(top: 24, child: SvgPicture.asset('assets/line.svg')),
            Positioned(top: 24 * 2, child: SvgPicture.asset('assets/line.svg')),
            Positioned(top: 24 * 3, child: SvgPicture.asset('assets/line.svg')),
            Positioned(top: 24 * 4, child: SvgPicture.asset('assets/line.svg')),
            Positioned(top: 24 * 5, child: SvgPicture.asset('assets/line.svg')),
            Positioned(top: 24 * 6, child: SvgPicture.asset('assets/line.svg')),
            Positioned(top: 24 * 7, child: SvgPicture.asset('assets/line.svg')),
            Positioned(top: 24 * 8, child: SvgPicture.asset('assets/line.svg')),
            Positioned(top: 24 * 9, child: SvgPicture.asset('assets/line.svg')),
            Positioned(
              top: 24 * 10,
              child: SvgPicture.asset('assets/line.svg'),
            ),
            Positioned(
              bottom: 26,
              child: Container(
                width: 1,
                height: 240,
                color: Colors.black,
              ),
            ),
            Column(
              children: [
                const SizedBox(height: 55),
                Expanded(
                  child: BarChart(
                    BarChartData(
                      maxY: 210,
                      borderData: FlBorderData(show: false),
                      titlesData: const FlTitlesData(
                        bottomTitles: AxisTitles(sideTitles: SideTitles()),
                        leftTitles: AxisTitles(sideTitles: SideTitles()),
                        rightTitles: AxisTitles(sideTitles: SideTitles()),
                        topTitles: AxisTitles(sideTitles: SideTitles()),
                      ),
                      barTouchData: BarTouchData(enabled: false),
                      barGroups: List.generate(4, (index) {
                        return BarChartGroupData(
                          x: index,
                          barsSpace: 4,
                          barRods: [
                            BarChartRodData(
                              toY: normalizedIncomes[index].toDouble(),
                              width: 7,
                              color: AppColors.main,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            BarChartRodData(
                              toY: normalizedExpenses[index].toDouble(),
                              width: 7,
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ],
                        );
                      }),
                      gridData: const FlGridData(show: false),
                    ),
                  ),
                ),
                Container(
                  height: 1,
                  color: Colors.black,
                  width: 290,
                ),
                const SizedBox(height: 8),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextM('Week 1', fontSize: 8),
                    TextM('Week 2', fontSize: 8),
                    TextM('Week 3', fontSize: 8),
                    TextM('Week 4', fontSize: 8),
                  ],
                ),
                const SizedBox(height: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
