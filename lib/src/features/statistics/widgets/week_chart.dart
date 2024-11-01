import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/db/db.dart';
import '../../../core/models/money.dart';
import '../../../core/widgets/texts/text_m.dart';

class WeekChart extends StatefulWidget {
  const WeekChart({super.key});

  @override
  State<WeekChart> createState() => _WeekChartState();
}

class _WeekChartState extends State<WeekChart> {
  List<int> weeklyExpenses = List.filled(7, 0);
  List<int> weeklyIncomes = List.filled(7, 0);

  void getWeeklyMoney() {
    DateTime today = DateTime.now();
    DateTime startOfWeek = today.subtract(Duration(days: today.weekday - 1));
    for (Money money in moneyList) {
      DateTime date = DateTime.fromMillisecondsSinceEpoch(money.id * 1000);
      if (date.isAfter(startOfWeek) &&
          date.isBefore(startOfWeek.add(const Duration(days: 7)))) {
        if (money.income) {
          weeklyIncomes[date.weekday - 1] += money.amount;
        } else {
          weeklyExpenses[date.weekday - 1] += money.amount;
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    // getTodaysMoney();
    getWeeklyMoney();
  }

  @override
  Widget build(BuildContext context) {
    int maxWeekly = (weeklyIncomes.reduce((a, b) => a > b ? a : b) >
            weeklyExpenses.reduce((a, b) => a > b ? a : b))
        ? weeklyIncomes.reduce((a, b) => a > b ? a : b)
        : weeklyExpenses.reduce((a, b) => a > b ? a : b);

    List<double> normalizedWeeklyIncomes = weeklyIncomes
        .map((e) => (maxWeekly > 0 ? (e / maxWeekly) * 210 : 0).toDouble())
        .toList();
    List<double> normalizedWeeklyExpenses = weeklyExpenses
        .map((e) => (maxWeekly > 0 ? (e / maxWeekly) * 210 : 0).toDouble())
        .toList();

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
                          barGroups: List.generate(7, (index) {
                            return BarChartGroupData(
                              x: index,
                              barsSpace: 4,
                              barRods: [
                                BarChartRodData(
                                  toY: normalizedWeeklyIncomes[index],
                                  width: 7,
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                BarChartRodData(
                                  toY: normalizedWeeklyExpenses[index],
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
                        TextM('Mon', fontSize: 8),
                        TextM('Tue', fontSize: 8),
                        TextM('Wed', fontSize: 8),
                        TextM('Thu', fontSize: 8),
                        TextM('Fri', fontSize: 8),
                        TextM('Sat', fontSize: 8),
                        TextM('Sun', fontSize: 8),
                      ],
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
