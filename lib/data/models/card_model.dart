import 'dart:convert';

import 'package:flutter_words/core/utils/typedef.dart';
import 'package:flutter_words/domain/entity/card.dart';

class WordCardModel extends WordCard {
  const WordCardModel({
    required super.id,
    required super.name,
    required super.translation,
    required super.image,
    required super.orderNr,
  });

  const WordCardModel.empty()
      : this(
            id: '1',
            name: '_empty.name',
            translation: '_empty.translation',
            image: '_empty.image',
            orderNr: 0);

  factory WordCardModel.fromJson(String source) =>
      WordCardModel.fromMap(jsonDecode(source) as DataMap);

  WordCardModel.fromMap(DataMap map)
      : this(
          id: map['id'] as String,
          name: map['name'] as String,
          translation: map['translation'] as String,
          image: map['image'] as String,
          orderNr: map['order_nr'] as int,
        );

  WordCardModel copyWith({
    String? id,
    String? name,
    String? translation,
    String? image,
    int? orderNr,
  }) {
    return WordCardModel(
        id: id ?? this.id,
        name: name ?? this.name,
        translation: translation ?? this.translation,
        image: image ?? this.image,
        orderNr: orderNr ?? this.orderNr);
  }

  DataMap toMap() => {
        'id': id,
        'name': name,
        'translation': translation,
        'image': image,
        'order_nr': orderNr
      };

  String toJson() => jsonEncode(toMap());
}
