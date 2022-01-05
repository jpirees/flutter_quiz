import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({
    Key? key,
    required this.points,
    required this.reset,
  }) : super(key: key);

  final int points;
  final void Function() reset;

  String get resultPhrase {
    if (points < 7) {
      return 'Não foi dessa vez!\nVocê obteve $points pontos.';
    } else {
      return 'Parabéns!\nVocê obteve $points pontos.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            resultPhrase,
            style: TextStyle(fontSize: 28),
          ),
        ),
        ElevatedButton(
          onPressed: reset,
          child: Text('Reiniciar'),
        ),
      ],
    );
  }
}
