import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rolexapp/data/info.dart';
import 'package:rolexapp/widget/questions_summary.dart';

class RestartScreen extends StatelessWidget {
  const RestartScreen({
    super.key,
    required this.switchScreen,
    required this.selectedAnswer,
  });
  final void Function() switchScreen;
  final List<String> selectedAnswer;

  List<Map<String, Object>> summaryData() {
    List<Map<String, Object>> summaryData = [];
    for (int i = 0; i < selectedAnswer.length; i++) {
      summaryData.add({
        'questions-index': i,
        'text-questions': questions[i].text,
        'correct-answer': questions[i].answers[0],
        'selected-answer': selectedAnswer[i],
      });
    }
    return summaryData;
  }

  @override
  Widget build(BuildContext context) {
    final summarydata = summaryData();
    final correctquestions = questions.length;
    final selectedquestions = summarydata.where((data) {
      return data['correct-answer'] == data['selected-answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo2.png',
              width: 40,
              height: 40,
              alignment: Alignment.topCenter,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'You Answred $selectedquestions Of The $correctquestions Correctly',
              style: GoogleFonts.abel(
                color: Colors.white,
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData: summarydata),
            const SizedBox(
              height: 30,
            ),
            OutlinedButton(
              onPressed: switchScreen,
              style: OutlinedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 169, 154, 19),
              ),
              child: Text(
                'Restart The Quiz',
                style: GoogleFonts.abel(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
