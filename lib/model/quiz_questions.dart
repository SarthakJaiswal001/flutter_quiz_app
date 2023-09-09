class QuizQuestions{
  const QuizQuestions(this.question, this.answer);
  final String question;
  final List<String> answer;
  List<String> getShuffledAnswers(){
    final shuffle = List.of(answer);
    shuffle.shuffle();
    return shuffle;
  }
}