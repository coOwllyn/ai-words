import 'package:flutter/material.dart';
import 'package:flutter_words/presentation/style/app_colors.dart';
import 'package:flutter_words/presentation/style/app_text_style.dart';

class LoadingColumn extends StatelessWidget {
  const LoadingColumn({required this.message, super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(color: AppColors.mainPurple),
          const SizedBox(height: 10),
          Text(
            '$message...',
            style: getBodyStyle(fontSize: 16, color: AppColors.mainPurple),
          ),
        ],
      ),
    );
  }
}