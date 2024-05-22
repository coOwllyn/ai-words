import 'package:dartz/dartz.dart';
import 'package:flutter_words/core/errors/exceptions.dart';
import 'package:flutter_words/core/errors/failure.dart';
import 'package:flutter_words/core/utils/typedef.dart';
import 'package:flutter_words/data/datasources/cards_remote_data_source.dart';
import 'package:flutter_words/domain/entity/card.dart';
import 'package:flutter_words/domain/repositories/cards_repository.dart';
import 'package:flutter_words/domain/usecases/get_cards.dart';

class CardsRepositoryImplementation implements CardsRepository {
  const CardsRepositoryImplementation(this._remoteDataSource);

  final CardsRemoteDataSource _remoteDataSource;

  @override
  ResultFuture<List<Card>> getCards(GetCardsParams params) async {
    try {
      final result = await _remoteDataSource.getCards();
      return Right(result);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }
}