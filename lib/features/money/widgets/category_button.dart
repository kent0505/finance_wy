import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils.dart';
import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../core/widgets/texts/text_m.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    super.key,
    required this.title,
    required this.current,
    required this.onPressed,
  });

  final String title;
  final String current;
  final void Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      width: 166,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: identical(title, current)
            ? Border.all(
                width: 1,
                color: AppColors.black,
              )
            : null,
      ),
      child: CuperButton(
        onPressed: () {
          onPressed(title);
        },
        child: Row(
          children: [
            const SizedBox(width: 6),
            SvgPicture.asset(getCategoryAsset(title)),
            Expanded(
              child: TextM(
                title,
                fontSize: 16,
                fontFamily: Fonts.regular,
                color: Colors.black.withOpacity(0.64),
                maxLines: 2,
              ),
            ),
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: identical(title, current)
                    ? Colors.black
                    : Colors.black.withOpacity(0.08),
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
