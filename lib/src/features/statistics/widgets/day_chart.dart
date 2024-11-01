import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/db/db.dart';
import '../../../core/models/money.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/texts/text_m.dart';

class DayChart extends StatefulWidget {
  const DayChart({super.key});

  @override
  State<DayChart> createState() => _DayChartState();
}

class _DayChartState extends State<DayChart> {
  int expenses = 0;
  int incomes = 0;
  int normalizedIncome = 0;
  int normalizedExpense = 0;

  void getTodaysMoney() {
    DateTime today = DateTime.now();
    List<Money> todaysMoneys = [];
    for (Money money in moneyList) {
      DateTime date = DateTime.fromMillisecondsSinceEpoch(money.id * 1000);
      if (date.year == today.year &&
          date.month == today.month &&
          date.day == today.day) {
        todaysMoneys.add(money);
      }
    }
    for (Money money in todaysMoneys) {
      if (money.income) {
        incomes += money.amount;
      } else {
        expenses += money.amount;
      }
    }
    int maxValue = incomes > expenses ? incomes : expenses;
    if (maxValue == 0) {
      normalizedIncome = 0;
      normalizedExpense = 0;
    } else {
      normalizedIncome = ((incomes / maxValue) * 210).round();
      normalizedExpense = ((expenses / maxValue) * 210).round();
    }
  }

  @override
  void initState() {
    super.initState();
    getTodaysMoney();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
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
                Positioned(
                    top: 24 * 2, child: SvgPicture.asset('assets/line.svg')),
                Positioned(
                    top: 24 * 3, child: SvgPicture.asset('assets/line.svg')),
                Positioned(
                    top: 24 * 4, child: SvgPicture.asset('assets/line.svg')),
                Positioned(
                    top: 24 * 5, child: SvgPicture.asset('assets/line.svg')),
                Positioned(
                    top: 24 * 6, child: SvgPicture.asset('assets/line.svg')),
                Positioned(
                    top: 24 * 7, child: SvgPicture.asset('assets/line.svg')),
                Positioned(
                    top: 24 * 8, child: SvgPicture.asset('assets/line.svg')),
                Positioned(
                    top: 24 * 9, child: SvgPicture.asset('assets/line.svg')),
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
                    const SizedBox(height: 18),
                    Expanded(
                      child: BarChart(
                        BarChartData(
                          maxY: 250,
                          borderData: FlBorderData(show: false),
                          titlesData: const FlTitlesData(
                            topTitles: AxisTitles(sideTitles: SideTitles()),
                            leftTitles: AxisTitles(sideTitles: SideTitles()),
                            rightTitles: AxisTitles(sideTitles: SideTitles()),
                            bottomTitles: AxisTitles(sideTitles: SideTitles()),
                          ),
                          barTouchData: BarTouchData(enabled: false),
                          barGroups: [
                            BarChartGroupData(
                              x: 0,
                              barsSpace: 4,
                              barRods: [
                                BarChartRodData(
                                  toY: normalizedIncome.toDouble(),
                                  width: 7,
                                  color: AppColors.main,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                BarChartRodData(
                                  toY: normalizedExpense.toDouble(),
                                  width: 7,
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ],
                            ),
                          ],
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
                    TextM(
                      getWeekdayAbbreviation(),
                      fontSize: 8,
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 290,
            width: 340,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 26),
                TextM('\$ 4500', fontSize: 8),
                SizedBox(height: 15),
                TextM('\$ 4000', fontSize: 8),
                SizedBox(height: 15),
                TextM('\$ 3500', fontSize: 8),
                SizedBox(height: 15),
                TextM('\$ 3000', fontSize: 8),
                SizedBox(height: 15),
                TextM('\$ 2500', fontSize: 8),
                SizedBox(height: 15),
                TextM('\$ 2000', fontSize: 8),
                SizedBox(height: 15),
                TextM('\$ 1500', fontSize: 8),
                SizedBox(height: 15),
                TextM('\$ 1000', fontSize: 8),
                SizedBox(height: 15),
                TextM('\$ 500', fontSize: 8),
                SizedBox(height: 15),
                TextM('\$ 0', fontSize: 8),
                SizedBox(height: 15),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
