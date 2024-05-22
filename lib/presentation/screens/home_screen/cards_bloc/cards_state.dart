part of 'cards_bloc.dart';

sealed class CardsState extends Equatable {
  const CardsState();
  
  @override
  List<Object> get props => [];
}

final class CardsInitial extends CardsState {}
