import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:green_field/Models/questionnaire.dart';
import 'package:green_field/Pages/Questionnaire/components/body.dart';
import 'package:green_field/Pages/Questionnaire/components/input_question.dart';
import 'package:green_field/Pages/Questionnaire/components/question.dart';
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

Widget get lv {
  return ListView.builder(
    itemCount: 100,
    itemBuilder: (context, index) {
      return Text("item $index");
    },
  );
}

class _QuestionnairePageState extends State<QuestionnairePage> {
  bool isLastQuestion = false;
  bool isFirstQuestion = true;
  int currentQuestion = 0;
  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
        child: SafeArea(
            child: Scaffold(
                // appBar: AppBar(title: const Text("Bảng câu hỏi X")),
                backgroundColor: kPrimaryLightColor,
                body: FutureBuilder<QuestionaireStructureRoot>(
                  future: questionaireStructure,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(children: <Widget>[
                        Text("header", style: TextStyle(fontSize: 40)),
                        Expanded(
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: 100,
                                itemBuilder: (context, index) {
                                  return Text("item $index",
                                      style: TextStyle(fontSize: 20));
                                })),
                        Text("footer", style: TextStyle(fontSize: 40)),
                      ]);
                      // Column(children: <Widget>[
                      //   SingleChildScrollView(
                      //       child: Expanded(
                      //     child: Row(
                      //       children: [
                      //         Text("header"),
                      //         ListView.builder(
                      //           shrinkWrap: true,
                      //           itemCount: 100,
                      //           itemBuilder: (context, index) {
                      //             return Text("item $index");
                      //           },
                      //         )
                      //       ],
                      //     ),
                      //   )),
                      //   Text("footer")
                      // ]);

                      // bodySection(snapshot.data);
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    // By default, show a loading spinner.
                    return Center(child: CircularProgressIndicator());
                  },
                ))));
  }

  Widget get footerSection {
    return Container(
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
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ),
          ],
        ));
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
        isLastQuestion = currentQuestion == 100 ? true : false;
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
}
