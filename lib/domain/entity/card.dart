import 'package:equatable/equatable.dart';

class Card extends Equatable {
  const Card({
    required this.id,
    required this.name,
    required this.translation,
    required this.image,
  });

  const Card.empty()
      : this(
          id: '1',
          name: '_empty.name',
          translation: '_empty.translation',
          image: '_empty.image',
        );

  final String id;
  final String name;
  final String translation;
  final String image;

  @override
  List<Object?> get props => [
        id,
        name,
        translation,
        image,
      ];
}