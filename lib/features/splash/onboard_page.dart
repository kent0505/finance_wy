import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/db/prefs.dart';
import '../../core/widgets/buttons/primary_button.dart';
import '../../core/widgets/custom_scaffold.dart';
import '../../core/widgets/texts/text_m.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  int _index = 1;

  String _getTitle() {
    if (_index == 1) return 'Keep track of your finances in one application.';
    return 'Always with you, your personal financial assistant and convenient control';
  }

  String _getDescription() {
    if (_index == 1) {
      return 'Plan your budget, control your income and expenses, track exchange rate changes rates and cryptocurrencies and receive notifications about exchange rates and their changes.';
    }
    return 'This is a mobile application will help you manage your financial situation quickly, efficiently and economically';
  }

  void _onNext() async {
    if (_index == 2) {
      await saveOnboard().then((value) {
        if (mounted) {
          context.go('/home');
        }
      });
    } else {
      setState(() {
        _index++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            SizedBox(
              width: 360,
              child: TextM(
                _getTitle(),
                fontSize: 32,
                fontFamily: Fonts.bold,
                maxLines: 4,
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: 400,
              height: 300,
              child: ColorFiltered(
                colorFilter: const ColorFilter.mode(
                  AppColors.main,
                  BlendMode.color,
                ),
                child: Image.asset('assets/images/onboard$_index.png'),
              ),
            ),
            const Spacer(),
            PrimaryButton(
              title: 'Next',
              width: 360,
              onPressed: _onNext,
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 360,
              height: 100,
              child: TextM(
                _getDescription(),
                fontSize: 14,
                fontFamily: Fonts.light,
                maxLines: 6,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
