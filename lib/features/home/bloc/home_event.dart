part of 'home_bloc.dart';

abstract class HomeEvent {}

class ChangePageEvent extends HomeEvent {
  ChangePageEvent({required this.index});

  final int index;
}
