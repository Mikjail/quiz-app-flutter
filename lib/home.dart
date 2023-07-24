import 'package:flutter/material.dart';
import 'package:quizz_app_flutter/data/quiestions.dart';
import 'package:quizz_app_flutter/questions_screen.dart';
import 'package:quizz_app_flutter/results_screen.dart';
import 'package:quizz_app_flutter/start_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> selectedAnswer = [];
  var activeScreen = 'start-screen';
  // Widget? activeScreen;
  // // This widget is the root of your application.

  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      // activeScreen = const QuestionScreen();
      activeScreen = 'question-screen';
    });
  }

  void selectAnswer(String answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'question-screen') {
      screenWidget = QuestionScreen(onSelectAnswer: selectAnswer);
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(selectedAnswers: selectedAnswer);
    }

    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 98, 52, 176),
                  Color.fromARGB(255, 119, 58, 203)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Center(
              child: screenWidget,
            )),
      ),
    );
  }
}
