import 'package:flutter/material.dart';
import 'package:rolexapp/widget/questions_quiz.dart';
import 'package:rolexapp/widget/restartScreen.dart';
import 'package:rolexapp/widget/welcome_screen.dart';
import 'package:rolexapp/data/info.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _StateQuiz();
  }
}

class _StateQuiz extends State<Quiz> {
  //this variable is used to detrmine wish screen will show up
  String activeScreen = 'Welcome-screen';
  //this is the function responsable for switch screen
  void switchScreen() {
    if (activeScreen == 'Welcome-screen') {
      setState(() {
        activeScreen = 'Questions-Screen';
      });
    } else if (activeScreen == 'Restart-Screen') {
      setState(() {
        activeScreen = 'Welcome-screen';
      });
    }
  }

  List<String> onSelectedAnswer = [];
  List<String> onSelectedAnswer1 = [];
  void onSelected(String answer) {
    onSelectedAnswer.add(answer);
    onSelectedAnswer1 = onSelectedAnswer;
    if (questions.length == onSelectedAnswer.length) {
      setState(() {
        onSelectedAnswer = [];
        activeScreen = 'Restart-Screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //like this we show the widget screen we need to show
    Widget screenApp = WelcomeScreen(switchScreen);
    if (activeScreen == 'Questions-Screen') {
      screenApp = QuestionsQuiz(
        onSelectedQuestions: onSelected,
      );
    } else if (activeScreen == 'Restart-Screen') {
      screenApp = RestartScreen(
        selectedAnswer: onSelectedAnswer1,
        switchScreen: switchScreen,
      );
    } else if (activeScreen == 'Restart-Screen') {
      screenApp = WelcomeScreen(switchScreen);
    }
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(156, 6, 103, 58),
            Color.fromARGB(156, 10, 146, 82),
            Color.fromARGB(156, 12, 172, 98),
            Color.fromARGB(156, 17, 217, 124),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: screenApp,
    );
  }
}
