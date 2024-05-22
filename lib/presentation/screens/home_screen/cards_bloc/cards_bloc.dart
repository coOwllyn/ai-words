import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_words/domain/entity/card.dart';
import 'package:flutter_words/domain/usecases/get_cards.dart';

part 'cards_event.dart';
part 'cards_state.dart';

class CardsBloc extends Bloc<CardsEvent, CardsState> {
  final GetCards _getCards;

  CardsBloc({
    required GetCards getCards,
  })  : _getCards = getCards,
        super(const CardsInitial()) {
    on<LoadCardsEvent>(_onGetCardsEvent);
    on<NextCardEvent>(_onNextCardEvent);
    on<BackCardEvent>(_onBackCardEvent);
  }

  Future<void> _onGetCardsEvent(
    LoadCardsEvent event,
    Emitter<CardsState> emit,
  ) async {
    emit(const CardsLoading());

    final cards = await _getCards(const GetCardsParams());

    cards.fold(
      (failure) => emit(CardsError(errorMessage: failure.errorMessage)),
      (cards) => emit(CardsLoadSuccess(cards: cards)),
    );
  }

  Future<void> _onNextCardEvent(
    NextCardEvent event,
    Emitter<CardsState> emit,
  ) async {
    if (state is CardsLoadSuccess) {
      final currentState = state as CardsLoadSuccess;
      if (currentState.currentCardIndex != currentState.cards.length - 1) {
        int newIndex = currentState.currentCardIndex + 1;
        emit(CardsLoadSuccess(
          currentCardIndex: newIndex,
          cards: currentState.cards,
        ));
      }
    }
  }

  Future<void> _onBackCardEvent(
    BackCardEvent event,
    Emitter<CardsState> emit,
  ) async {
    if (state is CardsLoadSuccess) {
      final currentState = state as CardsLoadSuccess;
      debugPrint("click -");
      if (currentState.currentCardIndex != 0) {
        emit(CardsLoadSuccess(
          currentCardIndex: currentState.currentCardIndex - 1,
          cards: currentState.cards,
        ));
      }
    }
  }
}
