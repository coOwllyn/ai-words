import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_words/core/resources/app_strings.dart';
import 'package:flutter_words/presentation/screens/home_screen/cards_bloc/cards_bloc.dart';
import 'package:flutter_words/presentation/screens/home_screen/widgets/word_card.dart';
import 'package:flutter_words/presentation/style/app_colors.dart';
import 'package:flutter_words/presentation/widgets/app_button.dart';
import 'package:flutter_words/presentation/widgets/loading_column.dart';

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
      body: BlocConsumer<CardsBloc, CardsState>(
        listener: (context, state) {
          if (state is CardsError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage)),
            );
          }
        },
        builder: (context, state) {
          if (state is CardsLoading) {
            return const LoadingColumn(message: "Loading");
          }
          if (state is CardsLoadSuccess) {
            final bloc = context.read<CardsBloc>();
            final card = state.cards.firstWhere(
                (element) => element.orderNr == (state.currentCardIndex + 1));
            return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WordCard(
                    cardWord: card.name,
                    cardTranslation: card.translation,
                    cardImage: card.image,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                    child: Row(
                      children: [
                        if (state.currentCardIndex > 0)
                          Expanded(
                            child: AppButton(
                                name: AppStrings.buttonBack,
                                textColor: AppColors.textDark,
                                borderColor1: AppColors.mainBlue,
                                borderColor2: Colors.blue,
                                buttonColor1: AppColors.bgDark,
                                buttonColor2: AppColors.bgDark,
                                onPressed: () {
                                  bloc.add(const BackCardEvent());
                                }),
                          ),
                        const SizedBox(width: 15),
                        if (state.currentCardIndex < 4)
                          Expanded(
                            child: AppButton(
                                name: AppStrings.buttonNext,
                                textColor: AppColors.textDark,
                                borderColor1: AppColors.mainBlue,
                                borderColor2: Colors.blue,
                                buttonColor1: AppColors.mainBlue,
                                buttonColor2: Colors.blue,
                                // borderColor: AppColors.mainBlue,
                                onPressed: () {
                                  if (state.currentCardIndex !=
                                      state.cards.length - 1) {
                                    debugPrint('click');
                                    bloc.add(const NextCardEvent());
                                  }
                                }),
                          ),
                      ],
                    ),
                  )
                ]);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
