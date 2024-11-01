import 'package:flutter/material.dart';

import '../../../core/widgets/texts/text_m.dart';

class TotalBalance extends StatelessWidget {
  const TotalBalance({super.key});

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
            color: AppColors.black,
          ),
        ),
        child: const Column(
          children: [
            SizedBox(height: 14),
            TextM('Your Balance', fontSize: 18),
            TextM(
              '\$ 31,800',
              fontSize: 32,
              fontFamily: Fonts.heavy,
            ),
          ],
        ),
      ),
    );
  }
}
