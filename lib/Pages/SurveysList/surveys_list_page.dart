import 'package:flutter/material.dart';

import 'components/body.dart';

class SurveysListPage extends StatelessWidget {
  final String username;
  SurveysListPage({this.username});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chọn dự án"),
      ),
      body: Body(),
    );
  }
}
