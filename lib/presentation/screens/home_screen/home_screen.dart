import 'package:flutter/material.dart';
import 'package:flutter_words/core/resources/app_images.dart';
import 'package:flutter_words/core/resources/app_strings.dart';
import 'package:flutter_words/presentation/screens/home_screen/widgets/word_card.dart';
import 'package:flutter_words/presentation/style/app_colors.dart';
import 'package:flutter_words/presentation/widgets/app_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDark,
      appBar: AppBar(),
      body:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const WordCard(
          cardWord: 'data',
          cardTranslation: 'data',
          cardImage: AppImages.logo,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
          child: Row(
            children: [
              Expanded(
                child: AppButton(
                    name: AppStrings.buttonBack,
                    textColor: AppColors.textDark,
                    borderColor1: AppColors.mainBlue,
                    borderColor2: Colors.blue,
                    buttonColor1: AppColors.bgDark,
                    buttonColor2: AppColors.bgDark,
                    onPressed: () {}),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: AppButton(
                    name: AppStrings.buttonNext,
                    textColor: AppColors.textDark,
                    borderColor1: AppColors.mainBlue,
                    borderColor2: Colors.blue,
                    buttonColor1: AppColors.mainBlue,
                    buttonColor2: Colors.blue,
                    // borderColor: AppColors.mainBlue,
                    onPressed: () {}),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
