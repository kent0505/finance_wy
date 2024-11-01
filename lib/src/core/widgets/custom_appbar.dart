import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../utils.dart';
import 'buttons/cuper_button.dart';
import 'texts/text_m.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
    this.onDelete,
  });

  final void Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: getStatusBar(context)),
      child: Row(
        children: [
          SizedBox(
            // color: Colors.redAccent,
            height: 44,
            width: 80,
            child: CuperButton(
              onPressed: () {
                context.pop();
              },
              child: Row(
                children: [
                  const SizedBox(width: 12),
                  SvgPicture.asset('assets/back.svg'),
                  const SizedBox(width: 8),
                  const TextM(
                    'Back',
                    fontSize: 15,
                    fontFamily: Fonts.regular,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
          if (onDelete != null) ...[
            const Spacer(),
            CuperButton(
              onPressed: onDelete,
              minSize: 44,
              child: const Icon(
                Icons.delete,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 6),
          ],
        ],
      ),
    );
  }
}
