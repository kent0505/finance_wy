import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../core/db/db.dart';
import '../../../core/models/money.dart';
import '../../../core/widgets/texts/text_m.dart';

class WeekChart extends StatefulWidget {
  const WeekChart({super.key});

  @override
  State<WeekChart> createState() => _WeekChartState();
}

class _WeekChartState extends State<WeekChart> {
  int expenses = 0;
  int incomes = 0;
  List<int> weeklyExpenses = List.filled(7, 0);
  List<int> weeklyIncomes = List.filled(7, 0);

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
  }

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
    getTodaysMoney();
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
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(),
                        ),
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(),
                        ),
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
    );
  }
}
