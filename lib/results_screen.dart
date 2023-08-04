import 'package:flutter/material.dart';
import 'package:quizz_app_flutter/data/quiestions.dart';
import 'package:quizz_app_flutter/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key,
      required this.selectedAnswers,
      required this.onSwitchScreen,
      required this.resetAnswers});

  final List<String> selectedAnswers;
  final void Function(String) onSwitchScreen;
  final void Function() resetAnswers;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'answer': questions[i].answers[0],
        'user_answer': selectedAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final numberCorrectAnswers = summaryData
        .where((data) => data['answer'] == data['user_answer'])
        .length;
    return SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: <TextSpan>[
                      const TextSpan(
                          text: 'You answered ',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 1.5,
                          )),
                      TextSpan(
                          text:
                              '$numberCorrectAnswers out of $numTotalQuestions',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 98, 117, 210),
                            height: 1.5,
                          )),
                      const TextSpan(
                          text: ' questions correctly!',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 1.5,
                          )),
                    ])),
                const SizedBox(height: 40),
                QuestionsSummary(summaryData),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    onSwitchScreen('start-screen');
                    resetAnswers();
                  },
                  child: const Text('Restart Quiz'),
                ),
              ]),
        ));
  }
}
