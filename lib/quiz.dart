import 'package:flutter/material.dart';
import 'package:flutter_quiz/answer.dart';
import 'package:flutter_quiz/question.dart';

class Quiz extends StatelessWidget {
  const Quiz({
    Key? key,
    required this.questions,
    required this.questionSelected,
    required this.answer,
  }) : super(key: key);

  final List<Map<String, Object>> questions;
  final int questionSelected;
  final void Function(int) answer;

  bool get haveSelectedQuestions {
    return questionSelected < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answers = haveSelectedQuestions
        ? questions[questionSelected].cast()['answers']
        : [];

    return Column(
      children: [
        Question(question: questions[questionSelected]['text'].toString()),
        ...answers.map((res) {
          return Answer(
            answer: res['text'].toString(),
            onSelected: () => answer(int.parse(res['point'].toString())),
          );
        }).toList(),
      ],
    );
  }
}
