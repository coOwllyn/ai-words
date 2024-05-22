import 'package:equatable/equatable.dart';

class WordCard extends Equatable {
  const WordCard({
    required this.id,
    required this.name,
    required this.translation,
    required this.image,
    required this.orderNr,
  });

  const WordCard.empty()
      : this(
            id: '1',
            name: '_empty.name',
            translation: '_empty.translation',
            image: '_empty.image',
            orderNr: 0);

  final String id;
  final String name;
  final String translation;
  final String image;
  final int orderNr;
  @override
  List<Object?> get props => [id, name, translation, image, orderNr];
}
