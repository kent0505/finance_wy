import 'package:flutter/material.dart';

import '../../../core/utils.dart';
import '../../../core/models/extra_model.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/textfields/txt_field.dart';
import '../../../core/widgets/texts/text_m.dart';
import '../widgets/amount_button.dart';
import '../widgets/category_button.dart';

class AddMoneyPage extends StatefulWidget {
  const AddMoneyPage({
    super.key,
    required this.extra,
  });

  final ExtraModel extra;

  @override
  State<AddMoneyPage> createState() => _AddMoneyPageState();
}

class _AddMoneyPageState extends State<AddMoneyPage> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();

  bool active = false;

  void checkActive() {
    setState(() {
      active = getButtonActive([
        controller1,
        controller2,
        controller3,
      ]);
    });
  }

  void onAmount(bool increment) {
    int amount = int.tryParse(controller2.text) ?? 0;
    setState(() {
      if (increment) {
        amount += 100;
      } else {
        amount -= 100;
      }
      controller2.text = amount.toString();
    });
  }

  void onCategory(String category) {
    controller3.text = category;
    checkActive();
  }

  void onSave() {
    // context.read<CafesBloc>().add();
    // context.pop();
  }

  @override
  void initState() {
    super.initState();
    if (!widget.extra.add) {
      controller1.text = widget.extra.money.title;
      controller2.text = widget.extra.money.amount.toString();
      controller3.text = widget.extra.money.category;
    }
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          const CustomAppbar(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const SizedBox(height: 8),
                Center(
                  child: TextM(
                    widget.extra.add
                        ? widget.extra.income
                            ? 'Add Income'
                            : 'Add Expense'
                        : widget.extra.income
                            ? 'Edit Income'
                            : 'Edit Expense',
                    fontSize: 32,
                  ),
                ),
                const SizedBox(height: 30),
                const Center(
                  child: TextM('Title', fontSize: 16),
                ),
                const SizedBox(height: 10),
                Center(
                  child: TxtField(
                    controller: controller1,
                    hintText: 'Name title',
                    onChanged: checkActive,
                  ),
                ),
                const SizedBox(height: 10),
                const Center(
                  child: TextM('Amount (\$)', fontSize: 16),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 360,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AmountButton(
                        increment: false,
                        onPressed: () {
                          onAmount(false);
                        },
                      ),
                      const SizedBox(width: 22),
                      SizedBox(
                        width: 250,
                        child: TxtField(
                          controller: controller2,
                          hintText: 'Amount income',
                          number: true,
                          onChanged: checkActive,
                        ),
                      ),
                      const SizedBox(width: 22),
                      AmountButton(
                        increment: true,
                        onPressed: () {
                          onAmount(true);
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Center(
                  child: TextM('Category', fontSize: 16),
                ),
                const SizedBox(height: 10),
                Center(
                  child: SizedBox(
                    width: 360,
                    child: Wrap(
                      runSpacing: 10,
                      spacing: 28,
                      children: [
                        if (widget.extra.income) ...[
                          CategoryButton(
                            title: 'Passive',
                            current: controller3.text,
                            onPressed: onCategory,
                          ),
                          CategoryButton(
                            title: 'Salary',
                            current: controller3.text,
                            onPressed: onCategory,
                          ),
                          CategoryButton(
                            title: 'Rent',
                            current: controller3.text,
                            onPressed: onCategory,
                          ),
                          CategoryButton(
                            title: 'Business',
                            current: controller3.text,
                            onPressed: onCategory,
                          ),
                          CategoryButton(
                            title: 'Freelance',
                            current: controller3.text,
                            onPressed: onCategory,
                          ),
                          CategoryButton(
                            title: 'Investment',
                            current: controller3.text,
                            onPressed: onCategory,
                          ),
                          CategoryButton(
                            title: 'Dividends',
                            current: controller3.text,
                            onPressed: onCategory,
                          ),
                          CategoryButton(
                            title: 'Royalty',
                            current: controller3.text,
                            onPressed: onCategory,
                          ),
                        ] else ...[
                          CategoryButton(
                            title: 'Investment',
                            current: controller3.text,
                            onPressed: onCategory,
                          ),
                          CategoryButton(
                            title: 'Food',
                            current: controller3.text,
                            onPressed: onCategory,
                          ),
                          CategoryButton(
                            title: 'Transport',
                            current: controller3.text,
                            onPressed: onCategory,
                          ),
                          CategoryButton(
                            title: 'Rest',
                            current: controller3.text,
                            onPressed: onCategory,
                          ),
                          CategoryButton(
                            title: 'Procurement',
                            current: controller3.text,
                            onPressed: onCategory,
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 38),
                Center(
                  child: PrimaryButton(
                    title: widget.extra.add ? 'Save' : 'Edit',
                    active: active,
                    width: 360,
                    onPressed: onSave,
                  ),
                ),
                const SizedBox(height: 38),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
