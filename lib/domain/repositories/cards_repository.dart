import 'package:flutter_words/core/utils/typedef.dart';
import 'package:flutter_words/domain/entity/card.dart';
import 'package:flutter_words/domain/usecases/get_cards.dart';

abstract class CardsRepository {
  const CardsRepository();

  ResultFuture<List<WordCard>> getCards(GetCardsParams params);
}
