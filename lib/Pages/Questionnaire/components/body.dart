import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:green_field/Models/questionnaire.dart';
import 'package:green_field/Pages/Questionnaire/components/single_choice.dart';
import 'package:green_field/constants.dart';

class Body extends StatefulWidget {
  final QuestionaireStructureRoot structure;

  final int currentQuestion;
  const Body(this.structure, this.currentQuestion, {Key key}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Expanded(child: getBody());
  }

  Widget getBody() {
    if (widget.structure.structure[widget.currentQuestion].questionTypeID == 1)
      return SingleChoice(widget.structure.structure[widget.currentQuestion]);
    else
      return Text("abc");
  }
}
