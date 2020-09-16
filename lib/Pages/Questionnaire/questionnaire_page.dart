import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:green_field/Models/questionnaire.dart';
import 'package:green_field/constants.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class QuestionnairePage extends StatefulWidget {
  @override
  _QuestionnairePageState createState() => _QuestionnairePageState();
}

Future<QuestionaireStructureRoot> fetchAlbum() async {
  final response =
      await http.get('http://50b4c3749e87.ngrok.io/api/questionnaire_design');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return QuestionaireStructureRoot.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class _QuestionnairePageState extends State<QuestionnairePage> {
  bool isLastQuestion = false;
  bool isFirstQuestion = true;
  int currentQuestion = 0;
  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
        child: Scaffold(
            appBar: AppBar(title: const Text("Bảng câu hỏi X")),
            backgroundColor: kPrimaryLightColor,
            body: FutureBuilder<QuestionaireStructureRoot>(
              future: questionaireStructure,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return bodySection(snapshot.data);
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                // By default, show a loading spinner.
                return Center(child: CircularProgressIndicator());
              },
            )));
  }

  Future<QuestionaireStructureRoot> questionaireStructure;
  @override
  void initState() {
    super.initState();
    questionaireStructure = fetchAlbum();
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

  Widget mainSection(QuestionaireStructureRoot questionaireStructureRoot) {
    switch (
        questionaireStructureRoot.structure[currentQuestion].questionTypeID) {
      case 1:
        return getSA(questionaireStructureRoot, currentQuestion);
        break;
      default:
        return Center(child: Text("Hello"));
    }
  }

  Widget bodySection(QuestionaireStructureRoot questionaireStructureRoot) {
    return Column(
      children: <Widget>[
        Expanded(
          child: mainSection(questionaireStructureRoot),
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

  bool rememberMe = false;

  void _onRememberMeChanged(bool newValue) => setState(() {
        rememberMe = newValue;

        if (rememberMe) {
          // TODO: Here goes your functionality that remembers the user.
        } else {
          // TODO: Forget the user
        }
      });
  Widget getSA(QuestionaireStructureRoot questionaireStructureRoot,
      int currentQuestion) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Html(
            data: questionaireStructureRoot
                .structure[currentQuestion].questionNameHTMLText),
        Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      Checkbox(value: true, onChanged: _onRememberMeChanged),
                      Text(questionaireStructureRoot.structure[currentQuestion]
                              .answer[index].answerText +
                          "")
                    ],
                  );
                },
                itemCount: questionaireStructureRoot
                    .structure[currentQuestion].answer.length))
      ],
    );
  }
}
