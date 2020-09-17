import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:green_field/Models/questionnaire.dart';
import 'package:green_field/Pages/Questionnaire/components/multi_choice.dart';
import 'package:green_field/Pages/Questionnaire/components/single_choice.dart';

class InputQuestion extends StatelessWidget {
  final Structure questionaireStructure;
  const InputQuestion(this.questionaireStructure, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (questionaireStructure.questionTypeID == 1) {
      return SingleChoice(questionaireStructure);
    }
    if (questionaireStructure.questionTypeID == 2) {
      return MultiChoice(questionaireStructure.answer);
    }
    if (questionaireStructure.questionTypeID > 2) {
      return MultiChoice(questionaireStructure.answer);
    }
  }
}
