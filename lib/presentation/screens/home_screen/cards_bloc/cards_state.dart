part of 'cards_bloc.dart';

abstract class CardsState extends Equatable {
  const CardsState();

  @override
  List<Object> get props => [];
}

class CardsInitial extends CardsState {
  const CardsInitial();
}

class CardsLoading extends CardsState {
  const CardsLoading();
}

class CardsLoadSuccess extends CardsState {
  const CardsLoadSuccess({required this.cards, this.currentCardIndex = 0});

  final List<WordCard> cards;
  final int currentCardIndex;

  @override
  List<Object> get props =>
      [cards.map((cards) => cards.id).toList(), currentCardIndex];
}

class CardsError extends CardsState {
  const CardsError({required this.errorMessage});

  final String errorMessage;

  @override
  List<String> get props => [errorMessage];
}
