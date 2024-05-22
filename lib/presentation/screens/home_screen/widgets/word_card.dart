import 'package:flutter/material.dart';
import 'package:flutter_words/presentation/style/app_colors.dart';
import 'package:flutter_words/presentation/style/app_text_style.dart';

class WordCard extends StatelessWidget {
  const WordCard({
    super.key,
    required this.cardWord,
    required this.cardTranslation,
    required this.cardImage,
  });

  final String cardWord;
  final String cardTranslation;
  final String cardImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      margin: const EdgeInsets.only(left: 20, right: 20),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          color: AppColors.grayBG,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(children: [
        Image.asset(
          cardImage,
          width: 300,
        ),
        Text(
          cardWord,
          style: getHeaderStyle(fontSize: 25, color: AppColors.textDark),
        ),
        const SizedBox(height: 20),
        Text(
          cardTranslation,
          style: getBodyStyle(fontSize: 20, color: AppColors.textDark),
        ),
      ]),
    );
  }
}
