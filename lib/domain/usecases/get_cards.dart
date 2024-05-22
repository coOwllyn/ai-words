import 'package:flutter_words/core/usecase/usecase.dart';
import 'package:flutter_words/core/utils/typedef.dart';
import 'package:flutter_words/domain/entity/card.dart';
import 'package:flutter_words/domain/repositories/cards_repository.dart';

class GetCardsParams {

  const GetCardsParams();
}

class GetCards extends UsecaseWithParams<List<Card>, GetCardsParams> {
  const GetCards(this._cardsRepository);

  final CardsRepository _cardsRepository;

  @override
  ResultFuture<List<Card>> call(GetCardsParams params) async =>
      _cardsRepository.getCards(params);
}