import 'package:flutter/material.dart';
import 'package:green_field/Models/questionnaire.dart';

import 'package:green_field/Pages/Questionnaire/components/html_label.dart';
import 'package:green_field/Pages/Questionnaire/components/input_question.dart';

class Question extends StatelessWidget {
  final Structure questionaireStructure;
  const Question({Key key, this.questionaireStructure}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        HtmlLabel(questionaireStructure.questionNameHTMLText),
        InputQuestion(questionaireStructure),
        HtmlLabel(questionaireStructure.questionNameHTMLTextFooter),
      ],
    ));
  }
}
