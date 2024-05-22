import 'package:flutter_words/core/errors/exceptions.dart';
import 'package:flutter_words/core/utils/app_consts.dart';
import 'package:flutter_words/data/models/card_model.dart';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

abstract class CardsRemoteDataSource {
  Future<List<CardModel>> getCards();
}

const kGetCardsEndpoint = '/v4/spreadsheets/1r9C8A6DVXV2aLpiJwtu3DKWrQA2zYGpTv1O91hEP6VQ';
const kApiKey = 'AIzaSyC5OOm6wxPAAkNpZ05tHjBWS-W1VaYnIOQ';


class CardsRemoteDataSrcImpl implements CardsRemoteDataSource {
  const CardsRemoteDataSrcImpl(
     this._client,
);

  final http.Client _client;

  @override
  Future<List<CardModel>> getCards() async {
    try {
      final uri = Uri.https(kBaseUrl, kGetCardsEndpoint,
          {'key': kApiKey, 'includeGridData': true, 'range': 'A2:D6'});
      final response = await _client.get(uri);
      debugPrint('get cards ======  ${response.body}');
      if (response.statusCode != 200) {
        throw APIException(
          message: response.body,
          statusCode: response.statusCode,
        );
      }
      final Map<String, dynamic> decodedJson = json.decode(response.body);
      final List<dynamic> rows = decodedJson['sheets'][0]['data'][0]['rowData'];
      final List<dynamic> cards = [];
      for(var row in rows) {
        CardModel card = const CardModel.empty();
        for(final (value, index) in row['values']) {
          final stringValue = value['userEnteredValue']['stringValue'];
          switch(index) {
            case 0:
              card = card.copyWith(id: stringValue);
              break;
            case 1: 
              card = card.copyWith(name: stringValue);
              break;
            case 2:
              card = card.copyWith(translation: stringValue);
              break;
            case 3:
              card = card.copyWith(image: stringValue);
              break;
          }
        }
        cards.add(card);
      }
      debugPrint('$cards');
      return cards.map((cardData) => CardModel.fromMap(cardData)).toList();
    } on APIException catch (e) {
      throw APIException(message: e.message, statusCode: e.statusCode);
    } catch (e) {
      debugPrint("$e");
      throw Exception("Unknown error occurred");
    }
  }
}