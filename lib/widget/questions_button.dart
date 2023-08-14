import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuestionsButton extends StatelessWidget {
  const QuestionsButton({super.key, required this.answer, required this.pres});
  //this variable is argument used to store the answer of the quiz
  final String answer;
  //call a function from another page
  final void Function() pres;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: pres,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 169, 154, 19),
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
        //like this feature named shape is used to change the shape of any button
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: Text(
        answer,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
