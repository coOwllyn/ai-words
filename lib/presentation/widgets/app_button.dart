import 'package:flutter/material.dart';
import 'package:flutter_words/presentation/style/app_text_style.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.name,
    required this.textColor,
    required this.borderColor1,
    required this.borderColor2,
    required this.buttonColor1,
    required this.buttonColor2,
    required this.onPressed,
  });

  final String name;
  final Color textColor;
  final Color borderColor1;
  final Color borderColor2;
  final Color buttonColor1;
  final Color buttonColor2;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [borderColor1, borderColor2],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            )),
        child: Container(
          alignment: Alignment.center,
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                buttonColor1,
                buttonColor2,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
          child: Text(name,
              style: getHeaderStyle(
                color: textColor,
                fontSize: 16,
              )),
        ),
      ),
    );
  }
}
