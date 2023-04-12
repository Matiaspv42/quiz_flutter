import 'package:flutter/material.dart';
import 'package:flutter_second_project/data/questions.dart';
import 'package:flutter_second_project/questions_screen.dart';
import 'package:flutter_second_project/results_screen.dart';
import 'package:flutter_second_project/start-screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({key}) : super(key: key);

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  List<String> selectedAnswer = [];

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    });
  }

  void onRestartQuiz() {
    setState(() {
      activeScreen = StartScreen(switchScreen);
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = ResultsScreen(
          selectedAnswer,
          onRestartQuiz: onRestartQuiz,
        );
      });
    }
  }

  @override
  Widget build(context) {
    return MaterialApp(
        home: Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Colors.purple),
        child: Center(
          child: activeScreen,
        ),
      ),
    ));
  }
}
