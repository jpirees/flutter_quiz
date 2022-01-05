import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  const Answer({
    Key? key,
    required this.answer,
    required this.onSelected,
  }) : super(key: key);

  final String answer;
  final Function() onSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        onPressed: onSelected,
        child: Text(answer),
      ),
    );
  }
}
