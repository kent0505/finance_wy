import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/db/prefs.dart';
import '../../core/others/loading_widget.dart';
import '../../core/widgets/custom_scaffold.dart';
import '../money/bloc/money_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void _load() async {
    await getData().then((onboard) {
      if (mounted) {
        context.read<MoneyBloc>().add(GetMoneyEvent());
      }

      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          if (onboard) {
            context.go('/onboard');
          } else {
            context.go('/home');
          }
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: LoadingWidget(),
    );
  }
}
