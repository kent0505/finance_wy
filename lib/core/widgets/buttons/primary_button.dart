import 'package:flutter/cupertino.dart';

import '../texts/text_m.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    this.active = true,
    this.width,
    required this.onPressed,
  });

  final String title;
  final bool active;
  final double? width;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: width,
      decoration: BoxDecoration(
        color: active ? const Color(0xff0F0F11) : const Color(0xffBABABA),
        borderRadius: BorderRadius.circular(10),
      ),
      child: CupertinoButton(
        onPressed: active ? onPressed : null,
        padding: EdgeInsets.zero,
        child: Center(
          child: TextM(
            title,
            fontSize: 16,
            fontFamily: Fonts.regular,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
