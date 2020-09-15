import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_field/Models/survey.dart';
import 'package:green_field/constants.dart';

import 'item.dart';

class Body extends StatelessWidget {
  final List<Survey> surveys = <Survey>[
    Survey("Capechino", "BCH Gạn lọc"),
    Survey("A2", "C2"),
    Survey("A3", "C3"),
    Survey("A3", "C3"),
    Survey("A3", "C3"),
    Survey("A3", "C3"),
    Survey("A3", "C3"),
    Survey("A3", "C3"),
    Survey("A3", "C3"),
    Survey("A2", "C2"),
    Survey("A3", "C3"),
    Survey("A3", "C3"),
    Survey("A3", "C3"),
    Survey("A3", "C3"),
    Survey("A3", "C3"),
    Survey("A3", "C3"),
    Survey("A3", "C3"),
  ];

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return _buildRow(surveys[index], index, context);
      },
      itemCount: surveys.length,
    );
  }

  Widget _buildRow(Survey survey, int index, BuildContext context) {
    return InkWell(
        onTap: () {
          log("item tapped");
          Navigator.pushNamed(context, 'survey');
        },
        child: Container(
            margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
            decoration: BoxDecoration(
                color: kPrimaryLightColor,
                borderRadius: BorderRadius.circular(20)),
            child: Container(
                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      survey.surveyName,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                    Text(survey.projectName,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w300),
                        textAlign: TextAlign.start)
                  ],
                ))));
  }
}
