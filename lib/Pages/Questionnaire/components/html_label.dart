import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class HtmlLabel extends StatelessWidget {
  final String data;
  const HtmlLabel(this.data, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Html(data: data),
    );
  }
}
