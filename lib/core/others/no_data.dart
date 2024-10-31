import 'package:flutter/material.dart';

import '../widgets/texts/text_m.dart';

class NoData extends StatelessWidget {
  const NoData({
    super.key,
    this.expanded = true,
  });

  final bool expanded;

  @override
  Widget build(BuildContext context) {
    return expanded
        ? const Expanded(
            child: Center(
              child: TextM(
                'No data',
                fontSize: 14,
              ),
            ),
          )
        : const Center(
            child: TextM(
              'No data',
              fontSize: 14,
            ),
          );
  }
}
