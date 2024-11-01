import 'package:flutter/material.dart';

import '../../../core/widgets/buttons/cuper_button.dart';

class AmountButton extends StatelessWidget {
  const AmountButton({
    super.key,
    required this.increment,
    required this.onPressed,
  });

  final bool increment;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CuperButton(
      onPressed: onPressed,
      minSize: 32,
      child: Container(
        height: 32,
        width: 32,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xff0F0F11),
        ),
        child: Center(
          child: Icon(
            increment ? Icons.add : Icons.remove,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
