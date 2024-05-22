import 'package:flutter_words/core/errors/exceptions.dart';
import 'package:flutter_words/core/utils/app_consts.dart';
import 'package:flutter_words/data/datasources/remote_config_service.dart';
import 'package:flutter_words/data/models/card_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

abstract class CardsRemoteDataSource {
  Future<List<WordCardModel>> getCards();
}

const kGetCardsEndpoint =
    '/v4/spreadsheets/1r9C8A6DVXV2aLpiJwtu3DKWrQA2zYGpTv1O91hEP6VQ';
const kApiKey = 'AIzaSyC5OOm6wxPAAkNpZ05tHjBWS-W1VaYnIOQ';

class CardsRemoteDataSrcImpl implements CardsRemoteDataSource {
  const CardsRemoteDataSrcImpl(
    this._client,
    this._remoteConfigService,
  );
  final http.Client _client;
  final RemoteConfigService _remoteConfigService;

  @override
  Future<List<WordCardModel>> getCards() async {
    final FirebaseStorage _storage = FirebaseStorage.instance;
    final order = _remoteConfigService.cardOrder;
    try {
      final uri = Uri.https(kBaseUrl, kGetCardsEndpoint,
          {'key': kApiKey, 'includeGridData': 'true', 'ranges': 'A2:D6'});
      final response = await _client.get(uri);
      if (response.statusCode != 200) {
        throw APIException(
          message: response.body,
          statusCode: response.statusCode,
        );
      }
      final Map<String, dynamic> decodedJson = json.decode(response.body);
      final List<dynamic> rows = decodedJson['sheets'][0]['data'][0]['rowData'];
      final List<WordCardModel> cards = [];
      for (var row in rows) {
        WordCardModel card = const WordCardModel.empty();
        final values = row['values'];
        for (var i = 0; i < values.length; i++) {
          final stringValue = values[i]['userEnteredValue']['stringValue'];
          switch (i) {
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
              final imageUrl = await _storage
                  .ref()
                  .child('$stringValue.png')
                  .getDownloadURL();
              card = card.copyWith(image: imageUrl);
              break;
          }
        }
        final cardOrder =
            order.keys.firstWhere((index) => order[index] == card.id);
        card = card.copyWith(orderNr: int.parse(cardOrder));
        cards.add(card);
      }
      return cards;
    } on APIException catch (e) {
      throw APIException(message: e.message, statusCode: e.statusCode);
    } catch (e) {
      debugPrint("api error: $e");
      throw Exception("Unknown error occurred");
    }
  }
}
