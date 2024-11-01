import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../core/widgets/texts/text_m.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 80),
        const Center(
          child: TextM(
            'Settings',
            fontSize: 32,
          ),
        ),
        const Spacer(),
        _Tile(
          id: 1,
          title: 'Support page',
          onPressed: () {},
        ),
        const SizedBox(height: 16),
        _Tile(
          id: 2,
          title: 'Privacy Policy',
          onPressed: () {},
        ),
        const SizedBox(height: 16),
        _Tile(
          id: 3,
          title: 'Subscription info',
          onPressed: () {},
        ),
        const SizedBox(height: 16),
        _Tile(
          id: 4,
          title: 'Terms of use',
          onPressed: () {},
        ),
        const SizedBox(height: 16),
        _Tile(
          id: 5,
          title: 'Share with friends',
          onPressed: () {},
        ),
        const Spacer(flex: 3),
      ],
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile({
    required this.id,
    required this.title,
    required this.onPressed,
  });

  final int id;
  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 326,
      margin: const EdgeInsets.symmetric(horizontal: 32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: CuperButton(
        onPressed: onPressed,
        child: Row(
          children: [
            const SizedBox(width: 16),
            SvgPicture.asset('assets/settings$id.svg'),
            const SizedBox(width: 14),
            TextM(
              title,
              fontSize: 16,
              fontFamily: Fonts.regular,
              color: const Color(0xff454545),
            ),
          ],
        ),
      ),
    );
  }
}
