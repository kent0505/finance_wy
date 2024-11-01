import 'package:finance_wy/src/core/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/db/db.dart';
import '../../../core/models/money.dart';

part 'money_event.dart';
part 'money_state.dart';

class MoneyBloc extends Bloc<MoneyEvent, MoneyState> {
  MoneyBloc() : super(MoneyInitial()) {
    on<MoneyEvent>(
      (event, emit) => switch (event) {
        GetMoneyEvent() => _getMoney(event, emit),
        AddMoneyEvent() => _addMoney(event, emit),
        EditMoneyEvent() => _editMoney(event, emit),
        DeleteMoneyEvent() => _deleteMoney(event, emit),
      },
    );
  }

  Future<void> _getMoney(
    GetMoneyEvent event,
    Emitter<MoneyState> emit,
  ) async {
    await getMoneyList();
    calculateMoney();
    emit(MoneyLoadedState(moneyList: moneyList));
  }

  Future<void> _addMoney(
    AddMoneyEvent event,
    Emitter<MoneyState> emit,
  ) async {
    moneyList.insert(0, event.money);
    await updateMoneyList();
    calculateMoney();
    emit(MoneyLoadedState(moneyList: moneyList));
  }

  Future<void> _editMoney(
    EditMoneyEvent event,
    Emitter<MoneyState> emit,
  ) async {
    for (Money money in moneyList) {
      if (money.id == event.money.id) {
        money.title = event.money.title;
        money.amount = event.money.amount;
        money.category = event.money.category;
        money.income = event.money.income;
      }
    }
    await updateMoneyList();
    calculateMoney();
    emit(MoneyLoadedState(moneyList: moneyList));
  }

  Future<void> _deleteMoney(
    DeleteMoneyEvent event,
    Emitter<MoneyState> emit,
  ) async {
    moneyList.removeWhere((element) => element.id == event.money.id);
    await updateMoneyList();
    calculateMoney();
    emit(MoneyLoadedState(moneyList: moneyList));
  }
}
