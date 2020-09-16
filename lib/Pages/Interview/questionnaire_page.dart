import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:green_field/constants.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class QuestionnairePage extends StatefulWidget {
  @override
  _QuestionnairePageState createState() => _QuestionnairePageState();
}

class _QuestionnairePageState extends State<QuestionnairePage> {
  bool isLastQuestion = false;
  bool isFirstQuestion = true;
  int currentQuestion = 0;
  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
        child: Scaffold(
            appBar: AppBar(title: const Text("Bảng câu hỏi")),
            backgroundColor: kPrimaryLightColor,
            body: bodySection));
  }

  Function get pressNext {
    return isLastQuestion ? saveFunc : nextFunc;
  }

  Function get pressBack {
    return isFirstQuestion ? null : backFunc;
  }

  void nextFunc() {
    setState(() {
      if (!isLastQuestion) {
        currentQuestion++;
        isLastQuestion = currentQuestion == 5 ? true : false;
        isFirstQuestion = currentQuestion == 0 ? true : false;
      }
    });
    log("click next $currentQuestion");
  }

  void backFunc() {
    setState(() {
      if (!isFirstQuestion) {
        currentQuestion--;
        isLastQuestion = currentQuestion == 5 ? true : false;
        isFirstQuestion = currentQuestion == 0 ? true : false;
      }
    });
    log("click next $currentQuestion");
  }

  void saveFunc() {
    log("click save $currentQuestion");
  }

  Widget get mainSection {
    return Center(child: Text("STT _$currentQuestion"));
  }

  Widget get bodySection {
    return Column(
      children: <Widget>[
        Expanded(
          child: mainSection,
        ),
        Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Row(
              children: <Widget>[
                RaisedButton(
                  color: kPrimaryColor,
                  onPressed: pressBack,
                  child: new Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                Expanded(child: SizedBox()),
                RaisedButton(
                  color: kPrimaryColor,
                  onPressed: pressNext,
                  child: new Icon(
                    isLastQuestion ? Icons.check : Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ),
              ],
            ))
      ],
    );
  }
}
