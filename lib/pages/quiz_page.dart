import 'package:flutter/material.dart';
import '../utils/question.dart';
import '../utils/quiz.dart';
import '../UI/answer_button.dart';
import '../UI/questionText.dart';
import '../UI/correctWrongOverlay.dart';
import '../pages/scorePage.dart';

class QuizPage extends StatefulWidget {
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {

  Question currentQuestion;
  Quiz quiz = new Quiz([
    new Question("Elon Musk is human.", false),
    new Question("Pizza is healthy.", false),
    new Question("Flutter is awesome.", true),
  ]);
  String questionText;
  int questionNumber;
  bool isCorrect;
  bool showOverlay = false;

  @override
  void initState() {
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;
  }

  void handleAnswer (bool answer) {
    isCorrect = (answer == currentQuestion.answer);
    quiz.answer(isCorrect);
    this.setState(() {
      showOverlay = true;
      isCorrect = isCorrect;
    });
  }

  void hideOverlay() {
    if (quiz.length == questionNumber) {
      Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new ScorePage(quiz.score, quiz.length)), (Route route) => route == null);
      return;
    }
    currentQuestion = quiz.nextQuestion;
    this.setState(() {
      questionText = currentQuestion.question;
      questionNumber = quiz.questionNumber;
      showOverlay = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return (new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
          children: <Widget>[
            new AnswerButton(true, () => handleAnswer(true)),
            new QuestionText(questionText, questionNumber),
            new AnswerButton(false, () => handleAnswer(false))
          ],
        ),
        showOverlay ? new CorrectWrongOverlay(isCorrect, () => hideOverlay()) : new Container(),
      ],
    ));
  }
}
