import 'package:flutter/material.dart';
import 'package:quizz_flutter/data/questions.dart';
import 'package:quizz_flutter/questions_screen.dart';
import 'package:quizz_flutter/results_screen.dart';
import 'package:quizz_flutter/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget ScreenWidget = StartScreen(switchScreen);

    // if (activeScreen == 'questions-screen') {
    //   ScreenWidget = const QuestionScreen();
    // }
    ScreenWidget = activeScreen == 'start-screen'
        ? StartScreen(switchScreen)
        : QuestionScreen(onSelectedAnswer: chooseAnswer);

    if (activeScreen == 'results-screen') {
      ScreenWidget = ResultsScreen(
        chooseAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 152),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: ScreenWidget,
        ),
      ),
    );
  }
}
