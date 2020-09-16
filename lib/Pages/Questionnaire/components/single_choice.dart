import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:green_field/Models/questionnaire.dart';

class SingleChoice extends StatelessWidget {
  final List<Answer> answer;
  const SingleChoice(this.answer, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Container(
            color: index % 2 == 0 ? Colors.blue : Colors.pink,
            child: CheckboxListTile(
              title: Html(data: answer[index].answerText),
              value: true,
              onChanged: (newValue) {},
              controlAffinity:
                  ListTileControlAffinity.leading, //  <-- leading Checkbox
            ));
        // Checkbox(value: true, onChanged: null),
        // Expanded(child: Html(data: answer[index].answerText));
      },
      itemCount: answer.length,
    ));
  }
}
