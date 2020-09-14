import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_field/Models/survey.dart';

import 'item.dart';

class Body extends StatelessWidget {
  final List<Survey> surveys = <Survey>[
    Survey("Capechino", "BCH Gạn lọc"),
    Survey("A2", "C2"),
    Survey("A3", "C3")
  ];

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return ListView.builder(
        itemCount: surveys.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildRow(surveys[index], index, context);
        });
  }

  Widget _buildRow(Survey survey, int index, BuildContext context) {
    return InkWell(
      onTap: () {
        log("item tapped");
        Navigator.pushNamed(context, 'survey');
      },
      child:
          Item(surveyname: survey.surveyName, projectname: survey.projectName),
    );
  }
}
