import 'package:flutter/cupertino.dart';

import '../config/app_colors.dart';
import '../widgets/texts/text_m.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CupertinoActivityIndicator(
        color: AppColors.black,
      ),
    );
  }
}
