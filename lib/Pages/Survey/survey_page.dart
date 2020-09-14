import 'package:flutter/material.dart';
import 'package:green_field/Pages/Survey/components/body.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class SurveyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
        child: Scaffold(
            appBar: AppBar(
              title: Text("Dự án chi tiết"),
            ),
            body: Body(),
            floatingActionButton:
                FloatingActionButton(onPressed: null, child: Icon(Icons.add))));
  }
}
