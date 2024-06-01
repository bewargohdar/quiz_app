import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OnlineStartScreen extends StatelessWidget {
  const OnlineStartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 350,
            color: const Color.fromARGB(180, 255, 255, 255),
          ),
          const SizedBox(
            height: 80,
          ),
          const Text(
            'Learn Flutter the Fun Way!',
            style: TextStyle(
              fontSize: 30,
              fontFamily: 'Roboto',
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: TextButton.icon(
              onPressed: () {
                startQuiz();
              },
              icon: const Icon(
                Icons.arrow_right_alt,
                color: Colors.white,
              ),
              label: const Text('Start Quiz',
                  style: TextStyle(
                      fontSize: 20, color: Colors.white, fontFamily: 'Roboto')),
            ),
          ),
        ],
      ),
    );
  }
}
