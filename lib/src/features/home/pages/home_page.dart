import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/models/extra_model.dart';
import '../../../core/models/money.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/texts/text_m.dart';
import '../bloc/home_bloc.dart';
import '../widgets/add_income_button.dart';
import '../widgets/income_expense_card.dart';
import '../widgets/nav_bar.dart';
import '../widgets/total_balance.dart';
import 'settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Stack(
        children: [
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeSettings) return const SettingsPage();

              if (state is HomeStatistics) return const Text('Statistics');

              if (state is HomeQuiz) return const Text('Quiz');

              return const _Home();
            },
          ),
          const NavBar(),
        ],
      ),
    );
  }
}

class _Home extends StatefulWidget {
  const _Home();

  @override
  State<_Home> createState() => _HomeState();
}

class _HomeState extends State<_Home> {
  bool active = true;

  void onHistory() {
    setState(() {
      active = !active;
    });
  }

  void onAdd(bool income) {
    context.push(
      '/add',
      extra: ExtraModel(
        income: income,
        add: true,
        money: defaultMoney,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 230,
          width: double.infinity,
          color: AppColors.white,
          child: SvgPicture.asset('assets/bg.svg'),
        ),
        Column(
          children: [
            const SizedBox(height: 75),
            const TotalBalance(),
            const SizedBox(height: 30),
            const SizedBox(
              width: 316,
              child: Row(
                children: [
                  IncomeExpenseCard(amount: 100, income: true),
                  SizedBox(width: 30),
                  IncomeExpenseCard(amount: 200),
                ],
              ),
            ),
            const SizedBox(height: 18),
            SizedBox(
              width: 324,
              height: 64,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AddIncomeButton(
                    title: 'Income',
                    income: true,
                    onPressed: () {
                      onAdd(true);
                    },
                  ),
                  AddIncomeButton(
                    title: 'Expense',
                    onPressed: () {
                      onAdd(false);
                    },
                  ),
                  AddIncomeButton(
                    title: 'History',
                    history: true,
                    active: active,
                    onPressed: onHistory,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
