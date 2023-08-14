class QuizQuestions {
  QuizQuestions(this.text, this.answers);
  final String text;
  final List<String> answers;

  List<String> shuffleTheThing() {
    //List.of mean every  get every element of the list
    final shuffleList = List.of(answers);
    shuffleList.shuffle();
    return shuffleList;
  }
}
