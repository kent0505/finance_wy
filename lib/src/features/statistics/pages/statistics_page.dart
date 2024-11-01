import 'package:flutter/material.dart';

import '../../../core/widgets/texts/text_m.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key});

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 80),
        Center(
          child: TextM(
            'Settings',
            fontSize: 32,
          ),
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
