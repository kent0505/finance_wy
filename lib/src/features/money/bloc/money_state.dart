part of 'money_bloc.dart';

@immutable
sealed class MoneyState {}

final class MoneyInitial extends MoneyState {}

class MoneyLoadedState extends MoneyState {
  MoneyLoadedState({required this.moneyList});

  final List<Money> moneyList;
}
