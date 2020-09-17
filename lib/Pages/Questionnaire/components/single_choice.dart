import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:green_field/Models/questionnaire.dart';
import 'package:green_field/constants.dart';

class SingleChoice extends StatefulWidget {
  final Structure structure;
  const SingleChoice(this.structure, {Key key}) : super(key: key);
  @override
  _SingleChoiceState createState() => _SingleChoiceState();
}

class _SingleChoiceState extends State<SingleChoice> {
  changeValue(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  int selectedRadio = -1;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return Html(data: widget.structure.questionNameHTMLText);
        }
        if (index == widget.structure.answer.length + 1) {
          return Html(data: widget.structure.questionNameHTMLTextFooter);
        }
        return Container(
            color: index % 2 == 0 ? Color(0xFFBBDEFB) : Color(0xFFF8BBD0),
            child: RadioListTile(
              title: Html(
                  data:
                      kHtmlData), // widget.structure.answer[index - 1].answerText),
              activeColor: kPrimaryColor,
              value: index,
              groupValue: selectedRadio,
              
              onChanged: (val) {
                changeValue(val);
              },
              controlAffinity: ListTileControlAffinity.leading,
              //  <-- leading Checkbox
            ));
        // Checkbox(value: true, onChanged: null),
        // Expanded(child: Html(data: answer[index].answerText));
      },
      itemCount: widget.structure.answer.length + 2,
    );
  }
}
