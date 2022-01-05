import 'package:flutter/material.dart';
import 'package:flutter_quiz/quiz.dart';
import 'package:flutter_quiz/result.dart';

main() => runApp(QuizApp());

class _QuizAppState extends State<QuizApp> {
  var _questionSelected = 0;
  var _totalPoints = 0;

  final _questions = const [
    {
      'text': 'Qual a cor mais utilizada?',
      'answers': [
        {'text': 'Azul', 'point': 1},
        {'text': 'Preto', 'point': 1},
        {'text': 'Verde', 'point': 1},
        {'text': 'Branca', 'point': 4},
      ],
    },
    {
      'text': 'Qual animal vive na água?',
      'answers': [
        {'text': 'Peixe', 'point': 3},
        {'text': 'Cachorro', 'point': 1},
        {'text': 'Gato', 'point': 1},
        {'text': 'Coelho', 'point': 1},
      ],
    },
    {
      'text': 'Qual é o mês que não termina com a letra O?',
      'answers': [
        {'text': 'Janeiro', 'point': 1},
        {'text': 'Abril', 'point': 3},
        {'text': 'Lua', 'point': 1},
        {'text': 'Maio', 'point': 1},
      ],
    },
  ];

  void _answer(int point) {
    if (haveSelectedQuestions) {
      setState(() {
        _questionSelected++;
        _totalPoints += point;
      });
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionSelected = 0;
      _totalPoints = 0;
    });
  }

  bool get haveSelectedQuestions {
    return _questionSelected < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz'),
        ),
        body: haveSelectedQuestions
            ? Quiz(
                questions: _questions,
                questionSelected: _questionSelected,
                answer: _answer,
              )
            : Result(
                points: _totalPoints,
                reset: _resetQuiz,
              ),
      ),
    );
  }
}

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}
