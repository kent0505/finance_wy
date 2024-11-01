import 'package:flutter/material.dart';

import '../../../core/widgets/texts/text_m.dart';

class TotalBalance extends StatelessWidget {
  const TotalBalance({
    super.key,
    required this.total,
  });

  final int total;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 96,
        width: 316,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 3,
            color: Colors.black,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 14),
            const TextM('Your Balance', fontSize: 18),
            TextM(
              '\$ $total',
              fontSize: 32,
              fontFamily: Fonts.heavy,
            ),
          ],
        ),
      ),
    );
  }
}
