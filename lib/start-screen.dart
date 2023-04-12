import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {key}) : super(key: key);

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Para disminuir opacity, podemos usar el widget opacity pero es malo en cuanto a rendimiento
        // Opacity(
        //   opacity: 0.6,
        //   child: Image.asset(
        //     'assets/images/quiz-logo.png',
        //     width: 300,
        //   ),
        // ),
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 300,
          color: const Color.fromARGB(127, 255, 254, 254),
        ),
        const SizedBox(
          height: 80,
        ),
        Text('Learn Flutter the fun way!',
            style: GoogleFonts.lato(color: Colors.white, fontSize: 24)),
        const SizedBox(
          height: 30,
        ),
        OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.arrow_right_alt),
            label: Text(
              'Start quiz',
              style: TextStyle(color: Colors.white),
            ))
      ],
    );
  }
}
