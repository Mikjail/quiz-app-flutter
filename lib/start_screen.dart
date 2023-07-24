import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/quiz-logo.png',
                width: 300,
                height: 300,
                color: const Color.fromARGB(135, 255, 255, 255)),
            const SizedBox(height: 50),
            const Text('Learn Flutter',
                style: TextStyle(
                    fontSize: 40, color: Color.fromARGB(255, 255, 255, 255))),
            const SizedBox(height: 20),
            OutlinedButton.icon(
              onPressed: startQuiz,
              style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 40,
                  ),
                  foregroundColor: Colors.white),
              icon: const Icon(Icons.play_arrow, size: 30),
              label: const Text(
                'Start Quiz',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ]),
    );
  }
}
