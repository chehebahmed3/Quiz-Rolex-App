import 'package:flutter/material.dart';
import 'package:rolexapp/data/info.dart';
import 'package:rolexapp/widget/questions_button.dart';

class QuestionsQuiz extends StatefulWidget {
  const QuestionsQuiz({super.key, required this.onSelectedQuestions});
  final void Function(String answer) onSelectedQuestions;
  @override
  State<QuestionsQuiz> createState() {
    return _StateQuestionsQuiz();
  }
}

class _StateQuestionsQuiz extends State<QuestionsQuiz>
    with SingleTickerProviderStateMixin {
  //used this variable to store the numbering of the questions quiz
  var currentQuestionsIndex = 0;
  //this is the function to acces to the questions by using the button
  void pres(String answer) {
    //widget in this case is to acces to the QuestionQuiz class
    widget.onSelectedQuestions(answer);
    setState(() {
      currentQuestionsIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestions = questions[currentQuestionsIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              currentQuestions.text,
              width: 250,
              height: 300,
            ),

            const SizedBox(
              height: 30,
            ),
            //we used the 3 points to speading from the iterable to list of string
            //the map feature is used to create another list of the same elememt with another type
            ...currentQuestions.shuffleTheThing().map((item) {
              return QuestionsButton(
                answer: item,
                pres: () {
                  pres(item);
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
