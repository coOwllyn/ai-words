import 'dart:convert';

import 'package:flutter_words/core/utils/typedef.dart';
import 'package:flutter_words/domain/entity/card.dart';

class CardModel extends Card {
  const CardModel({
    required super.id,
    required super.name,
    required super.translation,
    required super.image,
  });

  const CardModel.empty()
      : this(
          id: '1',
          name: '_empty.name',
          translation: '_empty.translation',
          image: '_empty.image',
        );

  factory CardModel.fromJson(String source) =>
      CardModel.fromMap(jsonDecode(source) as DataMap);

  CardModel.fromMap(DataMap map)
      : this(
          id: map['id'] as String,
          name: map['name'] as String,
          translation: map['translation'] as String,
          image: map['image'] as String,
        );

  CardModel copyWith({
    String? id,
    String? name,
    String? translation,
    String? image,
  }) {
    return CardModel(
      id: id ?? this.id,
      name: name ?? this.name,
      translation: translation ?? this.translation,
      image: image ?? this.image,
    );
  }

  DataMap toMap() => {
        'id': id,
        'name': name,
        'translation': translation,
        'image': image,
      };

  String toJson() => jsonEncode(toMap());
}