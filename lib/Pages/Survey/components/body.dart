import 'package:flutter/material.dart';
import 'package:green_field/Models/respondent.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  static List<Respondent> respondents = <Respondent>[
    Respondent("123", "123", "LÊ MINH TRÍ", "0936287592"),
    Respondent("123", "123", "LÊ MINH TRÍ", "0936287592"),
    Respondent("123", "123", "LÊ MINH TRÍ", "0936287592"),
    Respondent("123", "123", "LÊ MINH TRÍ", "0936287592"),
    Respondent("123", "123", "LÊ MINH TRÍ", "0936287592"),
    Respondent("123", "123", "ABC", "0936287592")
  ];
  List<Respondent> searchRespondents = List.from(respondents);
  TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(2),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  hintText: 'Search Text Here...',
                ),
                onChanged: onItemChanged,
              )),
          Expanded(child: getBody())
        ],
      ),
    );
  }

  Widget _buildRow(Respondent respondent) {
    return ListTile(
      title: Text(respondent.respondentName),
      trailing: Text(respondent.respondentPhoneNumber),
    );
  }

  void onItemChanged(String value) {
    print("search text changed");
    setState(() {
      searchRespondents = respondents
          .where((element) => element.respondentName
              .toUpperCase()
              .contains(value.toUpperCase()))
          .toList();
    });
  }

  Widget getBody() {
    return searchRespondents.length == 0
        ? Center(
            child: Text("No respondent"),
          )
        : ListView.builder(
            itemCount: searchRespondents.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildRow(searchRespondents[index]);
            });
  }
}
